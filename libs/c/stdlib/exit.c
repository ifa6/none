#include <sys/inter.h>
#include <none/scntl.h>

void exit(int v){
    (void)run(MM_PID,MIF_CLOSE,v,0,0);
}
