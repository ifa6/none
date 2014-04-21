#include    <stdarg.h>
#include    <stddef.h>
#include    <stdio.h>
#include <stdlib.h>
#include    <sys/inter.h>
pid_t STD_PIDS[3] = {CONS_PID,CONS_PID,CONS_PID};
static  char buf[1024] = {0};
extern int printf(const char *fmt,...){
    va_list args;
    int len = 0;
    va_start(args,fmt);
    len = vsprintf(buf,fmt,args);
    len = write(STDOUT_FILENO,buf,len);
    return len;
}
