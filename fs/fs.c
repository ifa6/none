#include    "fs.h"
#include    "../kernel/kernel.h"
#include    <elf.h>
MinixSuperBlock *super;
MinixInode root_inode;

static void fs_init(void){
    super = read_super(AT_PID);
    if(super == NULL) panic("\erDon't read super block!\ew\n");
    else{
        if(ERROR == get_inode(MINIX_ROOT_INO,&root_inode)) panic("\erDon't read inode block!\ew\n");
    }
}

/*! 测试加载ELF文件 !*/

static void load_elf(String path) {
    static char buff[BLOCK_SIZE];
    static Elf32_Ehdr *ehdr = (void *)buff;
    static Elf32_Phdr *phdr;
    MinixInode *inode = eat_path(path);
    if(isNullp(inode)){
        printk("File not found\n");
        return;
    }
    zone_rw(inode,READ,0,buff);
    phdr = (void*)(buff + ehdr->e_phoff);
    zone_t zone = phdr->p_offset / BLOCK_SIZE;
    if(ERROR == zone_rw(inode,READ,zone,(void *)(ehdr->e_entry))) panic("-_-|||\n");
    int (*fn)(void);
    fn = (void*)ehdr->e_entry;
    fn();
}

static void fs_read(Object *this){
    load_elf(this->buffer);
    ret(this->admit,OK);
}


static void fs_write(Object *this){
    printk("Hello %s\n",__func__);
}

int fs_main(void){
    printk("fs startup...\n");
    self()->write = fs_write;
    self()->read = fs_read;
    fs_init();
    while(1){
        get();
        dorun(self());
    }
    return 0;
}
