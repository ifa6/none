#ifndef __NONE_VM_H__
#define __NONE_VM_H__
#include <none/types.h>
#include "../task.h"
#include <elf.h>
#include <none/list.h>
#include <stddef.h>

#ifdef MM_LOG
#define mm_log(fmt,...) dbg("MM",fmt,##__VA_ARGS__)
#else
#define mm_log(...)
#endif

typedef struct{
    unsigned long   flags;   /*! 段标志 !*/
    void            *vaddr;  /*! 段虚拟内存开始地址 !*/
    size_t          memsz;   /*! 段占虚拟内存大小 !*/
    size_t          filesz;  /*! 段占文件大小 !*/
    off_t           offset;  /*! 段在文件中的偏移 !*/
    struct list_head list;
}VM;

typedef struct {
    count_t   cnt;          /*! 段共享计数 !*/
    object_t  object;       /*! 段关联文件 !*/
    struct list_head list;
}VMHead;

void *mkvm(object_t,void *ptr,count_t ,Registers *reg,char *name);
void *dovm(VMHead*,void *vaddr);
void copyvm(VMHead *);
void delvm(VMHead *vm);

#endif
