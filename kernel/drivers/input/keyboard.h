#ifndef __KEYBOARD_H__
#define __KEYBOARD_H__

#include    "../../kernel.h"

extern void keyboard_init(void);
extern void copy_buffer(object_t o,void *buf,cnt_t count);

#endif
