#include "kernel.h"

extern void cons_init();
extern int printk(const char *fmt,...);
extern void god_init(void);

int main(void){
    cli();
    cons_init();
    mm_init();
    trap_init();
    god_init();
}
