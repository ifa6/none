#include    <stdio.h>
#include    <sys/inter.h>

extern int getchar(void){
    char ch;
    void *p = (void*)_push(&ch,1);
    run(CONS_PID,READ,0,1,p);
    ch = *(char *)p;
    _pop(p);
    return ch;
}
