#include "kernel.h"

extern void cons_init();
extern int printk(const char *fmt,...);
extern void proc_init(void);
int main(void){

    cli();
    cons_init();
    printk("\erHello \ebWorld!\n");
    mm_init();
    trap_init();
    proc_init();
    sti();
    hlt();
}
