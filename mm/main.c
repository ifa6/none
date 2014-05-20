#include    "../kernel/kernel.h"
#include "vm.h"

#define MM_LOG

/*! BUG !*/
#define CMEM  0xC00000   //CONST_MEM

#define mm_error(fmt,...)   printk("\eg[MM   ] : \er|ERROR   | \ew"fmt"\n",##__VA_ARGS__)

#ifdef  MM_LOG
#define mm_log(fmt,...) printk("[  MM] : %-4d "fmt,__LINE__,##__VA_ARGS__)

#else
#define mm_log(fmt,...)
#endif
static void trace(Object *);


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
#define isWrite(x) (1 == (x)->write)
#define toPointer(x)    ((x) & (~0xfff))
#define isPresent(x)    (1 == (x)->present)
#define clrPresent(x) ((x)->present = 0)
/* copy page memory from f to t (4kb) */
#define copy_page(t,f) \
    __asm__("cld;rep movsl;"::"S"(f),"D"(t),"c"(1024));

#if 0
#define get_free_page() ({\
        void* _v = get_free_page();\
        if(_v == (void*)0x00ffc000) printk("%d\n",__LINE__);\
        _v;})
#endif

static PageItem *copy_items(PageItem *items,int start,int end){
    PageItem *nitm = NULL;
    nitm = (void *)get_free_page();
    if(!nitm) panic("copy_item failt : memory out!");
    for(int i = start;i < end;i++){
        clrWrite(items + i);
        //clrPresent(items + i);
    }
    copy_page(nitm,items);
    return nitm;
}

#define DIR_INDEX(x) ((x) >> 22)
#define TABLE_INDEX(x)  (((x) >> 12) & 0x3ff)

static inline void put_item(PageItem *items,void *page,int index,int mode){
    (void)mode;
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
    if(!nt){
        ret(this->admit,ERROR);
    }else{
        nt->core = (Pointer)clone_space((void *)(ot->core),nt);
        nt->father = ot;
        copyvm(&(nt->vm));
        ret(OBJECT(nt),OK);
        ret(this->admit,OBJECT(nt)->id);
    }
}

#if 1
static int delete_table(PageItem *table){
    for(int i = 0;i < 1024;i++){
        if(isPresent(table + i)){
            table[i].present = 0;
            if(ERROR == free_page(table[i].pointer)){
                mm_error("table[%d] = %08x",i,table[i].pointer);
                return ERROR;
            }
        }
    }
    return OK;
}
#endif

static void _delete(PageItem *dir){
    for(int i = CMEM >>22;i < 1024;i++){
        if(isPresent(dir + i)){
            dir[i].present = 0;
            if((ERROR == delete_table((PageItem *)(toPointer(dir[i].pointer)))) || 
                    (ERROR == free_page(dir[i].pointer))){
                mm_error("  dir[%d] = %08x",i,dir[i].pointer);
                panic("free page fail");
            }
        }
    }
}

static void delete(Object *this){
    Task *t = TASK(this->admit);
    PageItem *nsp = (PageItem *)t->core;
    _delete(nsp);
    if(ERROR == free_page((Pointer)(nsp))){
        panic("free page fail");
    }
    delvm(&(t->vm));
    /*! object_table[this->admit->id] = NULL; !*/
    trace(OBJECT(t->father));
    ret(OBJECT(t->father),this->admit->id);
    mm_log("Level\n");
    /*! free_page((Pointer)t); !*/
}

static void free_child(Object *this){
    Task *t = TASK(this->admit);
    Object *child = toObject(this->r1);
    if(!child) ret(this->admit,ERROR);
    if(TASK(child)->father == t){
        object_table[child->id] = NULL;
        ret(this->admit,OK);
        free_page((Pointer)child);
    }
}


static int put_page(PageItem *dirs,void *va,void *page){
    PageItem *table = NULL;
    if(!isPresent(dirs + DIR_INDEX((Pointer)va))){
        table = get_free_page();
        if(!table) return ERROR;
        put_item(dirs,table,DIR_INDEX((Pointer)va),7);
    }
    if(!page) return ERROR;
    table = (void *)(((Pointer)dirs[DIR_INDEX((Pointer)va)].table) & (~0xfff));
    put_item(table,page,TABLE_INDEX((Pointer)va),7);
    return OK;
}

static void np_page(Object *this){
    void *ptr = this->ptr;
    Task *t = TASK(this->admit);
    void *page = dovm(&(t->vm),ptr);
    //trace(this->admit);
    ret(this->admit,put_page((PageItem *)t->core,ptr,page));
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
        if(!new_table) return NULL;
        copy_page(new_table,table);
        table = new_table;
    }
    return table;
}

