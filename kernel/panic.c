#include    "kernel.h"

extern void panic(const char *s){
    printk("\eg[PANIC] : \er|KERNEL  |\ew %s\n",s);
    cli();
    //hlt();
    while(1);
    sti();
}
