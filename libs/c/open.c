#include    <sys/inter.h> 
#include    <string.h>

object_t open(String path,int mode){
    object_t o = 0;
    void *buff = _push(path,strlen(path) + 1);
    o = run(FS_PID,OPEN,buff,mode,0);
    _pop(buff);
    return o;
}

int close(object_t obj){
    return run(obj,CLOSE,0,0,0);
}
