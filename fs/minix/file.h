#ifndef __FILE_H__
#define __FILE_H__

#include    <none/task.h>
#include    "fs.h"

typedef struct _file File;

struct _file{
    Task        task;
    MinixInode  inode;
    off_t       offset;
};

#define _FILE(x)    ((File *)(x))

#endif
