#ifndef __NONE_INTER_H__
#define __NONE_INTER_H__

#include <x86/io.h>
#include <none/types.h>
#include <none/if.h>

typedef enum {
    GOD = 0,
    CONS_PID = 1,
    MM_PID = 3,
    SYSTEM_PID,
    CLOCK_PID,
    RAMDISK_PID = 7,
    ROOTFS_PID,
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

#define BLOCK_SIZE  1024
#define BLOCK_SHIFT 10

#define zerror(fmt,...) printk("\er"fmt"\ew\n",##__VA_ARGS__)

#define syscall(_sys_call,obj,fn,r1,r2,r3) ({\
        long __v__; \
        __asm__("int $0x80":"=a"(__v__):"a"(_sys_call),"b"(obj),"c"(fn),"d"(r1),"S"(r3),"D"(r2));  \
        __v__; })

#define lock()      cli()
#define unlock()    sti()

#define eret(caller,talk,err)       syscall(_NR_ret,caller,talk,err,0,0)
#define ret(caller,talk)            syscall(_NR_ret,caller,talk,0,0,0)
#define run(callee,fn,r1,r2,r3)     syscall(_NR_run,callee,fn,r1,r2,r3)
#define run0(callee,fn)             run(callee,fn,0,0,0)
#define run1(callee,fn,r1)          run(callee,fn,r1,0,0)
#define run2(callee,fn,r1,r2)       run(callee,fn,r1,r2,0)
#define run3(callee,fn,r1,r2,r3)    run(callee,fn,r1,r2,r3)
#define workloop()                  syscall(_NR_loop,0, 0,0,0,0)
#define hook(fn,m)                  syscall(_NR_hook,fn,m,0,0,0)
#define _push(s,c)                  (void*)(syscall(_NR_buffer,IF_WRITE,s,c,0,0))
#define _pop(s)                     syscall(_NR_buffer,IF_READ,s,0,0,0)

#endif
