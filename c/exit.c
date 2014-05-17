#include <sys/inter.h>

void exit(int v){
    (void)run(MM_PID,CLOSE,.status = v);
}
