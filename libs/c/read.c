#include    <sys/inter.h> 
#include    <string.h>

int read(int fd,void *buffer,int count){
    int len;
    void *buff = _push(NULL,count);
    if(-1 != (len = run(fd,READ,buff,count,0))){
        memcpy(buffer,buff,len);
    }
    _pop(buff);
    return len;
}
