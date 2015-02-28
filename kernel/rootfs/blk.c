#include "minix_fs.h"

int inode_bread(struct inode *inode,void *buff,unsigned long zone) {
    off_t offset;
    object_t rdev = inode->i_rdev;
    offset = bmap(inode,zone,false);
    if(offset == 0)
        return -EINVAL;
    return blk_readpage(rdev,buff,offset);
}

int inode_bwrite(struct inode *inode,void *buff,unsigned long zone) {
    off_t offset;
    object_t rdev = inode->i_rdev;
    offset = bmap(inode,zone,true);
    if(offset == 0)
        return -ENOSPC;
    return blk_writepage(rdev,buff,offset);
}
