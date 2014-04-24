#ifndef INTER_H
#define INTER_H

#include    <x86/io.h>
#include    <types.h>

/* 任意进程 */
#define ANY         -1


/* System Message Type */
typedef enum{
    REPLY =     -1,
    READ  =     0,
    WRITE       ,
    OPEN        ,
    CLOSE       ,
    CLONE       ,
    IOCTL       ,
    HARDWARE    ,
    NO_PAGE     ,
    WP_PAGE     ,
    EXIT        ,
    RUN         ,
}DefaultMothon;

/*! Const task PID !*/
typedef enum {
    GOD = 0,
    MM_PID,
    SYSTEM_PID,
    CLOCK_PID,
    AT_PID,
    FS_PID,
    CONS_PID,
    RS_PID
}PID;
/* System Call type */

#define _NR_run     0
#define _NR_get     1
#define _NR_ret     2
#define _NR_hook    3
#define _NR_buffer  4

extern void* get_free_page(void);
extern int free_page(Pointer);
extern int printk(const char *fmt,...);
extern void printx(const char *data,count_t count);
extern void panic(const char *msg);
extern pid_t STD_PIDS[3];
#define STDIN_FILENO    STD_PIDS[0]
#define STDOUT_FILENO   STD_PIDS[1]
#define STDERR_FILENO   STD_PIDS[2]

#define zerror(fmt,...) printk("\er"fmt"\ew\n",##__VA_ARGS__)

#define syscall(_sys_call,obj,fn,r1,r2,r3,...) ({\
        long __v__; \
        __asm__("int $0x80":"=a"(__v__):"a"(_sys_call),"b"(obj),"c"(fn),"d"(r1),"S"(r3),"D"(r2));  \
        __v__; })
#define lock()      cli()
#define unlock()    sti()

static inline long _run( object_t o,long fn, sysarg_t args){
    return syscall(_NR_run,o,fn,args.r1,args.r2,args.r3);
};
#define run(o,fn,...)    _run(o,fn,(sysarg_t){__VA_ARGS__})
#if 0
#define _syscall_args   0,0,0
#define __run(obj,fn,...)   syscall(_NR_run,obj,fn,__VA_ARGS__)
#define run(obj,fn,...)    _run(obj,fn,##__VA_ARGS__,_syscall_args)
#endif
#define ret(_obj,_talk) syscall(_NR_ret,_obj,_talk,0,0,0)
#define get()   (Object *)syscall(_NR_get,0,0,0,0,0)
#define hook(fn,methon) syscall(_NR_hook,fn,methon,0,0,0)
#define _push(s,c)  (void*)(syscall(_NR_buffer,WRITE,s,c,0,0))
#define _pop(s)     syscall(_NR_buffer,READ,s,0,0,0)

#endif
