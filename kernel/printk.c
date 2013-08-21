#include    <stdarg.h>
#include    <stddef.h>
#include    "kernel.h"

extern void cons_print(int cons,const char *buf);

static  char buf[1024];

extern int printk(const char *fmt,...){
    va_list args;
    int i;

    va_start(args,fmt);
    i=vsprintf(buf,fmt,args);
    cons_print(0,buf);
    return i;

}
