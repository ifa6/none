#include <posix.h>
#include <sys/inter.h>

object_t dup(object_t old){
    return old;
}

object_t dup2(object_t old,object_t new){
    return run(SYSTEM_PID,DUP2,old,new,0);
}
