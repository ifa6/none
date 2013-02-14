#include    "kernel.h"

int system_main(void){
    static char buf[1024] = {0};
    //for(int i = 0;i < 1024;i++) buf[i] = 'A';
    Message m = {
        .type = 1,
        .count = 1024,
        .offset = 0,
        .buf = buf,
    };

    send(FS_PID,&m);
    /*
    recvie(AT_PID,&m);
    printk("%s\n",buf);
    //send(AT_PID,&m);
    */
    recvie(100,&m);
    while(1);
}
