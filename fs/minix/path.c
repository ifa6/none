#include    "fs.h"
#include    "../kernel/kernel.h"

#define DIR_IN_BLOCK    (BLOCK_SIZE / sizeof(MinixDirentry))

/*! exp : /usr/bin/hello !*/
static String _get_name(String path,char *name){
    String ph;
    if(!path) return NULL;
    if(*path == '/')path++; /*! shift head / !*/
    ph = path;
    while(*ph && *ph != '/') ph++;
    memcpy(name,path,ph - path);
    return ph;
}

#define _isEqName(x,y) (0 == strncmp(x,y,MINIX_NAME_LEN))

static MinixInode *search_dir(MinixInode *di,String name){
    if(!di) return NULL;
    static char block[BLOCK_SIZE];
    MinixDirentry *drp = (MinixDirentry *)block;
    MinixInode *inode = kalloc(sizeof(MinixInode));
    if(inode == NULL) goto error_ret;

    zone_t dnoze = FULL_BLOCK(di->i_size);
    foreach(i,0,dnoze){
        if(ERROR == zone_rw(di,READ,i,block)){
            zerror("search_dir : zone_rw fail\n");
            goto error_ret;
        }
        foreach(j,0,DIR_IN_BLOCK){
            if(_isEqName(name,drp[j].name)){
                if(ERROR == get_inode(drp[j].inode,inode))
                    goto error_ret;
                return inode;
            }
        }
    }
error_ret:
    if(inode) kfree(inode);
    return NULL;
}

/*! 获取路径的INODE,成功返回inode,当前仅仅支持绝对路径,先尝点甜头 !*/
MinixInode *eat_path(String path){
    if(!path || !(*path)) return NULL;
    char name[MINIX_NAME_LEN]; 
    String pth = path;
    MinixInode *inode = &root_inode;
    while(*pth && inode && !(pth[0] == '/' && !pth[1])){
        memset(name,0,MINIX_NAME_LEN);
        pth = _get_name(pth,name);
        inode = search_dir(inode,name);
    }
    return inode;
}
