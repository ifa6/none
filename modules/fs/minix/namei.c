#include    "minix_fs.h"
#include    "../kernel.h"

static int add_nondir(struct minix_inode_info *inode) {
}

static int minix_mknod(struct minix_inode_info *dir,
        struct minix_inode_info *inode,umode_t mode,object_t rdev) {
    int error;
    struct minix_inode_info *inode;
    inode = minix_new_inode(dir,mode,&error);
    if(inode) {
        minix_set_inode(inode,rdev);
        error = add_nondir(inode,);
    }
    return error;
}

struct minix_inode_info *minix_lookup(struct minix_inode_info *dir,String name,size_t nlen){
    unsigned long inr;
    struct minix_inode_info *inode = NULL;
    if(nlen > dir->i_sb->s_namelen)
        return NULL;

    inr = minix_inode_by_name(dir,name,nlen);
    fs_log("inode(%d) by %s.\n",inr,name);
    if(inr)
        inode = minix_find_inode(dir->i_sb,inr);
    fs_log("inode(%p,%d,%d,%d) by %s.\n",inode,inr,inode->i_size,inode->i_zone[0],name);
    return inode;
}

object_t minix_path_walk(struct minix_inode_info *dir,String name,unsigned long mode) {
    struct minix_inode_info *inode = dir;
    while(*name && *name == '/') name++;
    for(;*name && inode;name++) {
        String p = name;
        while(*name && *name != '/') 
            name++;
        if(S_ISDIR(inode->i_mode)) {
            inode = minix_lookup(inode,p,name - p);
        } else if(S_ISMNT(inode->i_mode)) {
            return mount_open(inode,p,mode);
        } 
        if(*name != '/' && inode) {
            if(S_ISMNT(inode->i_mode))
                return mount_open(inode,p,mode);
            else
                return normal_open(inode,p,mode);
        }
    }
    return -ENOENT;
}
