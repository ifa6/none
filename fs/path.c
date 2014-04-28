#include    "fs.h"
#include    "../kernel/kernel.h"

#define DIR_IN_BLOCK    (BLOCK_SIZE / sizeof(MinixDirentry))

/*! exp : /usr/bin/hello !*/
static String _get_name(String path,char *name){
    if(isNullp(path)) return NULL;
    String ph;
    if(*path == '/')path++; /*! shift head / !*/
    ph = path;
    while(*ph && *ph != '/') ph++;
    memcpy(name,path,ph - path);
    return ph;
}

#define _isEqName(x,y) (0 == strncmp(x,y,MINIX_NAME_LEN))

static MinixInode *search_dir(MinixInode *di,String name){
    if(isNullp(di)) return NULL;
    static char block[BLOCK_SIZE];
    MinixDirentry *drp = (MinixDirentry *)block;
    MinixInode *inode = malloc(sizeof(MinixInode));
    if(inode == NULL) goto error_ret;

    zone_t dnoze = FULL_BLOCK(di->i_size);
    for(int i = 0;i < dnoze;i++){
        if(ERROR == zone_rw(di,READ,i,block)){
            zerror("search_dir : zone_rw fail\n");
            goto error_ret;
        }
        for(int j = 0;j < DIR_IN_BLOCK;j++){
            if(_isEqName(name,drp[j].name)){
                if(ERROR == get_inode(drp[j].inode,inode))
                    goto error_ret;
                return inode;
            }
        }
    }
error_ret:
    if(inode) free(inode);
    return NULL;
}

/*! 获取路径的INODE,成功返回true,当前仅仅支持绝对路径,先尝点甜头 !*/
MinixInode *eat_path(String path){
    if(isNullp(path) || !(*path)) return NULL;
    char name[MINIX_NAME_LEN]; 
    String pth = path;
    MinixInode *inode = &root_inode;
    while(*pth && inode){
        memset(name,0,MINIX_NAME_LEN);
        pth = _get_name(pth,name);
        inode = search_dir(inode,name);
    }
    return inode;
}
