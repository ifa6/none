#ifndef __KERNEL_H__
#define __KERNEL_H__

#include <none/const.h>
#include <none/types.h>
#include <none/task.h>
#include <sys/inter.h>
#include <x86/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <z.h>


extern Task *leading;
#define self()  OBJECT(leading)

extern Registers *sched(Registers *reg);
extern int doint(object_t obj,unsigned long fn,unsigned long r1,unsigned long r2,unsigned long r3);

extern IrqHandler irq_table[NR_IRQ_VECTORS];

#define proc_number(rp) ((rp)->pid)
#define proc_addr(pid)  (task[pid])

#define do_switch() __asm__("int $0x81\n\t\t")

/* */
#define getcr3()    ({  \
        Pointer _cr3;   \
        __asm__("movl %%cr3,%0\n\t\t":"=a"(_cr3)); \
        _cr3;   \
        })

#define ldcr3(cr3)  ({\
        __asm__("movl %0,%%cr3\n\t\t"::"a"(cr3));\
        })

#define getcr2()    ({  \
        Pointer _cr2;   \
        __asm__("movl %%cr2,%0\n\t\t":"=a"(_cr2)); \
        _cr2;   \
        })

extern void trap_init(void);
extern void mm_init(void);
void print_cpu_info(Registers *reg);

/* */
extern void disable_irq(int irq);
extern void enable_irq(int irq);
extern void put_irq_handler(int irq,IrqHandler handler);

extern void *kalloc(unsigned int);
extern void kfree_s(void *,int);
#define kfree(p)    kfree_s(p,0)


#endif
