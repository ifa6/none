
#ifndef __CONST_H__
#define __CONST_H__


#define IDT_TABLE       0x200000        /* 中断描述符表 0x200000 ~ 0x200800 */
#define TSS_TABLE       0x200800        /* 调度程序使用的TSS描述符 0x200800 ~ 0x200900 */
#define GDT_TABLE       0x200900        /* GDT描述符表 0x200900 ~ 0x202900 */

#define _va(p)
#define isNullp(p)  ((p) == NULL)
#define isE(x,p)    ((x) == (p))


#define HARD_INT        1
#define GET_TIME        2

#define KERNEL_CODE     0x08
#define KERNEL_DATA     0x10
#define USER_CODE       0x1b    /* 用户空间代码段描述符 */
#define USER_DATA       0x23    /* 用户空间数据段描述符 */
#define KERNEL16_CODE   0x28    /* 16位代码段 !*/
#define KERNEL16_DATA   0x30    /*! 16位数据段,用来使用VESA ~*/
#define TR_DESC         0x38    /*      */
#define KERNEL_STACK    0x7ff000    /*! 内核栈虚拟地址 !*/


#define     MMAP_BASE       0x100000    /* 内存空闲位图开始物理地址 */
#define     MMAP_END        0x200000    /* 空闲内存位图结束物理地址 */
#define     CONST_MEM       0x800000    /* 内核空间 */
#define     PAGE_START      0x0
#define     KMEM            0x40000000  /* 内核对等映射顶端 */
#define     DIE_DIR         0x203000        /* die进程页目录,在内核启动之前,由boot设置,这里的boot是内核boot,*/
#define     DIE_TABLE       0x204000        /*  前4MB的页表 */
#define     KERNEL_TABLE    0x205000        /* 0X205000 ~ 0X305000 内核映射页表 256项,共占1MB内存 */

#define LATCH   1193180

#define NR_TASKS 0x100

/* process flags */
#define SENDING    0x1
#define RECVIEING  0x2

#define NO_REPLY    -78

#define PAGE_SIZE   0x1000
#define PAGE_OFFSETOF(x) (((unsigned long)(x)) & 0xfff)
#define KERNEL_STACK_SIZE PAGE_SIZE

#define NR_IRQ_VECTORS  16

#define NR_PRI      3
#define PRI_TASK    0
/*! #define PRI_SERVER  1 !*/
#define PRI_USER    1
#define PRI_GOD     2


#define GOD             0
#define MM_PID          1
#define SYSTEM_PID      2
#define CLOCK_PID       3
#define AT_PID          4
#define FS_PID          5
#define CONS_PID        6

#define OK  0
#define ERROR   -1

#endif
