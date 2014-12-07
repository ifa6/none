#ifndef __NONE_TYPES_H__
#define __NONE_TYPES_H__

typedef unsigned long Pointer;
typedef unsigned long size_t;
typedef unsigned long off_t;
typedef unsigned char byte_t;
typedef unsigned long count_t;

typedef const char * String;

typedef long        ssize_t; 
typedef long        id_t;
typedef long        pid_t;
typedef long        clock_t;
typedef long        time_t;
typedef long        object_t;

typedef int (*IrqHandler)(object_t,int);

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
