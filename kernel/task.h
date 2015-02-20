#ifndef __KERNEL_TASK_H__
#define __KERNEL_TASK_H__
#include <none/list.h>
#include "object.h"
/*!
 *!     特殊说明:
 *          我打算在对象中加入页面,存在标志,这样,我就无需再分开维护页面和对象.所有对象共享同一地址空间,
 *          将4GB的内存空间隐射成32x86的页面最大空间.这个想法不是很安全,效率估计也会很低.不过是个非常
 *          妖娆的模型,写在这里做备注,该版本不实现这个特性,而是实现一个4GB没有页的迷你模型.
 *!
 */
#define PAGE_BYTE   0x1000
typedef struct _task Task;
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

struct _task{
    Object      object;         /*! Task是一个任务对象,所有对象都继承Object,并且所有对象的实例都直接间接克隆于god !*/
    cnt_t     count;          /*! 任务当前每次运行的时间片!*/
    cnt_t     ucount;         /*! 活动任务当前剩余时间片  !*/
    int         pri;            /*! 任务优先级              !*/
    Registers   *registers;     /*! 指向任务私有的堆栈结构  !*/
    pointer_t     core;           /*! 任务的内存空间,cr3      !*/
    Task        *next,*prev;    /*! 任务链 !*/
};

struct _stack{
    Task task;
    char stack[PAGE_BYTE - sizeof(Task)];   /*! 内核栈 ~*/
    char stackp[0];                     /*! 内核栈顶 !*/
};

#define TASK(x)     container_of(x,Task,object)
#define STACK(x)    ((struct _stack *)x)
#endif
