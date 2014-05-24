#ifndef __NONE_VM_H__
#define __NONE_VM_H__
#include <none/types.h>
#include <none/task.h>
#include <elf.h>
#include <none/list.h>
#include <stddef.h>

typedef struct{
    unsigned long   flags;  /*! 段标志 !*/
    unsigned long   count;  /*! 段共享计数 !*/
    void            *vaddr;  /*! 段虚拟内存开始地址 !*/
    size_t          memsz;   /*! 段虚拟内存大小 !*/
    struct{
        object_t    object; /*! 段关联对象 !*/
        size_t      filesz;  /*! 关联对象大小 !*/
        off_t       offset; /*! 关联对象中的偏移 !*/
    };
    struct list_head list;
}VM;

int mkvm(Object *thiz,Registers *reg);
void *dovm(struct list_head *,void *vaddr);
void copyvm(struct list_head *);
void delvm(struct list_head *vm);

#endif
