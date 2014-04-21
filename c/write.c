#include    <sys/inter.h> 
#include    <string.h>
#include    <types.h>
#include    <object.h>

int write(int fd,void *buffer,int count){
    int len;
    void *buff = _push(buffer,count);
    len = run(fd,WRITE,0,count,buff);
    _pop(buff);
    return len;
}
