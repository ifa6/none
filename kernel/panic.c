#include    "kernel.h"

extern void panic(const char *s){
    printk("\egpanic: \er%s\ew\n",s);
    cli();
    hlt();
    while(1);
    sti();
}
