#ifndef TYPES_H
#define TYPES_H

typedef unsigned long Pointer;
typedef unsigned long size_t;
typedef long    ssize_t; 
typedef int     pid_t;
typedef unsigned char Byte;
typedef int (*IrqHandler)(int);

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

typedef struct {
    long gs;
    long fs;
    long ds;
    long es;
    long edi;
    long esi;
    long ebp;
    long _esp;
    long ebx;
    long edx;
    long ecx;
    long eax;
    long eip;
    long cs;
    long eflags;
    long esp;
    long ss;
}Registers;


typedef struct message Message;
struct message{
    int type;
    pid_t   src;
    union{
        struct{Pointer cr2,cr3;};
        char msg[64 - 8];
    };
};
typedef struct intelink Interrput;
struct intelink{
    Message message;
    Interrput *next;
};
typedef struct proc Proc;
struct proc{
    pid_t pid;
    long counter;
    long timeout;
    int  pri;
    int  flags;
    pid_t   getfrom,wait;
    Pointer core;
    Pointer esp0;
    Registers *registers;
    char pname[16];
    Message message;
    Interrput *interruptlink;
    struct proc *next,*prev;
    struct proc *sendlink;
};

union{
    Proc proc;
    char stack[KERNEL_STACK_SIZE];
}Task;


#endif
