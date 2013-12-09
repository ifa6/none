#include    <sys/inter.h> 
#include    <string.h>
#include    <types.h>
#include    <object.h>

ObjectDesc open(String path,int mode){
    ObjectDesc o = 0;
    void *buff = _push(path,strlen(path) + 1);
    o = run(FS_PID,OPEN,0,0,buff);
    _pop(buff);
    return o;
}
