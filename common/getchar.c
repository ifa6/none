#include    <stdio.h>
#include    <sys/inter.h>

static int ch;
extern int getchar(void){
    run(CONS_PID,READ,0,1,&ch);
    return ch;
}