static void *__va(PageItem *dirs,void *va){
    PageItem *table = (void*)(((Pointer)dirs[DIR_INDEX((Pointer)va)].table) & (~0xfff));
    return (void*)((((Pointer)table[TABLE_INDEX((Pointer)va)].table) & (~0xfff)) + (((Pointer) va) & 0xfff));
}

static PageItem *_un_page(PageItem *table,void *va){
    PageItem *page = (void*)(((Pointer)table[TABLE_INDEX((Pointer)va)].table) & (~0xfff));
    PageItem *new_page = NULL;
    if(mmap[TABLE_INDEX((Pointer)va)] > 1){
        mmap[TABLE_INDEX((Pointer)va)]--;
        new_page = (void*)get_free_page();
        if(!new_page) return NULL;
        copy_page(new_page,page);
        page = new_page;
    }
    return page;
}

static void nw_page(Object *this){
    void *ptr = this->ptr;
    Task *t = TASK(this->admit);
    PageItem *table = _un_table((PageItem *)t->core,ptr);
    if(!table) ret(this->admit,ERROR);
    put_item((PageItem*)t->core,table,DIR_INDEX((Pointer)ptr),7);
    void *page = _un_page(table,ptr);
    if(!page) ret(this->admit,ERROR);
    put_item(table,page,TABLE_INDEX((Pointer)ptr),7);
    ret(this->admit,OK);
}

static PageItem *__clone_space__(PageItem *space,void *page){
    PageItem *nsp = (void*)get_free_page();
    PageItem *ntp = (void*)get_free_page();
    PageItem *tmp = (PageItem *)toPointer(space[DIR_INDEX(KERNEL_STACK)].pointer);
    if(or(!,nsp,ntp)) panic("memeory very full!-_-|||");
    copy_page(nsp,space);
    for(int i = CMEM >> 22;i < 1024;i++){
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
    VM *vm;
    task = TASK(cloneObject(self()));
    task->core = (Pointer)__clone_space__((void *)(TASK(self())->core),task);
    task->registers = (void*)(KERNEL_STACK + 0x1000 - sizeof(Registers));
    task->pri = PRI_TASK;
    task->count = 20;
    task->ucount = 20;
    INIT_LIST_HEAD(&(task->vm));
    vm = kalloc(sizeof(vm));
    vm->object = 0;
    vm->offset = 0;
    vm->type   = SHT_NOBITS;
    vm->count  = 2; /*! never eq 0 ,it's right !*/
    vm->addr   = NULL;
    vm->size   = -1; /*! MAX size !*/
    list_add(&(vm->list),&(task->vm));

    strcpy(OBJECT(task)->name,name);
    /*! 之前COPY到KERBEL_STACK,这是不对的,因为还没有切换到那个页去,谨记 !*/
    memcpy(STACK(task)->stackp - sizeof(Registers),&(Registers){
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


static void trace(Object *obj){
    Task *t = TASK(obj);
    Registers *reg = __va((void*)(t->core),t->registers);
    mm_log("-----------------Object : %s--------------\n",obj->name);
    mm_log("gs : %08x reg : %08x\n",reg->gs,reg);
    mm_log("es : %08x esi : %08x\n",reg->es,reg->esi);
    mm_log("ds : %08x edi : %08x\n",reg->ds,reg->edi);
    mm_log("ss : %08x esp : %08x\n",reg->ss,reg->esp);
    mm_log("cs : %08x eip : %08x\n",reg->cs,reg->eip);
}

static void execvp(Object *thiz){
    Task * t = TASK(thiz->admit);
    Registers *reg = __va((void*)(t->core),t->registers);
    unused(__va);
    struct {
        char *argv[32];
        char env[0];
    } *buff = thiz->ptr;
    trace(thiz->admit);
    delvm(&(t->vm));
    mkvm(thiz,reg);
    strcpy(thiz->admit->name,buff->argv[0]);
    _delete((void*)t->core);
    ret(thiz->admit,OK);
}

static void _wait(Object *this){
    (void)this;
}

static void _mm_init(void){
    Task *task;
    hook(CLONE,clone);
    hook(CLOSE,delete);
    hook(NO_PAGE,np_page);
    hook(WP_PAGE,nw_page);
    hook(EXIT,free_child);
    hook(EXEC,execvp);
    hook(15,_wait);
    extern int system_main(void);
    task = make_task("System",system_main);
    OBJECT(task)->wait = self();
    ret(OBJECT(task),OK);
}

int mm_main(void){
    _mm_init();
    dorun();
    return 0;
}
