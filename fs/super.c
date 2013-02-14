#include    "fs.h"

MinixSuperBlock *read_super(const int dev){
    static char super[BLOCK_SIZE];
    if(OK != block_rw(READ,dev,super,SUPER_BLOCK,1)) return NULL;
    return super;
}

