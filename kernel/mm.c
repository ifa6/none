#include    "kernel.h"
#include    <multiboot.h>
#include    "buffer.h"


#define clear_page(p)   \
    asm("rep stosl\n\t\t"::"a"(0),"c"(0x1000 >> 2),"D"(p));


Pointer MEMORY_END  =   0;
Pointer MEMORY_MAP_END  =   0;

unsigned char *mmap = (unsigned char *)MMAP_BASE;
/* get a free page in kernel space */
void *get_free_page(void){
    while(1){
        for(int i = CONST_MEM >> 12;i < KMEM >> 12;i++){
            if(mmap[i] == 0){
                mmap[i]++;
                /* clear the page */
                clear_page((i << 12));
                return (void*)(i << 12);
            }
        }
    }
    return NULL;
}

/* free a page in space */
void free_page(Pointer page){
    if(page < CONST_MEM) panic("Free Kernel Memory!");
    if(mmap[page >>12] == 0) panic("Free free Memory!");
    mmap[page >>12] --;
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




extern multiboot_info_t *envp;
void mm_init(void){

#define alow     map->base_addr_low
#define ahigh    map->base_addr_high
#define llow     map->length_low
#define lhigh    map->length_high
    memory_map_t *map = (memory_map_t *)envp->mmap_addr;
    memory_map_t *end = (memory_map_t *)(envp->mmap_addr + envp->mmap_length);

    unsigned char busy = 100;

    for(int i = 0;mmap + i < (unsigned char *)MMAP_END;i++) mmap[i] = 100;
    for(;map < end;map++){
        if(map->type == 1){
            busy = 0;
            MEMORY_END = alow + llow;
        } else busy = 100;
        for(Pointer i = alow >> 12;i < (alow + llow) >> 12;i++) mmap[i] = busy;
    }
    for(int i = 0;i < (CONST_MEM >> 12); i++) mmap[i] = 100;
    if(MEMORY_END > KMEM ) MEMORY_MAP_END = KMEM;
    else MEMORY_MAP_END = MEMORY_END;
    buffer_init();

    open_pagination();
#undef alow 
#undef ahigh
#undef llow
#undef lhigh
}
