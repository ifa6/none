#include "minix_fs.h"
static struct inode *minix_lookup(struct inode *dir, String name,size_t nlen) {
    struct inode *inode = NULL;
    struct super_block *sb = inode_sb(dir);
    struct minix_sb_info *sbi = sb_info(sb);
    unsigned long ino;
    if(nlen > sbi->s_namelen)
        return NULL;

    ino = minix_inode_by_name(dir,name,nlen);
    fs_log("inode(%s,%d).\n",name,ino);
    if(ino)
        inode = minix_find_inode(sb,ino);
    fs_log("inode(%s,&%p,[%d],%d).\n",name,inode,ino,inode->i_size);
    return inode;
}

object_t minix_path_walk(struct inode *dir,String name,unsigned long mode) {
    struct inode *inode = dir;
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
