#include <sys/inter.h> 
#include <none/if.h>
#include <string.h>

int read(int fd,void *buffer,int count){
    int len;
    void *buff = _push(NULL,count);
    if(0 < (len = run(fd,IF_READ,buff,count,0))){
        memcpy(buffer,buff,len);
    }
    _pop(buff);
    return len;
}
