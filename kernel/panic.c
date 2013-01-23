#include    "kernel.h"

extern void panic(const char *s){
    printk("panic: %s\n",s);
    cli();
    while(1);
    sti();
}
