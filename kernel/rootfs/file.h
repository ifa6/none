#ifndef __FILE_H__
#define __FILE_H__

#include "minix_fs.h"

typedef struct _file File;

struct _file{
    struct minix_inode_info  *inode;
    off_t       offset;
    count_t     cnt;
};

#endif
