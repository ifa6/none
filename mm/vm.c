#include <none/list.h>
#include <stdlib.h>
#include "vm.h"
#include "../kernel/kernel.h"
#include <z.h>

#define vm_entry(ptr)   list_entry(ptr,VM,list)
#define VMHEAD(ptr)     ((VMHead*)(ptr->private_data))


int mkvm(Object *thiz,Registers *reg){
    Elf32_Ehdr ehdr;
    Elf32_Phdr *phdr = NULL;
    size_t psize = 0;
    VMHead *vmhead = NULL;
    /*! Elf32_Shdr *shdr = NULL; !*/ /*! only ycm !*/
    struct {
        char *argv[32];
        char env[0];
    } *buff = thiz->ptr;
    int rlen = 0;

    strcpy(thiz->admit->name,buff->argv[0]);
    strcat(thiz->admit->name,"<mm>");

    rlen = try(-1 == ,read(thiz->object,&ehdr,sizeof(ehdr)),throw e_fail);
    memcpy(reg,&(Registers){
        .gs  = KERNEL_DATA, .fs = KERNEL_DATA,
        .ds  = KERNEL_DATA, .es = KERNEL_DATA,
        .edi = 0,           .esi = 0, 
        .ebp = 0,           .ebx = 0, 
        .edx = 0, 
        .ecx = thiz->count, .eax = (unsigned long)buff->argv,
        .eip = ehdr.e_entry,.cs  = KERNEL_CODE, 
        .eflags = 0x200,
    },sizeof(Registers));

    psize = ehdr.e_phentsize * ehdr.e_phnum;
    phdr = try(NULL == ,kalloc(psize),throw e_fail);
    lseek(thiz->object,ehdr.e_phoff,SEEK_SET);
    rlen = try(-1 == ,read(thiz->object,phdr,psize),throw e_fail); 

    vmhead = try(NULL == ,kalloc(sizeof(VMHead)),throw e_fail);
    vmhead->object = thiz->object;
    vmhead->cnt = 1;
    INIT_LIST_HEAD(&(vmhead->list));
    foreach(i,0,ehdr.e_phnum){
        if(phdr[i].p_type == PT_LOAD){
            VM *new = try(NULL == ,kalloc(sizeof(*new)),throw e_fail);
            new->flags = phdr[i].p_flags;
            new->vaddr = (void*)phdr[i].p_vaddr;
            new->offset = phdr[i].p_offset;
            new->memsz = phdr[i].p_memsz;
            new->filesz = phdr[i].p_filesz;
            list_add(&(new->list),&(vmhead->list));
        }
    }
    thiz->admit->private_data = vmhead;
    return 0;
    catch(e_fail){
        delvm(vmhead);
        TEST_AND_FREE(kfree,vmhead,NULL);
    }
    unused(rlen);
    return -1;
}

void delvm(VMHead *vmhead){
    if(vmhead && !(--vmhead->cnt)) {
        printk("\erTODO : MM can't close object,call link {mm -> object -> mm} is die.  %s:%d\ew\n",__FILE__,__LINE__);
        //close(vm_entry(pos)->object);
        struct list_head *head = &(vmhead->list);
        for(struct list_head *pos = head,*next;pos != head;) {
            next = pos->next;
            kfree(vm_entry(pos));
            pos = next;
        }
        kfree(vmhead);
    }
}

void copyvm(VMHead *vmhead){
    if(vmhead)
        vmhead->cnt--;
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

void *dovm(VMHead *vmhead,void *vaddr){
    if(vmhead) {
        void *page = try(NULL ==, get_free_page(),throw e_fail);
        size_t len = 0;
        struct list_head *head = &(vmhead->list);
        list_for_each(_pos,head){
            VM *pos = vm_entry(_pos);
            if((vaddr >= pos->vaddr) && vaddr < (pos->vaddr + pos->memsz)){
                len = clr(pos,vaddr);
                if(len){
                    lseek(vmhead->object,pos->offset + ((vaddr - pos->vaddr) & (~0xfff)),SEEK_SET);
                    try(-1 ==,read(vmhead->object,page,len),throw e_fail);
                }
                break;
            }
        }
        return page;
    }
    catch(e_fail){
        return NULL;
    }
}
