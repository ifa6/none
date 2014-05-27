#ifndef __NONE_POSIX_H__
#define __NONE_POSIX_H__
#include <none/object.h>
#include <sys/inter.h>
object_t dup(object_t obj);
object_t dup2(object_t old,object_t nw);
#define O_RDONLY    0
#define O_WDONLY    1
#endif
