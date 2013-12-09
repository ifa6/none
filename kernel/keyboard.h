#ifndef __KEYBOARD_H__
#define __KEYBOARD_H__

#include    "kernel.h"

extern void keyboard_init(void);
extern void copy_buffer(Object *o,void *buf,count_t count);

#endif
