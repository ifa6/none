#ifndef _STDDEF_H
#define _STDDEF_H

typedef unsigned long size_t;


#ifndef NULL
#define NULL    ((void *)0)
#endif

#define offsetof(TYPE, MEMBER) __builtin_offsetof (TYPE, MEMBER)

#ifndef offsetof
#define offsetof(s,m)   ((size_t)&((s *)0)->m)
#endif

#endif
