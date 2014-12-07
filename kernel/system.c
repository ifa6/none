#include    "kernel.h"
#include <sys/inter.h>

extern int at_main();
extern int fs_main();
extern int cons_main();
extern int clock_main();
extern int rs_main();
extern int ramdisk_main();
extern int ne2k_main();
static int system_shell();

struct {
    String name;
    int (*entry)();
}tasks[] = {
    {.name = "Clock",         .entry = clock_main},
    {.name = "Conslo",        .entry = cons_main},
    {.name = "AT Hard",       .entry = at_main},
    {.name = "File System",   .entry = fs_main},
    {.name = "Serial",        .entry = rs_main},
    {.name = "Ram Disk",      .entry = ramdisk_main},
    {.name = "NE2K",          .entry = ne2k_main},
    {.name = "Shell",         .entry = system_shell},
};


static int system_shell(void){
    run(SYSTEM_PID,1,PRI_USER,0,0);
    return exec("/bin/v6sh",0,NULL);
}

static void system_dup2(object_t caller,long r1,long r2){
    Object *obj = toObject(caller);
    if(obj->r1 < NR_FRIEND) {
        obj->friend[r1] = r2;
        ret(caller,OK);
    }
    ret(caller,ERROR);
}

static void system_pri(object_t caller,long r1) {
    Task *task = TASK(caller);
    task->pri = r1;
    ret(caller,OK);
}

static void system_init(void){
    hook(DUP2,system_dup2);
    hook(1,system_pri);
}

int system_main(void){
    count_t i = 0;
    id_t id = 0;
    system_init();
hel:
    id = fork();
    if(0 > id){
        printk("Fork falt\n");
    }else if(0 == id){
        memcpy(self()->name,tasks[i].name,strlen(tasks[i].name) + 1);
        tasks[i].entry();
    }else{
        i++;
        if(i < ARRAY_SIZE(tasks)) 
            goto hel;
    }
    workloop();
    return OK;
}
