#include <sys/inter.h>

off_t lseek(object_t o,off_t offset,int whence){
    return run(o,SEEK,whence,offset,0);
};
