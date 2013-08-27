#include    <const.h>
#include    <types.h>
#include    <x86/io.h>
#include    <sys/inter.h>
#include    <stdio.h>
#include    <stdlib.h>
#include    <string.h>
#include    <object.h>
#include    "task.h"

#define self()  OBJECT(leading)

extern void trap_init(void);
extern void mm_init(void);
void print_cpu_info(Registers *reg);

/* */
extern void disable_irq(int irq);
extern void enable_irq(int irq);
extern void put_irq_handler(int irq,IrqHandler handler);

extern Task *leading;

/*! extern int interrupt(pid_t dest,Message *m_ptr); !*/

extern void sched(void);
extern int doint(ObjectDesc obj,unsigned long fn,unsigned long r1,unsigned long r2,unsigned long r3);

extern IrqHandler irq_table[NR_IRQ_VECTORS];

#define proc_number(rp) ((rp)->pid)
#define proc_addr(pid)  (task[pid])

extern Tss *tss;

/* */
#define getcr3()    ({  \
        Pointer _cr3;   \
        asm("movl %%cr3,%0\n\t\t":"=a"(_cr3)); \
        _cr3;   \
        })

#define ldcr3(cr3)  ({\
        asm("movl %0,%%cr3\n\t\t"::"a"(cr3));\
        })

/* Task List */
int clock_main(void);


