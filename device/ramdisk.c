#include <multiboot.h>
#include "../kernel/kernel.h"
#define min(a,b)    (((a) > (b)) ? (b) : (a))

extern multiboot_info_t *envp;
static void *ramdisk;
static count_t ramdiskCount;

static void ramdisk_read(Object *thiz){
    off_t offset = ((thiz->offset)* 512);
    count_t count = min(thiz->count * 512,ramdiskCount - offset);
    memcpy(thiz->buffer,ramdisk + offset,count);
    ret(thiz->admit,OK);
}

static void ramdisk_write(Object *thiz){
    off_t offset = ((thiz->offset)* 512);
    count_t count = min(thiz->count * 512,ramdiskCount - offset);
    memcpy(ramdisk + offset,thiz->buffer,count);
    ret(thiz->admit,OK);
}

static void ramdisk_init(void){
#if 0
    module_t    *module = (void*)(envp->mods_addr);
    ramdisk = ((void*)module->mod_start);
    ramdiskCount = module->mod_end - module->mod_start;
    printk("module : %p\n",module);
    printk("start  : %08x\n",module->mod_start);
    printk("end    : %08x\n",module->mod_end);
    printx(ramdisk,0x100);
#else
    ramdisk = (void*)RAMDISK_ADDR;
    ramdiskCount = 0x28000;
#endif
    hook(WRITE,ramdisk_write);
    hook(READ,ramdisk_read);

}

int ramdisk_main(void){
    ramdisk_init();
    dorun();
    return 0;
}
