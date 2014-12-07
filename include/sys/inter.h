#ifndef __NONE_INTER_H__
#define __NONE_INTER_H__

#include <x86/io.h>
#include <none/types.h>

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
    DUP2        ,
    RUN         ,
    EXEC        ,
    SEEK        ,
}DefaultMothon;

/*! Const task PID !*/
typedef enum {
    GOD = 0,
    CONS_PID = 1,
    MM_PID = 3,
    SYSTEM_PID,
    CLOCK_PID,
    AT_PID = 7,
    FS_PID,
    RS_PID,
}PID;
/* System Call type */

#define _NR_loop    0
#define _NR_run     1
#define _NR_ret     2
#define _NR_hook    3
#define _NR_buffer  4

#define STDIN_FILENO    0
#define STDOUT_FILENO   1
#define STDERR_FILENO   2

#define SEEK_SET    0
#define SEEK_CUR    1
#define SEEK_END    2


#define OK      0
#define ERROR   -1

#define zerror(fmt,...) printk("\er"fmt"\ew\n",##__VA_ARGS__)

#define syscall(_sys_call,obj,fn,r1,r2,r3) ({\
        long __v__; \
        __asm__("int $0x80":"=a"(__v__):"a"(_sys_call),"b"(obj),"c"(fn),"d"(r1),"S"(r3),"D"(r2));  \
        __v__; })

#define lock()      cli()
#define unlock()    sti()

static inline long ret(object_t caller,long talk) { return syscall(_NR_ret,caller,talk,0,0,0);}
#define run(callee,fn,r1,r2,r3) syscall(_NR_run,callee,fn,r1,r2,r3)
#define workloop()          syscall(_NR_loop,0, 0,0,0,0)
#define hook(fn,m)          syscall(_NR_hook,fn,m,0,0,0)
#define _push(s,c)          (void*)(syscall(_NR_buffer,WRITE,s,c,0,0))
#define _pop(s)             syscall(_NR_buffer,READ,s,0,0,0)

#endif
