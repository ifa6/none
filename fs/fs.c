#include    "fs.h"
static MinixSuperBlock *super;

void fs_init(){
    super = read_super(AT_PID);
    if(super == NULL) panic("\erDon't read super block!\ew");
}

int fs_main(void){
    Message m;
    MinixInode *inode;
    static char buf[BLOCK_SIZE];
    MinixDirentry *dir = (MinixDirentry *)buf;

    printk("FS startup...\n");
    fs_init();
    for(;;){
        recvie(ANY,&m);
        switch(m.type){
            case    1:
                inode = get_inode(AT_PID,1,super);
                block_rw(READ,AT_PID,buf,inode->i_zone[0],1);
                for(int i = 0;i < 8;i++){
                    printk("%s\n",dir->name);
                    dir++;
                    dir++;
                }
                break;
        }
    }
    return 0;
}
