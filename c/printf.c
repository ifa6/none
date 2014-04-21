#include    <stdarg.h>
#include    <stddef.h>
#include    <stdio.h>
#include    <sys/inter.h>

static  char buf[1024] = {0};
extern int printf(const char *fmt,...){
    va_list args;
    int len = 0;
    void *p = NULL;
    va_start(args,fmt);
    len = vsprintf(buf,fmt,args);
    p = _push(buf,len);
    run(CONS_PID,WRITE,0,0,p);
    _pop(p);
    return len;
}
