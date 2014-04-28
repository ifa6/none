#include    "kernel.h"

extern int at_main();
extern int fs_main();
extern int cons_main();
extern int clock_main();
extern int rs_main();
extern int ramdisk_main();

int (*tasks[])() = {
    clock_main,
    cons_main,
    ramdisk_main,
    fs_main,
    rs_main,
};

String taskName[] = {
    "Clock",
    "Conslo",
    "RamDisk",
    "FS",
    "Serial"
    "AT Hardware",
};


static void shell(void){
    object_t o = run(FS_PID,OPEN,.ptr = "shell");
    run(o,RUN);
}

int system_main(void){
    count_t i = 0;
    id_t id = 0;
hel:
    id = fork();
    if(ERROR == id){
        printk("Fork Failt\n");
    }else if(0 == id){
        memcpy(self()->name,taskName[i],strlen(taskName[i]) + 1);
        tasks[i]();
    }else{
        i++;
        if(i < sizeof(tasks) / sizeof(void*)) goto hel;
        else shell();
    }
    dorun();
    while(1);
    return OK;
}
