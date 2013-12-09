#include    <sys/inter.h> 
#include    <string.h>
#include    <types.h>
#include    <object.h>

int read(int fd,void *buffer,int count){
    int len;
    void *buff = _push(NULL,count);
    if(-1 != (len = run(fd,READ,0,count,buff))){
        memcpy(buffer,buff,len);
    }
    _pop(buff);
    return len;
}
