#ifndef _STDDEF_H
#define _STDDEF_H

typedef unsigned long size_t;


#ifndef NULL
#define NULL    ((void *)0)
#endif

#define offsetof(TYPE,MEMBER)   __builtin_offsetof(TYPE,MEMBER)

#ifndef container_of
#ifdef  __clang__       /*! only ycm !*/
#define container_of(ptr,type,member) ({\
        const __typeof__(ptr) _mptr = (ptr); \
        (type *)((char *)_mptr - offsetof(type,member));})
#else
#define container_of(ptr,type,member) ({\
        const __auto_type _mptr = (ptr); \
        (type *)((char *)_mptr - offsetof(type,member));})
#endif
#endif


#endif
