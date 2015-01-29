#ifndef __DEBUG_H__
#define __DEBUG_H__

#define DEBUG
#define TODO

#define FS_LOG
#define SYS_LOG
//#define MM_LOG
//#define PRINT_SCHED

#ifdef DEBUG
#define  dbg(own,fmt,...)  printk("[%6s] : "fmt,own,##__VA_ARGS__)
#else
#define dbg(...)
#endif

#ifdef TODO
#define todo(fmt,...)   printk("\er[TODO  ] : "fmt" %s:%d\ew\n",##__VA_ARGS__,__FILE__,__LINE__)
#else
#define todo(...)
#endif

#endif
