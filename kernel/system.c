#include "kernel.h"
#include <sys/inter.h>
#include <none/scntl.h>

extern int cons_main();
extern int clock_main();
extern int ramdisk_main();
extern int rootfs_main();
static int system_shell();

struct {
    String name;
    int (*entry)();
}tasks[] = {
    {.name = "Clock",         .entry = clock_main},
    {.name = "Conslo",        .entry = cons_main},
    {.name = "Ram Disk",      .entry = ramdisk_main},
    {.name = "rootfs",        .entry = rootfs_main},
    {.name = "Shell",         .entry = system_shell},
};


static int system_shell(void){
    run(SYSTEM_PID,1,PRI_USER,0,0);
    return exec("/bin/v6sh",1,(char *[]){"v6sh"});
}

static void system_dup2(object_t caller,long r1,long r2){
    Object *obj = toObject(caller);
    if(obj->r1 < NR_FRIEND) {
        obj->friend[r1] = r2;
        ret(caller,OK);
    }
    eret(caller,-1,-ENOSYS);
}

static void system_pri(object_t caller,long r1) {
    Task *task = TASK(caller);
    task->pri = r1;
    ret(caller,OK);
}

static void system_private(object_t caller) {
    ret(caller,objectById(caller)->private_data);
}

static void system_init(void){
    hook(SIF_DUP2,system_dup2);
    hook(SIF_PRIVATE,system_private);
    hook(1,system_pri);
}

int system_main(void){
    cnt_t i = 0;
    id_t id = 0;
    system_init();
hel:
    id = fork();
    if(0 > id){
        printk("Fork falt\n");
    }else if(0 == id){
        memcpy(self()->name,tasks[i].name,strlen(tasks[i].name) + 1);
        clear_methon();
        //sys_log("task(%s:%d).\n",self()->name,self()->id);
        tasks[i].entry();
    }else{
        i++;
        if(i < ARRAY_SIZE(tasks)) 
            goto hel;
    }
    workloop();
    return OK;
}
