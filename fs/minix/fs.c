#include    "fs.h"
#include    "../kernel/kernel.h"

//#define LOG

#ifdef  LOG
#define fs_log(fmt,...) printk("[FS  ] : "fmt,##__VA_ARGS__)
#else
#define fs_log(fmt,...)
#endif

MinixSuperBlock *super;
MinixInode root_inode;

#define MIN(a,b)    ((a) < (b) ? (a) : (b))
#define MAX(a,b)    ((a) > (b) ? (a) : (b))

static char buff[BLOCK_SIZE];
        
static int do_read(MinixInode *inode,void *buffer,off_t offset,count_t count){
    zone_t  zone = offset / BLOCK_SIZE;
    static char   block[BLOCK_SIZE];
    count_t read_count = BLOCK_SIZE - (offset % BLOCK_SIZE);

    count = MIN(inode->i_size - offset,count);
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
        try(ERROR == ,zone_rw(inode,READ,zone,block),throw e_zone_rw);
        memcpy(buffer + read_count,block,count);
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

static void fs_read(object_t o,void *buffer,count_t count){
    count_t read_count;
    File *file = self()->private_data;
    fs_log("read %d bytes offset %d for %s\n",count,file->offset,self()->name);
    read_count = do_read(&(file->inode),buffer,file->offset,count);
    file->offset += read_count;
    ret(o,read_count); 
}

/*! !*/
static void fs_write(object_t o,void *buffer,count_t count){
    count_t write_count;
    File *file = self()->private_data;
    zone_t  zone = file->offset / BLOCK_SIZE;

    off_t   offset = file->offset;
    if(offset + count > file->inode.i_size){
        count = file->inode.i_size - offset;
    }

    fs_log("write %d bytes offset %d for %s\n",count,zone,self()->name);
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
        offset += write_count;
        ret(o,write_count); 
    }
}

static void fs_close(object_t o){
    ret(o,OK);
    kfree(self()->private_data);
    self()->private_data = NULL;
    run(MM_PID,CLOSE,0,0,0);
}

static void fs_seek(object_t o,int whence,off_t offset){
    File *file = self()->private_data;
    switch(whence){
    case SEEK_SET: file->offset = offset;break;
    case SEEK_CUR: file->offset += offset;break;
    case SEEK_END: file->offset = offset + file->inode.i_size;break;
    };
    ret(o,file->offset);
}

static void fs_open(object_t o,void *buffer){
    MinixInode *inode = eat_path(buffer);
    fs_log("|OPEN| inode %p,file : %s\n",inode,buffer);
    if(inode){
        id_t id = fork();
        if(0 == id){
            File *file = kalloc(sizeof(File));
            memcpy(self()->name,buffer,strlen(buffer) + 1);
            memcpy(&file->inode,inode,sizeof(MinixInode));
            file->offset = 0;
            self()->private_data = file;
            hook(READ,fs_read);
            hook(WRITE,fs_write);
            hook(CLOSE,fs_close);
            hook(SEEK,fs_seek);
            workloop();
        }else if(id > 0){
            ret(o,id);
        }
    } else {
        ret(o,-ENFILE);
    }
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
    workloop();
    return 0;
}
