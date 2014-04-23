#ifndef __KERNEL_H__
#define __KERNEL_H__

#include <const.h>
#include <types.h>
#include <x86/io.h>
#include <sys/inter.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <task.h>
#include <z.h>


extern Task *leading;
#define self()  OBJECT(leading)

extern Registers *sched(Registers *reg);
extern int doint(ObjectDesc obj,unsigned long fn,unsigned long r1,unsigned long r2,unsigned long r3);

extern IrqHandler irq_table[NR_IRQ_VECTORS];

#define proc_number(rp) ((rp)->pid)
#define proc_addr(pid)  (task[pid])

#define do_switch() __asm__("int $0x81\n\t\t")

/* */
#define getcr3()    ({  \
        Pointer _cr3;   \
        asm("movl %%cr3,%0\n\t\t":"=a"(_cr3)); \
        _cr3;   \
        })

#define ldcr3(cr3)  ({\
        asm("movl %0,%%cr3\n\t\t"::"a"(cr3));\
        })

#define getcr2()    ({  \
        Pointer _cr2;   \
        asm("movl %%cr2,%0\n\t\t":"=a"(_cr2)); \
        _cr2;   \
        })

extern void trap_init(void);
extern void mm_init(void);
void print_cpu_info(Registers *reg);

/* */
extern void disable_irq(int irq);
extern void enable_irq(int irq);
extern void put_irq_handler(int irq,IrqHandler handler);

#endif
