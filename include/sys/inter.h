#ifndef INTER_H
#define INTER_H

#include    <x86/io.h>
#include    <types.h>

/* 任意进程 */
#define ANY         -1


/* System Message Type */
#define REPLY   -1
#define READ    0
#define WRITE   1
#define OPEN    2
#define CLOSE   3
#define CLONE   4
#define IOCTL   5
#define HARDWARE    6
#define NO_PAGE     7
#define WP_PAGE     9
#define EXIT       10

/* System Call type */

#define _NR_run     0
#define _NR_get     1
#define _NR_ret     2

#define SEND        0
#define RECVIE      1

extern Pointer get_free_page(void);
extern void free_page(Pointer);
extern int printk(const char *fmt,...);
extern void panic(const char *msg);

#define zerror(fmt,...) printk("\er"fmt"\ew\n",##__VA_ARGS__)

#define syscall(_sys_call,obj,fn,r1,r2,r3) ({\
        int __v__; \
        asm("int $0x80":"=a"(__v__):"a"(_sys_call),"b"(obj),"c"(fn),"d"(r1),"S"(r3),"D"(r2));  \
        __v__; })
#define lock()      cli()
#define unlock()    sti()

#define run(obj,fn,r1,r2,r3) syscall(_NR_run,obj,fn,r1,r2,r3)
#define ret(_obj,_talk) syscall(_NR_ret,_obj,_talk,0,0,0)
#define get()   syscall(_NR_get,0,0,0,0,0)

#define send(dest,m_ptr)    syscall(SEND,dest,m_ptr,0)
#define recvie(src,m_ptr)  syscall(RECVIE,src,m_ptr,0)

#endif
