#include "kernel.h"

extern void cons_init();
extern int printk(const char *fmt,...);
extern void god_init(void);

int main(void){
    cli();
    cons_init();
    printk("\er\elHello,\eyDie!\ew\n");
    mm_init();
    trap_init();
    god_init();
    enable_irq(0);
    hlt();
}
