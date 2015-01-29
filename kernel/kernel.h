#ifndef __KERNEL_H__
#define __KERNEL_H__

#include "const.h"
#include "task.h"
#include <none/types.h>
#include <sys/inter.h>
#include <x86/io.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <errno.h>
#include "debug.h"

#define eprint(fmt,...) printk(fmt" %s %d\n",##__VA_ARGS__,__FILE__,__LINE__)
#include <z.h>

#ifdef SYS_LOG
#define sys_log(fmt,...)    dbg("SYS",fmt,##__VA_ARGS__)
#else
#define sys_log(...)
#endif

extern Task *leading;
#define self()  OBJECT(leading)

extern void sched(void);
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

#define SET_ERR(n) ({errno = n;})

static inline  void clear_methon(void) {
    for(int i = 0;i < NR_METHON;i++)
        hook(i,NULL);
}
extern void trap_init(void);
extern void mm_init(void);
void print_cpu_info(Registers *reg);
/* */
extern void disable_irq(int irq);
extern void enable_irq(int irq);
extern void put_irq_handler(int irq,IrqHandler handler);

extern void* get_free_page(void);
extern void* get_kfree_page(void);
#define get_free_object get_kfree_page
extern int free_page(Pointer);
extern int share_page(Pointer);
extern int page_share_nr(Pointer page);
extern int printk(const char *fmt,...);
extern void printx(const char *data,count_t count);
extern void panic(const char *msg);

extern void *kalloc(unsigned int);
extern void kfree_s(void *,unsigned int);
#define kfree(p)    kfree_s(p,0) //({ printk("%s:%d :",__FILE__,__LINE__);kfree_s(p,0); })
//#define kalloc(n) ({void *_v = kalloc(n);printk("%s:%d [%p:%d]\n",__FILE__,__LINE__,_v,n);_v;})


#endif
