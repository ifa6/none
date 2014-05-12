#include <stdlib.h>
#include <sys/inter.h>
#include <object.h>
#include <z.h>

static void vfs_open(Object *thiz){
    unused(thiz);
}

static void vfs_close(Object *thiz){
    unused(thiz);
}

static void vfs_init(void){
    hook(OPEN,vfs_open);
    hook(CLOSE,vfs_close);
}

int vfs_main(int argc,char **argv){
    unused(argc,argv);
    vfs_init();
    dorun();
    return 0;
}
