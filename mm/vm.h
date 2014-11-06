#ifndef __NONE_VM_H__
#define __NONE_VM_H__
#include <none/types.h>
#include "../kernel/task.h"
#include <elf.h>
#include <none/list.h>
#include <stddef.h>

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

int mkvm(Object *thiz,Registers *reg);
void *dovm(VMHead*,void *vaddr);
void copyvm(VMHead *);
void delvm(VMHead *vm);

#endif
