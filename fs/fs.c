#include    "fs.h"
#include    "../kernel/kernel.h"
#include    <elf.h>
MinixSuperBlock *super;
MinixInode root_inode;

/*! 测试加载ELF文件 !*/

static void load_elf(String path) {
    static char buff[BLOCK_SIZE];
    static Elf32_Ehdr *ehdr = (void *)buff;
    static Elf32_Phdr *phdr;
    MinixInode *inode = eat_path(path);
    if(isNullp(inode)){
        zerror("File not found!");
        return;
    }
    zone_rw(inode,READ,0,buff);
    phdr = (void*)(buff + ehdr->e_phoff);
    zone_t zone = phdr->p_offset / BLOCK_SIZE;
    if(ERROR == zone_rw(inode,READ,zone,(void *)(ehdr->e_entry))) panic("-_-|||\n");
    if(ERROR == zone_rw(inode,READ,zone + 1,(void *)(ehdr->e_entry) + BLOCK_SIZE)) panic("-_-|||\n");
    if(ERROR == zone_rw(inode,READ,zone + 2,(void *)(ehdr->e_entry) + 2 * BLOCK_SIZE)) panic("-_-|||\n");
    if(ERROR == zone_rw(inode,READ,zone + 3,(void *)(ehdr->e_entry) + 3 * BLOCK_SIZE)) panic("-_-|||\n");
    //if(ERROR == zone_rw(inode,READ,zone + 4,(void *)(ehdr->e_entry) + 4 * BLOCK_SIZE)) panic("-_-|||\n");
    //if(ERROR == zone_rw(inode,READ,zone + 5,(void *)(ehdr->e_entry) + 5 * BLOCK_SIZE)) panic("-_-|||\n");
    //if(ERROR == zone_rw(inode,READ,zone + 6,(void *)(ehdr->e_entry) + 6 * BLOCK_SIZE)) panic("-_-|||\n");
    if(0 == run(MM_PID,CLONE,0,0,0)){
        int (*fn)(void);
        memcpy(self()->name,path,strlen(path) + 1);
        fn = (void*)ehdr->e_entry;
        fn();
    }
}

static void fs_read(Object *this){
    load_elf(this->buffer);
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
    printk("fs startup...\n");
    fs_init();
    while(1){
        get();
        dorun(self());
    }
    return 0;
}
