#include <sys/inter.h>
#include <none/object.h>

off_t lseek(object_t o,off_t offset,int whence){
    return run(o,SEEK,.offset = offset,.whence = whence);
};
