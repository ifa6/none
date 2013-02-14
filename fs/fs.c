#include    "fs.h"
static MinixSuperBlock *super;

void fs_init(){
    super = read_super(AT_PID);
    if(super == NULL) panic("\erDon't read super block!\ew");
}

int fs_main(void){
    Message m;
    pid_t   caller;
    int rcode;
    MinixInode *inode;
    static char buf[BLOCK_SIZE];
    MinixDirentry *dir = (MinixDirentry *)buf;

    printk("FS startup...\n");
    fs_init();
    for(;;){
        recvie(ANY,&m);
        caller = m.src;
        switch(m.type){
            case    OPEN: rcode = OK;break;
            case    READ: rcode = fs_read();break;
            case    WRITE: rcode = fs_write();break;
            case    IOCTL: rcode = fs_ioctl();break;
            default: rcode = ERROR;
        }
        m.type = REPLY;
        m.status = rcode;
        send(caller,&m);
    }
    return 0;
}
