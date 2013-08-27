#include    "../kernel/kernel.h"

typedef union {
    struct{
        unsigned long present:1;
        unsigned long write:1;
        unsigned long super:1;
        unsigned long :2;
        unsigned long access:1;
        unsigned long dirty:1;
        unsigned long :2;
        unsigned long avl:3;
    };
    Pointer pointer;
}PageItem;

#define clrWrite(x) ((x)->write = 0)
#define toPointer(x)    ((x) & (~0xfff))
/* copy page memory from f to t (4kb) */
#define copy_page(t,f) \
    __asm__("cld;rep movsl;"::"S"(f),"D"(t),"c"(1024));

static PageItem *copy_items(PageItem *items,int start,int end){
    PageItem *nitm = NULL;
    nitm = (void *)get_free_page();
    if(isNullp(nitm)) panic("copy_items failt : memory out!");
    for(int i = start;i < end;i++){
        clrWrite(items + i);
    }
    copy_page(nitm,items);
    return nitm;
}

#define DIR_INDEX(x) ((x) >> 22)
#define TABLE_INDEX(x)  (((x) >> 12) & 0x3ff)

static inline void put_item(PageItem *items,void *page,int index,int mode){
    items[index] = (PageItem)(toPointer((Pointer)page) | 7);
}

static PageItem *clone_space(PageItem *space,void *page){
    PageItem *nsp = NULL;
    PageItem *ntb = NULL;
    PageItem *tmp = (PageItem *)toPointer(space[DIR_INDEX(KERNEL_STACK)].pointer);
    nsp = copy_items(space,0xA000000 >> 22,1024);
    ntb = copy_items(tmp,0,0);
    put_item(ntb,page,TABLE_INDEX(KERNEL_STACK),7);
    put_item(nsp,ntb,DIR_INDEX(KERNEL_STACK),7);
    return nsp;
}

static void clone(Object *this){
    Task *ot = TASK(this->admit);
    Task *nt = TASK(cloneObject(OBJECT(ot)));
    if(isNullp(nt)){
        ret(this->admit,ERROR);
    }else{
        //printk("%s\n",OBJECT(nt)->name);
        nt->core = (Pointer)clone_space((void *)(ot->core),nt);
        ret(OBJECT(nt),OK);
        ret(this->admit,OBJECT(nt)->id);
    }
}

#if 1
static Task* make_task(String name,int (*entry)(void)){
    Task *task;
    task = TASK(cloneObject(self()));
    task->core = (Pointer)clone_space((void *)(TASK(self())->core),task);
    task->registers = (void*)(KERNEL_STACK + 0x1000 - 16 - sizeof(Registers));
    strcpy(OBJECT(task)->name,name);
    /*! 之前靠背到KERBEL_STACK,这是不对的,因为还没有切换到那个页去,谨记 !*/
    memcpy(((void*)STACK(task)->stackp) - sizeof(Registers),&(Registers){
            .gs = KERNEL_DATA,
            .fs = KERNEL_DATA,
            .ds = KERNEL_DATA,
            .es = KERNEL_DATA,
            .edi = 0,
            .esi = 0,
            .ebp = 0,
            .ebx = 0,
            .edx = 0,
            .ecx = 0,
            .eax = 0,
            .eip = (long)(entry),
            .cs = KERNEL_CODE,
            .eflags = 0x200,
            },sizeof(Registers));
    return task;
}
#endif

static void _mm_init(void){
    Task *task;
    self()->clone = clone;
    extern int system_main(void);
    task = make_task("System",system_main);
    OBJECT(task)->wait = self();
    ret(OBJECT(task),OK);
}

int mm_main(void){
    _mm_init();
    while(1){
        get();
        dorun(self());
    }
    return 0;
}
