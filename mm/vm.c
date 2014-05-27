#include <none/list.h>
#include <stdlib.h>
#include "vm.h"
#include "../kernel/kernel.h"
#include <z.h>

#define vm_entry(ptr)   list_entry(ptr,VM,list)


int mkvm(Object *thiz,Registers *reg){
    Elf32_Ehdr ehdr;
    Elf32_Phdr *phdr = NULL;
    size_t psize = 0;
    /*! Elf32_Shdr *shdr = NULL; !*/ /*! only ycm !*/
    Task *t = TASK(thiz->admit);
    struct {
        char *argv[32];
        char env[0];
    } *buff = thiz->ptr;
    int rlen = 0;

    strcpy(thiz->admit->name,buff->argv[0]);

    rlen = try(-1 == ,read(thiz->lng,&ehdr,sizeof(ehdr)),throw e_fail);
    reg->eip = ehdr.e_entry;
    reg->ss = thiz->count;
    reg[1].gs = (long)buff->argv;

    psize = ehdr.e_phentsize * ehdr.e_phnum;
    phdr = try(NULL == ,kalloc(psize),throw e_fail);
    lseek(thiz->lng,ehdr.e_phoff,SEEK_SET);
    rlen = try(-1 == ,read(thiz->lng,phdr,psize),throw e_fail); 

    INIT_LIST_HEAD(&(t->vm));
    foreach(i,0,ehdr.e_phnum){
        if(phdr[i].p_type == PT_LOAD){
            VM *new = try(NULL == ,kalloc(sizeof(*new)),throw e_fail);
            new->flags = phdr[i].p_flags;
            new->count = 1;
            new->vaddr = (void*)phdr[i].p_vaddr;
            new->offset = phdr[i].p_offset;
            new->memsz = phdr[i].p_memsz;
            new->filesz = phdr[i].p_filesz;
            new->object = thiz->lng;
            list_add(&new->list,&(t->vm));
        }
    }
    return 0;
    catch(e_fail){
        TEST_AND_FREE(kfree,phdr,NULL);
    }
    unused(rlen);
    return -1;
}

void delvm(struct list_head *vm){
    if(!vm) panic("Free VM");
    struct list_head *next,*pos = vm->next;
    vm_entry(pos)->count--;
    if(!vm_entry(pos)->count){
        //close(vm_entry(pos)->object);
        printk("\erTODO : close object %s %d\ew\n",__FILE__,__LINE__);
        do{
            next = pos;
            pos = pos->next;
            kfree(vm_entry(next));
        }while(vm != pos);
    }
    INIT_LIST_HEAD(vm);
}

void copyvm(struct list_head *vm){
    vm_entry(vm->next)->count++;
}

static size_t clr(VM *pos,void *vaddr){
    off_t offset = (vaddr - pos->vaddr) & (~0xfff);
    if(offset > pos->filesz) {
        return 0;
    } else if(offset + PAGE_SIZE > pos->filesz){
        return pos->filesz & 0xfff;
    };
    return PAGE_SIZE;
}

void *dovm(struct list_head *vm,void *vaddr){
    void *page = try(NULL ==, get_free_page(),throw e_fail);
    size_t len = 0;
    list_for_each(_pos,vm){
        VM *pos = vm_entry(_pos);
        if((vaddr >= pos->vaddr) && vaddr < (pos->vaddr + pos->memsz)){
            len = clr(pos,vaddr);
            if(len){
                lseek(pos->object,pos->offset + ((vaddr - pos->vaddr) & (~0xfff)),SEEK_SET);
                try(-1 ==,read(pos->object,page,len),throw e_fail);
            }
            break;
        }
    }
    return page;
    catch(e_fail){
        return NULL;
    }
}
