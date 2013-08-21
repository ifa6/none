#include    "kernel.h"

int system_main(void){
    static char buff[1024] = {0};// */{"Hello,Die\n"};
    printk("System running\n");
    while(1){
        for(int i = 0;i < 0xeffff;i++);
        run(CLOCK_PID,0,0,0,0);
        if(ERROR == run(AT_PID,READ,0,2,buff)) zerror("Read: [Fail]");
        else printk(buff);
        //if(ERROR == run(FS_PID,READ,0,0,0));
        get();
    }
    return OK;
}
