#ifndef __NONE_TYPES_H__
#define __NONE_TYPES_H__
#include <stdint.h>

typedef long mode_t;
typedef long ssize_t; 
typedef long id_t;
typedef long pid_t;
typedef long uid_t;
typedef long gid_t;
typedef long clock_t;
typedef long time_t;
typedef long off_t;
typedef long object_t;
typedef long long loff_t;
typedef unsigned long pointer_t;
typedef unsigned long size_t;
typedef unsigned long cnt_t;
typedef unsigned long umode_t;
typedef unsigned long blkcnt_t;

typedef uint8_t  u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;

typedef int8_t  s8;
typedef int16_t s16;
typedef int32_t s32;
typedef int64_t s64;

typedef _Atomic uint8_t  atomic_u8;
typedef _Atomic uint16_t atomic_u16;
typedef _Atomic uint32_t atomic_u32;
typedef _Atomic uint64_t atomic_u64;

typedef _Atomic int8_t   atomic_s8;
typedef _Atomic int16_t  atomic_s16;
typedef _Atomic int32_t  atomic_s32;
typedef _Atomic int64_t  atomic_s64;

typedef const char * String;

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
