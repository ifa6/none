#include    "kernel.h"

extern void panic(const char *s){
    printk("\er[PANIC] : \ew %s\n",s);
    cli();
    while(1);
    sti();
}
