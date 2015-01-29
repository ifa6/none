#include    "kernel.h"
#include    <boot/multiboot.h>
#include    "buffer.h"


#define clear_page(p)   \
    __asm__("rep stosl\n\t\t"::"a"(0),"c"(0x1000 >> 2),"D"(p));

#define mm_error(fmt,...)   printk("\er[KMEM ] : \ew"fmt"\n",##__VA_ARGS__)
#define mm_log(fmt,...)   printk("[KMEM ] : |LOG     | "fmt"\n",##__VA_ARGS__)

Pointer MEMORY_END  =   0;
Pointer MEMORY_MAP_END  =   0;

unsigned char *mmap = (unsigned char *)MMAP_BASE;
/* get a free page by physical address */
void *get_free_page(void){
    while(1){
        foreach(i,CONST_MEM >> 12,KMEM >> 12){
            if(mmap[i] == 0){
                mmap[i]++;
                /* clear the page */
                clear_page((i << 12));
                return (void*)(i << 12);
            }
        }
    }
    printk("mm out.\n");
    return NULL;
}

/*! get a free object page by kernel space !*/
void *get_kfree_page(void){
    foreach(i, OBJECT_START >> 12,CONST_MEM >> 12){
        if(mmap[i] == 0){
            mmap[i]++;
            clear_page(i << 12);
            return (void*)(i << 12);
        }
    }
    return NULL;
}

int share_page(Pointer page){
    if(page < OBJECT_START) {
        mm_error("Address %08x, does not require a shared kernel memory.",page);
        return ERROR;
    }
    mmap[page >> 12]++;
    return OK;
}

int page_share_nr(Pointer page){
    return mmap[page >> 12];
}

/* free a page in space */
int free_page(Pointer page){
    if(page < OBJECT_START) {
        mm_error("address %08x is kernel memory",page);
        return ERROR;
    }
    if(mmap[page >> 12] == 0){
        mm_error("address %08x is free memory",page);
        return ERROR;
    }
    mmap[page >> 12]--;
    return OK;
}


void open_pagination(void){
    Pointer *dir = (Pointer *)DIE_DIR;
    Pointer *table = (Pointer *)DIE_TABLE;
    Pointer page = 0;

    memset((void *)dir,0,0x1000);
    dir[0] = (Pointer)table | 7;
    for(int i = 0;i < 1024;i++) table[i] = (i << 12) | 7;
    for(int i = PAGE_START >> 22;i < (KMEM >> 22);i++){
        table = (Pointer *)((Pointer)table + 0x1000);
        dir[i] = (Pointer)table | 7;
        for(int i = 0;i < 1024;i++) table[i] = ((page++) << 12) | 7;
    }
    table = (Pointer *)(dir[1023] & (~0xcff));
    for(int i = 0;i < 1024;i++) table[i] = (1023 << 22) | (i << 12) | 7;

    /* bios */
    __asm__("mov    %0,%%cr3\n\t\t"
            "mov    %%cr0,%%eax\n\t\t"
            "or     $0x80010000,%%eax\n\t"
            "mov    %%eax,%%cr0\n\t\t"
            ::"a"(dir));

}

extern  multiboot_info_t *envp;
count_t ramdiskCount;
void mm_init(void){

#define alow     map->base_addr_low
#define ahigh    map->base_addr_high
#define llow     map->length_low
#define lhigh    map->length_high
    memory_map_t *map = (memory_map_t *)envp->mmap_addr;
    memory_map_t *end = (memory_map_t *)(envp->mmap_addr + envp->mmap_length);
    module_t     *module = (void*)(envp->mods_addr);
    void *  mod_start = (void*)module->mod_start;
    ramdiskCount = module->mod_end - module->mod_start;

#if 0
    printk("module : %08p\n",module);
    printk("start  : %08x\n",module->mod_start);
    printk("end    : %08x\n",module->mod_end);
    printk("count  : %08x\n",ramdiskCount);
#endif
    /*! 将让ramdisk 拷贝到合适的位置 !*/
    memcpy((void*)RAMDISK_ADDR,mod_start,ramdiskCount);

    unsigned char busy = 100;

    for(int i = 0;mmap + i < (unsigned char *)MMAP_END;i++) mmap[i] = 100;
    for(;map < end;map++){
        if(map->type == 1){
            busy = 0;
            MEMORY_END = alow + llow;
        } else busy = 100;
        for(Pointer i = alow >> 12;i < (alow + llow) >> 12;i++) mmap[i] = busy;
    }
    for(int i = 0;i < (OBJECT_START >> 12); i++) mmap[i] = 100;
    if(MEMORY_END > KMEM ) MEMORY_MAP_END = KMEM;
    else MEMORY_MAP_END = MEMORY_END;
    buffer_init();

    open_pagination();
#undef alow 
#undef ahigh
#undef llow
#undef lhigh
}
