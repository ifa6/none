#include    "../kernel/kernel.h"

/*! BUG !*/
#define CMEM  0xC00000   //CONST_MEM
extern unsigned char *mmap; 

typedef union _pageItem{
    union _pageItem *table;
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
#define isWrite(x) ((x)->write = 1)
#define toPointer(x)    ((x) & (~0xfff))
#define isPresent(x)    ((x)->present == 1)
#define clrPresent(x) ((x)->present = 0)
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
    nsp = copy_items(space,CMEM >> 22,1024);
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
        nt->core = (Pointer)clone_space((void *)(ot->core),nt);
        nt->father = ot;
        ret(OBJECT(nt),OK);
        ret(this->admit,OBJECT(nt)->id);
    }
}

#if 1
static void delete_table(PageItem *table){
    for(int i = 0;i < 1024;i++){
        if(isPresent(table + i)){
            free_page(toPointer(table[i].pointer));
        }
    }
}
#endif

static void delete(Object *this){
    Task *t = TASK(this->admit);
    PageItem *nsp = (PageItem *)t->core;
    for(int i = CMEM >>22;i < 1024;i++){
        if(isPresent(nsp + i)){
            delete_table((PageItem *)(nsp[i].pointer));
            free_page(toPointer(nsp[i].pointer));
        }
    }
    free_page((Pointer)(nsp));
    /*! object_table[this->admit->id] = NULL; !*/
    ret(OBJECT(t->father),this->admit->id);
    /*! free_page((Pointer)t); !*/
}

static void free_clild(Object *this){
    Task *t = TASK(this->admit);
    Object *child = toObject(this->r1);
    if(isNullp(child)) ret(this->admit,ERROR);
    if(TASK(child)->father == t){
        object_table[child->id] =NULL;
        ret(this->admit,OK);
        free_page((Pointer)child);
    }
}


#define isSection(x,p) ((x.section >= p) && ((x.section + x.count) >= p))

static int put_page(PageItem *dirs,void *va){
    PageItem *table = NULL;
    void *page = NULL;
    if(!isPresent(dirs + DIR_INDEX((Pointer)va))){
        table = (void*)get_free_page();
        if(isNullp(table)) return ERROR;
        put_item(dirs,table,DIR_INDEX((Pointer)va),7);
    }
    page = (void*)get_free_page();
    if(isNullp(page)) return ERROR;
    table = (void *)(((Pointer)dirs[DIR_INDEX((Pointer)va)].table) & (~0xfff));
    put_item(table,page,TABLE_INDEX((Pointer)va),7);
    return OK;
}

static void np_page(Object *this){
    void *ptr = this->pointer;
    Task *t = TASK(this->admit);
    if(isSection(t->code,ptr)){
        ret(this->admit,put_page((PageItem *)t->core,ptr));
    }
    ret(this->admit,put_page((PageItem *)t->core,ptr));
}

static PageItem *_un_table(PageItem *dirs,void *va){
    PageItem *table = (void*)(((Pointer)dirs[DIR_INDEX((Pointer)va)].table) & (~0xfff));
    PageItem *new_table = NULL;
    for(int i = 0;i < 1024;i++){
        if(isPresent(table + i)){
            table[i].write = 0;
        }
    }
    if(mmap[DIR_INDEX((Pointer)va)] > 1){
        mmap[DIR_INDEX((Pointer)va)]--; 
        new_table = (void*)get_free_page();
        if(isNullp(new_table)) return NULL;
        copy_page(new_table,table);
        table = new_table;
    }
    return table;
}

static PageItem *_un_page(PageItem *table,void *va){
    PageItem *page = (void*)(((Pointer)table[TABLE_INDEX((Pointer)va)].table) & (~0xfff));
    PageItem *new_page = NULL;
    if(mmap[TABLE_INDEX((Pointer)va)] > 1){
        mmap[TABLE_INDEX((Pointer)va)]--;
        new_page = (void*)get_free_page();
        if(isNullp(page)) return NULL;
        copy_page(new_page,page);
        page = new_page;
    }
    return page;
}

static void nw_page(Object *this){
    void *ptr = this->pointer;
    Task *t = TASK(this->admit);
    PageItem *table = _un_table((PageItem *)t->core,ptr);
    if(isNullp(table)) ret(this->admit,ERROR);
    put_item((PageItem*)t->core,table,DIR_INDEX((Pointer)ptr),7);
    void *page = _un_page(table,ptr);
    if(isNullp(page)) ret(this->admit,ERROR);
    put_item(table,page,TABLE_INDEX((Pointer)ptr),7);
    ret(this->admit,OK);
}

static PageItem *__clone_space__(PageItem *space,void *page){
    PageItem *nsp = (void*)get_free_page();
    PageItem *ntp = (void*)get_free_page();
    PageItem *tmp = (PageItem *)toPointer(space[DIR_INDEX(KERNEL_STACK)].pointer);
    if(isNullp(nsp) || isNullp(ntp)) panic("memory very full!-_-|||");
    copy_page(nsp,space);
    for(int i = CMEM>>22;i < 1024;i++){
        clrPresent(nsp + i);
    }
    copy_page(ntp,tmp);
    put_item(ntp,page,TABLE_INDEX(KERNEL_STACK),7);
    put_item(nsp,ntp,DIR_INDEX(KERNEL_STACK),7);
    return nsp;
}

#if 1
static Task* make_task(String name,int (*entry)(void)){
    Task *task;
    task = TASK(cloneObject(self()));
    task->core = (Pointer)__clone_space__((void *)(TASK(self())->core),task);
    task->registers = (void*)(KERNEL_STACK + 0x1000 - 16 - sizeof(Registers));
    task->pri = PRI_TASK;
    task->count = 20;
    task->ucount = 20;
    strcpy(OBJECT(task)->name,name);
    /*! 之前COPY到KERBEL_STACK,这是不对的,因为还没有切换到那个页去,谨记 !*/
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
    self()->close = delete;
    self()->fns[NO_PAGE] = np_page;
    self()->fns[WP_PAGE] = nw_page;
    self()->fns[EXIT] = free_clild;
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
