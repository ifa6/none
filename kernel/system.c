#include    "kernel.h"
#include <sys/inter.h>

extern int at_main();
extern int fs_main();
extern int cons_main();
extern int clock_main();
extern int rs_main();
extern int ramdisk_main();
extern int ne2k_main();

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
};


static void shell(void){
    exec("/bin/v6sh",0,NULL);
}

static void system_dup2(Object *thiz){
    Object *obj = thiz->admit;
    if(obj->r1 < NR_FRIEND) {
        obj->friend[thiz->r1] = thiz->r2;
        ret(thiz->admit,OK);
    }
    ret(thiz->admit,ERROR);
}

static void system_init(void){
    hook(DUP2,system_dup2);
}

int system_main(void){
    count_t i = 0;
    id_t id = 0;
    system_init();
hel:
    id = fork();
    if(ERROR == id){
        printk("Fork Failt\n");
    }else if(0 == id){
        memcpy(self()->name,tasks[i].name,strlen(tasks[i].name) + 1);
        tasks[i].entry();
    }else{
        i++;
        if(i < ARRAY_SIZE(tasks)) goto hel;
        else shell();
    }
    dorun();
    while(1);
    return OK;
}
