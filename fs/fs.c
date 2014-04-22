#include    "fs.h"
#include    "../kernel/kernel.h"
#include    <elf.h>

//#define LOG

#ifdef  LOG
#define fs_log(fmt,...) printk("[FS  ] : "fmt,##__VA_ARGS__)
#else
#define fs_log(fmt,...)
#endif

#define eprint(fmt,...) printk("%4d "fmt" %s\n",__LINE__,##__VA_ARGS__,__func__)

#include <z.h>

MinixSuperBlock *super;
MinixInode root_inode;

#define MIN(a,b)    ((a) < (b) ? (a) : (b))
#define MAX(a,b)    ((a) > (b) ? (a) : (b))
        
static int do_read(MinixInode *inode,void *buffer,off_t offset,count_t count){
    zone_t  zone = (offset + BLOCK_SIZE - 1) / BLOCK_SIZE;
    static char   block[BLOCK_SIZE];
    count_t read_count = BLOCK_SIZE - (offset % BLOCK_SIZE);
    read_count = MIN(count ,read_count);
    if(read_count){
        try(ERROR == ,zone_rw(inode,READ,zone,block),throw e_zone_rw);
        memcpy(buffer,block + (offset % BLOCK_SIZE),read_count);
    }
    count -= read_count;
    zone++;
    /*! ~~~~~~~~~~~~~~~~~~~~~~~ 第二步,拷贝BLOCK_SIZE对齐的块 ~~~~~~~~~~~~~~~~~~ ~*/
    count_t n = count / BLOCK_SIZE;
    foreach(i,0,n){
        try(ERROR == ,zone_rw(inode,READ,zone,buffer + read_count),throw e_zone_rw);
        count -= BLOCK_SIZE;
        read_count += BLOCK_SIZE;
        zone++;
    }
    /*! ~~~~~~~~~~~~~~~~~~~~~ 第三步,拷贝剩下的不足BLOCK_SIZE的块 ~~~~~~~~~~~~~ !*/
    if(count){
        try(ERROR ==,zone_rw(inode,READ,zone,block),throw e_zone_rw);
        memcpy(buffer + read_count,block,count);
        read_count += count;
    }

    catch(e_zone_rw){ 
        return read_count;
    }
}

/*! 测试加载ELF文件 !*/
#if 1
static void load_elf(Object *this) {
    File *file = _FILE(this);
    static Elf32_Ehdr ehdr;
    static Elf32_Phdr phdr;
    static Elf32_Shdr shdr;
    MinixInode *inode = &(file->inode);
    int (*fn)(void);
    do_read(inode,&ehdr,0,sizeof(ehdr));
    do_read(inode,&phdr,ehdr.e_phoff,ehdr.e_phentsize);
    fn = (void*)ehdr.e_entry;
#if 0
    for(int i = 0;i < (phdr->p_memsz + BLOCK_SIZE - 1) / BLOCK_SIZE;i++){
        if(ERROR == zone_rw(inode,READ,zone + i,buffer)) panic("-_-|||\n");
        memcpy((void*)(ehdr->e_entry + i * BLOCK_SIZE),buffer,BLOCK_SIZE);
    }
#endif
    do_read(inode,&shdr,ehdr.e_shoff,ehdr.e_shentsize);
    for(int i = 0;i < ehdr.e_shnum;i++){
        if((shdr.sh_type == SHT_PROGBITS) && (shdr.sh_flags & SHF_ALLOC)){
            printk("addr: %8p offset : %4x size : %4x\n",shdr.sh_addr,shdr.sh_offset,shdr.sh_size);
            do_read(inode,(void*)shdr.sh_addr,shdr.sh_offset,shdr.sh_size);
        }
        do_read(inode,&shdr,ehdr.e_shoff + sizeof(shdr),);
    }
    ret(this->admit,OK);
    fn();
    run(MM_PID,CLOSE,0,0,0);
}
#endif

