#include    <stdio.h>
#include    <sys/inter.h>

void exit(int n){
    run(MM_PID,CLOSE,n,0,0);
}
