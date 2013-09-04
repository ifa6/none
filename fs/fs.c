#include    "fs.h"
#include    "../kernel/kernel.h"
#include    <elf.h>
MinixSuperBlock *super;
MinixInode root_inode;

/*! 测试加载ELF文件 !*/

static void load_elf(Object *this) {
    static char buff[BLOCK_SIZE];
    static char buffer[BLOCK_SIZE];
    static Elf32_Ehdr *ehdr = (void *)buff;
    static Elf32_Phdr *phdr;
    MinixInode *inode = &(((File*)this)->inode);
    zone_rw(inode,READ,0,buff);
    phdr = (void*)(buff + ehdr->e_phoff);
    zone_t zone = phdr->p_offset / BLOCK_SIZE;
    for(int i = 0;i < (phdr->p_memsz + BLOCK_SIZE - 1) / BLOCK_SIZE;i++){
        if(ERROR == zone_rw(inode,READ,zone + i,buffer)) panic("-_-|||\n");
        memcpy((void*)(ehdr->e_entry + i * BLOCK_SIZE),buffer,BLOCK_SIZE);
    }
    int (*fn)(void);
    fn = (void*)ehdr->e_entry;
    ret(this->admit,OK);
    fn();
    run(MM_PID,CLOSE,0,0,0);
}

static void fs_read(Object *this){
    load_elf(this);
}


static void fs_write(Object *this){
    printk("%s is unhandle\n",__func__);
    ret(this->admit,OK);
}

static void fs_open(Object *this){
    MinixInode *inode = eat_path(this->buffer);
    if(!isNullp(inode)){
        id_t id = fork();
        if(0 == id){
            File *file = (void*)self();
            TASK(file)->father = TASK(this->admit);
            memcpy(self()->name,this->buffer,strlen(this->buffer) + 1);
            memcpy(&(file->inode),inode,sizeof(MinixInode));
            hook(READ,fs_read);
            hook(WRITE,fs_write);
            //hook(CLOSE,close);
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