static void fs_read(Object *this){
    File    *file = _FILE(this);
    count_t read_count;
    read_count = do_read(&(file->inode),this->buffer,file->offset,this->count);
    file->offset += read_count;
    ret(this->admit,read_count); 
}

/*! !*/
static void fs_write(Object *this){
    File    *file = _FILE(this);
    void *buffer = this->buffer;
    count_t count = this->count;
    count_t write_count;
    static char buff[BLOCK_SIZE];

    zone_t  zone = (file->offset + BLOCK_SIZE - 1) / BLOCK_SIZE;
    off_t   offset = file->offset;
    if(offset + count > file->inode.i_size){
        count = file->inode.i_size - offset;
    }

    fs_log("write %d bytes offset %d for %s\n",count,zone,this->name);
    /*! ~~~~~~~~~~~~~~~~~~~ 第一步,拷贝开头不足一个区部分 ~~~~~~~~~~~~~~~~~~~~~~~ !*/
    write_count = BLOCK_SIZE - (offset % BLOCK_SIZE);
    write_count = MIN(count ,write_count);
    if(write_count){
        try(ERROR == ,zone_rw(&(file->inode),READ,zone,buff),throw e_zone_rw);
        memcpy(buff + (offset % BLOCK_SIZE),buffer,write_count);
        try(ERROR == ,zone_rw(&(file->inode),WRITE,zone,buff),throw e_zone_rw);
    }
    count -= write_count;
    zone++;
    /*! ~~~~~~~~~~~~~~~~~~~~~~~ 第二步,拷贝BLOCK_SIZE对齐的块 ~~~~~~~~~~~~~~~~~~ ~*/
    count_t n = count / BLOCK_SIZE;
    foreach(i,0,n){
        memcpy(buff,buffer + write_count,BLOCK_SIZE);
        try(ERROR == ,zone_rw(&(file->inode),WRITE,zone,buff),throw e_zone_rw);
        count -= BLOCK_SIZE;
        write_count += BLOCK_SIZE;
        zone++;
    }
    /*! ~~~~~~~~~~~~~~~~~~~~~ 第三步,拷贝剩下的不足BLOCK_SIZE的块 ~~~~~~~~~~~~~ !*/
    if(count){
        memcpy(buff,buffer + write_count,count);
        try(ERROR ==,zone_rw(&(file->inode),WRITE,zone,buff),throw e_zone_rw);
        write_count += write_count;
    }

    catch(e_zone_rw){ 
        this->offset += write_count;
        ret(this->admit,write_count); 
    }
}

static void fs_close(Object *this){
    printk("\eRFIXME\ew : FS colse\n");
    run(MM_PID,CLOSE,0,0,0);
}

static void fs_open(Object *this){
    MinixInode *inode = eat_path(this->buffer);
    fs_log("|OPEN| inode %p\n",inode);
    if(!isNullp(inode)){
        id_t id = fork();
        if(0 == id){
            File *file = (void*)self();
            TASK(file)->father = TASK(this->admit);
            memcpy(self()->name,this->buffer,strlen(this->buffer) + 1);
            memcpy(&(file->inode),inode,sizeof(MinixInode));
            file->offset = 0;
            hook(READ,fs_read);
            hook(WRITE,fs_write);
            hook(RUN,load_elf);
            hook(CLOSE,fs_close);
            dorun();
        }else if(id > 0){
            ret(this->admit,id);
        }
    }
    ret(this->admit,ERROR);
}

static void fs_init(void){
    hook(OPEN,fs_open);
    super = read_super(AT_PID);
    if(super == NULL) panic("\erDon't read super block!\ew\n");
    else{
        if(ERROR == get_inode(MINIX_ROOT_INO,&root_inode)) panic("\erDon't read inode block!\ew\n");
    }
}

int fs_main(void){
    fs_init();
    dorun();
    return 0;
}
