#ifndef _STDDEF_H
#define _STDDEF_H

typedef unsigned long size_t;


#ifndef NULL
#define NULL    ((void *)0)
#endif

#define offsetof(s,m)   ((size_t)&((s *)0)->m)

#endif
