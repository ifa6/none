#ifndef __NONE_VM_H__
#define __NONE_VM_H__
#include <none/types.h>
#include <none/task.h>
#include <elf.h>
#include <none/list.h>
#include <stddef.h>

typedef struct{
    unsigned long   flags;
    unsigned long   type;
    unsigned long   count;
    void            *addr;
    size_t          size;
    struct{
        object_t    object;
        off_t       offset;
    };
    struct list_head list;
}VM;

int mkvm(Task *,struct list_head *,const char *path);
void *dovm(struct list_head *,void *vaddr);
void copyvm(struct list_head *);
void delvm(struct list_head *vm);

#endif
