#include    "fs.h"

MinixSuperBlock *read_super(const dev_t dev){
    static char super[BLOCK_SIZE];
    if(OK != block_rw(dev,READ,super,SUPER_BLOCK,1)) return NULL;
    SUPER(super)->s_dev = dev;
    return (MinixSuperBlock *)super;
}

