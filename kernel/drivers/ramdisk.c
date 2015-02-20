#include "../kernel.h"
#include <none/if.h>
#define min(a,b)    (((a) > (b)) ? (b) : (a))

static void *ramdisk;
static off_t offset;
extern cnt_t ramdiskCount;

static void ramdisk_readpage(object_t caller,void *ptr,cnt_t count,off_t offset){
    off_t off = offset * BLOCK_SIZE;
    cnt_t cnt = min(count * BLOCK_SIZE,ramdiskCount - off);
    memcpy(ptr,ramdisk + off,cnt);
    ret(caller,OK);
}

static void ramdisk_writepage(object_t caller,void *ptr,cnt_t count,off_t offset){
    off_t off = offset * BLOCK_SIZE;
    cnt_t cnt = min(count * BLOCK_SIZE,ramdiskCount - off);
    memcpy(ramdisk + off,ptr,cnt);
    ret(caller,OK);
}

static void ramdisk_read(object_t caller,void *ptr,cnt_t count) {
    cnt_t cnt = min(count,ramdiskCount - offset);
    memcpy(ptr,ramdisk + offset,cnt);
    offset += cnt;
    ret(caller,cnt);
}

static void ramdisk_write(object_t caller,void *ptr,cnt_t count) {
    cnt_t cnt = min(count,ramdiskCount - offset);
    memcpy(ramdisk + offset,ptr,cnt);
    offset += cnt;
    ret(caller,cnt);
}

static void ramdisk_open(object_t caller) {
    ret(caller,RAMDISK_PID);
}

static void ramdisk_init(void){
    ramdisk = (void*)RAMDISK_ADDR;
    hook(IF_OPEN,ramdisk_open);
    hook(IF_READ,ramdisk_read);
    hook(IF_WRITE,ramdisk_write);
    hook(IF_READPAGE,ramdisk_readpage);
    hook(IF_WRITEPAGE,ramdisk_writepage);
}

int ramdisk_main(void){
    ramdisk_init();
    workloop();
    return 0;
}
