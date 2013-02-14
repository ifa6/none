#include    "fs.h"

int block_rw(int cmd,const int dev,void *buf,off_t offset,size_t count){
    Message m = {
        .type = cmd,
        .offset = offset * BLOCK_SIZE,
        .count = count * BLOCK_SIZE,
        .buf = buf,
    };
    send(dev,&m);
    recvie(dev,&m);
    return m.status;
}
