#ifndef __DRIVER_H__
#define __DRIVER_H__
#include    "kernel.h"

typedef struct driver{
    int (*open)(Message *message);
    int (*read)(Message *message);
    int (*write)(Message *message);
    int (*close)(Message *message);
    int (*ioctl)(Message *message);
}Driver;

void shared_io_task(Driver *driver);

#endif
