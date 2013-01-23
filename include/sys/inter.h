#ifndef INTER_H
#define INTER_H

#include    <x86/io.h>

/* 任意进程 */
#define ANY         -1
#define REPLY       0

#define SEND        0
#define RECVIE      1

extern Pointer get_free_page(void);
extern void free_page(Pointer);
extern int printk(const char *fmt,...);
extern void panic(const char *msg);

#define syscall(function,arg1,arg2,arg3) ({\
        int _v; \
        asm("int $0x80":"=a"(_v):"a"(function),"b"(arg1),"c"(arg2),"d"(arg3));  \
        _v; })
#define lock()      cli()
#define unlock()    sti()

#define send(dest,m_ptr)    syscall(SEND,dest,m_ptr,0)
#define recvie(src,m_ptr)  syscall(RECVIE,src,m_ptr,0)

#endif
