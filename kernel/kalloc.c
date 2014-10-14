/*
 *  Copy form linux 0.12 .
 *
 */
#include <sys/inter.h>
#include "kernel.h"

#define isnull(p)   (!(p))
/* get page pointer */
#define get_pointer(p)      ((p) & 0xfffff000)

typedef struct _bucket{
    void    *page;
    struct  _bucket *next;
    void    *freeptr;
    unsigned short refcnt;
    unsigned short bucket_size;
}Bucket;

struct _bucket_dir{
    unsigned int     size;
    Bucket  *bucket;
};

struct _bucket_dir bucket_dir[] = {
    {16,NULL},
    {32,NULL},
    {64,NULL},
    {128,NULL},
    {256,NULL},
    {512,NULL},
    {1024,NULL},
    {2048,NULL},
    {4096,NULL},
    {0,NULL},
};

Bucket *free_bucket = NULL;

static inline void bucket_init(void){
    Bucket *first,*bdesc;
    
    first = bdesc = (Bucket *)(get_kfree_page());
    if(isnull(bdesc)) panic("Out of memory in init bucket_init!\n");
    for(int i = PAGE_SIZE / sizeof(Bucket);i > 1;i--){
        bdesc->next = bdesc + 1;
        bdesc++;
    }
    bdesc->next = free_bucket; 
    free_bucket = first;
}

void *kalloc(unsigned int len){
    Bucket *bdesc;
    struct _bucket_dir *bdir;
    void *retval = NULL;
    for(bdir = bucket_dir;bdir->size;bdir++)
        if(bdir->size > len)
            break;
    if(!bdir->size) panic("Don't alloc the memory!\n");
    lock();
    for(bdesc = bdir->bucket;bdesc;bdesc = bdesc->next)
        if(bdesc->freeptr)
            break;
    if(isnull(bdesc)){
        char *cp = NULL;
        if(isnull(free_bucket)) bucket_init();
        bdesc = free_bucket;
        free_bucket = free_bucket->next;
        bdesc->refcnt = 0;
        bdesc->bucket_size = bdir->size;
        bdesc->page = bdesc->freeptr = cp = (void *)(get_kfree_page());
        if(isnull(cp)) panic("Out of memory in kernel malloc()\n");
        for(int i = PAGE_SIZE / bdir->size;i > 1;i--){
            *((char **)cp) = cp + bdir->size;
            cp += bdir->size;
        }
        *((char **)cp) = NULL;
        bdesc->next = bdir->bucket;
        bdir->bucket = bdesc;
    }
    retval = bdesc->freeptr;
    bdesc->freeptr = *((void **) retval);
    bdesc->refcnt++;
    unlock();
    return retval;
}

void kfree_s(void *obj,unsigned int size){
    void    *page;
    struct _bucket_dir *bdir;
    Bucket  *bdesc,*prev;

    page = (void *)(get_pointer((Pointer)obj));

    for(bdir = bucket_dir;bdir->size;bdir++){
        prev = NULL;
        if(bdir->size < size) continue;
        for(bdesc = bdir->bucket;bdesc;bdesc = bdesc->next){
            if(bdesc->page == page)
                goto found;
            prev = bdesc;
        }
    }
    panic("Bad address passed to kernel free_s()");
found:
    lock();
    *((void **)obj) = bdesc->freeptr;
    bdesc->refcnt--;
    if(bdesc->refcnt == 0){
        if((prev && (prev->next != bdesc)) || (!prev && (bdir->bucket != bdesc)))
            for(prev = bdir->bucket;prev;prev = prev->next)
                if(prev->next == bdesc)
                    break;
        if(prev)
            prev->next = bdesc->next;
        else{
            if(bdir->bucket != bdesc)
                panic("malloc bucket corrupted\n");
            bdir->bucket = bdesc->next;
        }
        free_page((Pointer)bdesc->page);
        bdesc->next = free_bucket;
        free_bucket = bdesc;
    }
    unlock();
}
