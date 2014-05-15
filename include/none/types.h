#ifndef __NONE_TYPES_H__
#define __NONE_TYPES_H__

typedef unsigned long Pointer;
typedef unsigned long size_t;
typedef unsigned long off_t;
typedef unsigned char byte_t;
typedef unsigned long count_t;
typedef long    ssize_t; 

typedef const char * String;

typedef long        id_t;
typedef int         pid_t;
typedef long        clock_t;
typedef long        time_t;
typedef long        object_t;

typedef int (*IrqHandler)(object_t,int);

typedef enum{
    false = 0,
    true = 1
}bool;

typedef union{ struct{
    union{
        long status;
        unsigned long mode;
        unsigned long r1;
        off_t offset;
    };
    union{
        unsigned long r2;
        count_t count;
    };
    union{
        unsigned long r3;
        void *buffer;
        void *ptr;
        const char *const name;
    };
}; }sysarg_t;

typedef struct{
    long back_link;
    long esp0;
    long ss0;
    long esp1;
    long ss1;
    long esp2;
    long ss2;
    long cr3;
    long eip;
    long eflags;
    long eax,ecx,edx,ebx;
    long esp;
    long ebp;
    long esi;
    long edi;
    long es;
    long cs;
    long ss;
    long ds;
    long fs;
    long gs;
    long ldt;
    long io;
}Tss;

#endif
