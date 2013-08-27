#include    <stdarg.h>
#include    <stddef.h>
#include    <stdio.h>
#include    <sys/inter.h>

static  char buf[1024] = {0};

extern int printf(const char *fmt,...){
    va_list args;
    int i = 0;
    va_start(args,fmt);
    i = vsprintf(buf,fmt,args);
    run(CONS_PID,WRITE,0,0,buf);
    return i;
}
