#include <sys/inter.h> 
#include <none/if.h>
#include <string.h>

object_t open(String path,int mode){
    object_t o = 0;
    void *buff = _push(path,strlen(path) + 1);
    o = run(ROOTFS_PID,IF_OPEN,buff,mode,0);
    _pop(buff);
    return o;
}

int close(object_t obj){
    return run(obj,IF_CLOSE,0,0,0);
}
