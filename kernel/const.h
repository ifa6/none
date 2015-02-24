#ifndef __KERNEL_CONST_H__
#define __KERNEL_CONST_H__

#define _va(p)

#define KERNEL_CODE     0x08
#define KERNEL_DATA     0x10
#define USER_CODE       0x1b    /* 用户空间代码段描述符 */
#define USER_DATA       0x23    /* 用户空间数据段描述符 */
#define KERNEL16_CODE   0x28    /* 16位代码段 !*/
#define KERNEL16_DATA   0x30    /*! 16位数据段,用来使用VESA ~*/
#define TR_DESC         0x38    /*      */

#define KERNEL_STACK    0x2000  /* 内核栈虚拟地址 */
#define IDT_TABLE       0x20000 /* IDT 0x10000 - 0x10800 */
#define TSS_TABLE       0x20800 /* TSS 0x10800 - 0x10900 */
#define GDT_TABLE       0x20900 /* GDT 0x10900 - 0x12900 */
#define BUFFER_START    0x25000 /* 对象间大数据通信中介 */
#define BUFFER_END      0xa0000
#define BUFFER_COUNT    ((BUFFER_END - BUFFER_START) >> 12)
#define MMAP_BASE       0x100000 /* 内存空闲位图开始物理地址 */
#define MMAP_END        0x200000 /* 空闲内存位图结束物理地址 */
#define RAMDISK_ADDR    0x200000 /* ramdisk 起始地址 */
#define RAMDISK_END     0x260000 /* ramdisk 结束地址 */
#define RAMDISK_COUNT   (RAMDISK_END - RAMDISK_ADDR)
#define KERNEL_DIR      0x260000
#define KERNEL_TABLE    0x261000 /* 0x261000 ~ 0x361000 内核映射页表 256项,共占1MB内存 */
#define OBJECT_START    0x400000 /*! 对象内存页分配开始地址 !*/
#define CONST_MEM       0x800000 /*! 对象页分配结束地址,通用内存页开始地址内 !*/
#define PAGE_START      0x0
#define KMEM            0x40000000 /*内核对等映射顶端 */

#define HZ              100
#define CLOCK_TICK_RATE 1193183
#define LATCH   ((CLOCK_TICK_RATE + HZ / 2) / HZ)

#define NR_TASKS 0x100

#define PAGE_SIZE   0x1000
#define PAGE_SHIFT  12
#define PAGE_OFFSETOF(x) (((unsigned long)(x)) & 0xfff)
#define KERNEL_STACK_SIZE PAGE_SIZE

#define NR_IRQ_VECTORS  16

#define NR_PRI      3
#define PRI_TASK    0
/*! #define PRI_SERVER  1 !*/
#define PRI_USER    1
#define PRI_GOD     2

#endif
