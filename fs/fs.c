#include    "fs.h"
#include    "../kernel/kernel.h"
#include    <elf.h>
MinixSuperBlock *super;
MinixInode root_inode;

/*! 测试加载ELF文件 !*/

static void load_elf(String path,Object *this) {
    static char buff[BLOCK_SIZE];
    static char buffer[BLOCK_SIZE];
    static Elf32_Ehdr *ehdr = (void *)buff;
    static Elf32_Phdr *phdr;
    MinixInode *inode = eat_path(path);
    if(isNullp(inode)){
        zerror("%s file not found!",path);
        return;
    }
    zone_rw(inode,READ,0,buff);
    phdr = (void*)(buff + ehdr->e_phoff);
    zone_t zone = phdr->p_offset / BLOCK_SIZE;
    if(0 == run(MM_PID,CLONE,0,0,0)){
        memcpy(self()->name,path,strlen(path) + 1);
        for(int i = 0;i < (phdr->p_memsz + BLOCK_SIZE - 1) / BLOCK_SIZE;i++){
            if(ERROR == zone_rw(inode,READ,zone + i,buffer)) panic("-_-|||\n");
            memcpy((void*)(ehdr->e_entry + i * BLOCK_SIZE),buffer,BLOCK_SIZE);
        }
        TASK(self())->father = TASK(this->admit);
        int (*fn)(void);
        fn = (void*)ehdr->e_entry;
        fn();
        run(MM_PID,CLOSE,0,0,0);
    }
}

static void fs_read(Object *this){
    load_elf(this->buffer,this);
    ret(this->admit,OK);
}


static void fs_write(Object *this){
    printk("Hello %s\n",__func__);
    ret(this->admit,OK);
}

static void fs_open(Object *this){
    ret(this->admit,OK);
}

static void fs_init(void){
    self()->write = fs_write;
    self()->read = fs_read;
    self()->open = fs_open;
    super = read_super(AT_PID);
    if(super == NULL) panic("\erDon't read super block!\ew\n");
    else{
        if(ERROR == get_inode(MINIX_ROOT_INO,&root_inode)) panic("\erDon't read inode block!\ew\n");
    }
}

int fs_main(void){
    fs_init();
    while(1){
        get();
        dorun(self());
    }
    return 0;
}
