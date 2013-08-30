#include    "kernel.h"

extern int at_main();
extern int fs_main();
extern int cons_main();
extern int clock_main();

int (*tasks[])() = {
    clock_main,
    at_main,
    fs_main,
    cons_main,
};

String taskName[] = {
    "Clock",
    "AT Hardware",
    "FS",
    "Conslo",
};


static void shell(void){
    //while(1);
    run(FS_PID,READ,0,0,"shell");
}

int system_main(void){
    int i = 0;
    id_t id = 0;
hel:
    id = run(MM_PID,CLONE,0,0,0);
    if(ERROR == id){
        printk("Fork Failt\n");
    }else if(0 == id){
        memcpy(self()->name,taskName[i],strlen(taskName[i]) + 1);
        tasks[i]();
    }else{
        i++;
        /* printk("ID = %d %s\n",id,self()->name); */
        if(i < sizeof(tasks) / sizeof(void*)) goto hel;
        else shell();
    }
    get();
    while(1);
    return OK;
}
