#ifndef __PROC_H__
#define __PROC_H__
#include    <object.h>
/*!
 *!     特殊说明:
 *          我打算在对象中加入页面,存在标志,这样,我就无需再分开维护页面和对象.所有对象共享同一地址空间,
 *          将4GB的内存空间隐射成32x86的页面最大空间.这个想法不是很安全,效率估计也会很低.不过是个非常
 *          妖娆的模型,写在这里做备注,该版本不实现这个特性,而是实现一个4GB没有页的迷你模型.
 *!
 */
#define PAGE_BYTE   0x1000
typedef struct _rdy Task;
typedef struct _registers Registers;
struct _registers{
    long    gs;         /*! 进程调度时的堆栈 !*/
    long    fs;
    long    ds;
    long    es;
    long    edi;
    long    esi;
    long    ebp;
    long    _esp;
    long    ebx;
    long    edx;
    long    ecx;
    long    eax;    /*! 以上都是由中断维护的堆栈 !*/
    long    eip;    /*! 以下由机器自动维护 !*/
    long    cs;
    long    eflags;
    long    esp;        /*! 低特权级向高特权级转换时保存的之前的堆栈 !*/
    long    ss;
};


struct _rdy{
    Object      object;         /*! Task是一个任务对象,所有对象都继承Object,并且所有对象的实例都直接间接克隆于god !*/
    count_t     count;          /*! 任务当前每次运行的时间片!*/
    count_t     ucount;         /*! 活动任务当前剩余时间片  !*/
    int         pri;            /*! 任务优先级              !*/
    Registers   *registers;     /*! 指向任务私有的堆栈结构  !*/
    Pointer     core;           /*! 任务的内存空间,cr3      !*/
    Section     code,data;      /*! 代码段,数据段 !*/
    Task        *next,*prev;    /*! 任务链 !*/
    Task        *father;        /*! !*/
    unsigned    held[20];       /*! !*/
    unsigned    magic;          /*! 常量0x89ABCDEF,一方面用它来校验内核栈是否溢出,另一方面作为Task对象的一个魔术字 !*/
};

union _task{
    struct _rdy rdy;
    struct {
        char        stack[PAGE_BYTE - 16]; /*! 内核栈 ~*/
        char        stackp[0];             /*! 内核栈顶 !*/
        char        held[16];              /*! 栈溢出保护 !*/
    };
};

#define STACK(x) ((union _task*)x)
#define TASK(x)     ((Task *)(x))
#define MEMBER(x,member)    x->member
/*! 以下宏在没有分页,也没分段的时候维护栈,也许你会发疯 !*/
#define RESET_OFFSETOF(x,member)   (MEMBER(x,member) = (__typeof__(MEMBER(x,member)))(((unsigned long)(x) + PAGE_OFFSETOF(MEMBER(x,member)))))
#define RESET_STACK(x) {\
    RESET_OFFSETOF(x,registers);\
    RESET_OFFSETOF(x,MEMBER(registers,ebp));\
    }
#endif
