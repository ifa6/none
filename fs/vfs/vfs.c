#include <stdlib.h>
#include <sys/inter.h>
#include <z.h>

#define VFS_LOG

#ifdef VFS_LOG
#define vfs_log(fmt,...)    printk("[VFS ] : "fmt,##__VA_ARGS__)
#else
#define vfs_log(...)
#endif

static struct { object_t dev; }root_inode;

static void vfs_open(object_t o,String path) {
    vfs_log("vfs_open %s.",path);
    eat_path(path);
}

static void vfs_close(object_t o) {
    vfs_log("vfs_close.");
}

static void vfs_init(void){
    hook(OPEN,vfs_open);
    hook(CLOSE,vfs_close);
}

int vfs_main(int argc,char **argv){
    unused(argc,argv);
    vfs_init();
    workloop();
    return 0;
}
