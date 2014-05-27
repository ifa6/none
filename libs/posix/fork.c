#include    <sys/inter.h>
pid_t fork(void){
    return run(MM_PID,CLONE);
}
