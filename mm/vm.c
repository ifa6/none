#include <none/list.h>
#include <stdlib.h>
#include "vm.h"
#include "../kernel/kernel.h"
#define  eprint(fmt,...) printk("[ VM] : %-4d "fmt" %s\n",__LINE__,__func__)
#include <z.h>

#define vm_entry(ptr)   list_entry(ptr,VM,list)


int mkvm(Task *task,struct list_head *vm,const char *path){
    object_t obj = -1;
    Elf32_Ehdr ehdr;
    Elf32_Shdr *shdr = NULL; /*! only ycm !*/
    int rlen = 0;
    obj = try(-1 ==,open(path,0),throw e_fail);
    rlen = try(-1 == ,read(obj,&ehdr,sizeof(ehdr)),throw e_fail);
    task->registers->eip = ehdr.e_entry;
    //task->registers->esp = 0x7fffff;
    shdr = try(NULL == ,kalloc(ehdr.e_shentsize * ehdr.e_shnum),throw e_fail);
    lseek(obj,ehdr.e_shoff,SEEK_SET);
    rlen = try(-1 == ,read(obj,shdr,ehdr.e_shnum * ehdr.e_shentsize),throw e_fail); 
    foreach(i,0,ehdr.e_shnum){
        if((shdr->sh_type)){
            VM *new = try(NULL == ,kalloc(sizeof(*new)),throw e_fail);
            new->flags = shdr->sh_flags;
            new->count = 1;
            new->addr = (void*)shdr->sh_addr;
            new->offset = shdr->sh_offset;
            new->type = shdr->sh_type;
            new->object = obj;
            new->size = shdr->sh_size;
            list_add(vm,&(new->list));
        }
        shdr++;
    }
    return 0;
    catch(e_fail){
        TEST_AND_FREE(kfree,shdr,NULL);
        TEST_AND_FREE(close,obj,-1);
    }
    unused(rlen);
    return -1;
}

void delvm(struct list_head *vm){
    if(!vm) panic("Free VM");
    struct list_head *next,*pos = vm->next;
    vm_entry(vm)->count--;
    if(!vm_entry(vm)->count){
        close(vm_entry(vm)->object);
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
        printk("%p\n",_pos);
        VM *pos = vm_entry(_pos);
        if(vaddr >= pos->addr && vaddr < pos->addr + pos->size){
            void *page = try(NULL ==, get_free_page(),throw e_fail);
            if(pos->type != SHT_NOBITS){
                lseek(pos->object,pos->offset + (vaddr - pos->addr),SEEK_SET);
                read(pos->object,page,PAGE_SIZE);
            }
            return page;
        }
    }
    catch(e_fail){
        return NULL;
    }
}
