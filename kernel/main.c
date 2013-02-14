#include "kernel.h"

extern void cons_init();
extern int printk(const char *fmt,...);
extern void proc_init(void);

int main(void){
    cli();
    cons_init();
    printk("\er\elHello \eyWorld!\eg\eL\n");
    mm_init();
    trap_init();
    proc_init();
    enable_irq(0);
    hlt();
}
