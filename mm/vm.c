#include <none/list.h>
#include <stdlib.h>
#include "vm.h"
#include "../kernel/kernel.h"
#include <z.h>

#define vm_entry(ptr)   list_entry(ptr,VM,list)


int mkvm(Object *thiz,Registers *reg){
    Elf32_Ehdr ehdr;
    Elf32_Shdr *shdr = NULL; /*! only ycm !*/
    Task *t = TASK(thiz->admit);
    int rlen = 0;
    rlen = try(-1 == ,read(thiz->lng,&ehdr,sizeof(ehdr)),throw e_fail);
    reg->eip = ehdr.e_entry;
    shdr = try(NULL == ,kalloc(ehdr.e_shentsize * ehdr.e_shnum),throw e_fail);
    lseek(thiz->lng,ehdr.e_shoff,SEEK_SET);
    rlen = try(-1 == ,read(thiz->lng,shdr,ehdr.e_shnum * ehdr.e_shentsize),throw e_fail); 
    INIT_LIST_HEAD(&(t->vm));
    foreach(i,0,ehdr.e_shnum){
        if((shdr->sh_type)){
            VM *new = try(NULL == ,kalloc(sizeof(*new)),throw e_fail);
            new->flags = shdr->sh_flags;
            new->count = 1;
            new->addr = (void*)shdr->sh_addr;
            new->offset = shdr->sh_offset;
            new->type = shdr->sh_type;
            new->object = thiz->lng;
            new->size = shdr->sh_size;
            list_add(&new->list,&(t->vm));
        }
        shdr++;
    }
    return 0;
    catch(e_fail){
        TEST_AND_FREE(kfree,shdr,NULL);
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

void *dovm(struct list_head *vm,void *vaddr){
    list_for_each(_pos,vm){
        VM *pos = vm_entry(_pos);
        //printk("[  VM] : %p\n",pos);
        if((vaddr >= pos->addr) && vaddr < (pos->addr + pos->size)){
            void *page = try(NULL ==, get_free_page(),throw e_fail);
            if(pos->type != SHT_NOBITS){
                lseek(pos->object,pos->offset + ((vaddr - pos->addr) & (~0xfff)),SEEK_SET);
                try(-1 ==,read(pos->object,page,PAGE_SIZE),throw e_fail);
            }
            //printk("self()->%s virtual = %p\npos->addr : %p pos->size : %x\n",self()->name,vaddr,pos->addr,pos->size);
            return page;
        }
    }
    catch(e_fail){
        return NULL;
    }
}
