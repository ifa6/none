#include "minix_fs.h"

#define BLOCK(x)        x
#define ZONE_PER_BLOCK   (BLOCK_SIZE / sizeof(unsigned long))

static unsigned long get_indir(struct inode *inode,
        unsigned long offset,int num) {
    struct super_block *sb = inode_sb(inode);
    struct minix_sb_info *sbi = sb_info(sb);
    char *blk = kalloc(BLOCK_SIZE);
    unsigned long indir = 0;
    int ret;
    ret = sb_bread(sb,blk,offset);
    if(ret)
        return 0;
    if(sbi->s_version == MINIX_V1)
        indir =  ((unsigned short *)blk)[num];
    else if(sbi->s_version == MINIX_V2)
        indir = ((unsigned long*)blk)[num];
    kfree(blk);
    return indir;
}

/*! 之前对minix 2文件系统了解不多,没有二次,三次间接块,这次参考grub2写这个函数 !*/
#define _MAX_ZONE(s)   FULL_BLOCK(s)
static unsigned long  get_blk(struct inode *inode,unsigned long zone){
    struct super_block *sb = inode_sb(inode);
    struct minix_sb_info *sbi = sb_info(sb);
    struct minix_inode_info *minix_inode = inode_info(inode);
    unsigned long indir;
    if(zone > _MAX_ZONE(inode->i_size))
        return 0;

    /*! 直接块 !*/
    if(zone < sbi->s_dzones)
        return minix_inode->i_zone[zone];

    zone -= sbi->s_dzones;
    /* Indirect block */
    if(zone < ZONE_PER_BLOCK){
        return get_indir(inode,minix_inode->indir_zone,zone);
    }

    zone -= ZONE_PER_BLOCK;
    if(zone < ZONE_PER_BLOCK * ZONE_PER_BLOCK){
        indir = get_indir(inode,minix_inode->double_indir_zone,zone / ZONE_PER_BLOCK);
        indir = get_indir(inode,indir,zone % ZONE_PER_BLOCK);
        return indir;
    }

    zone -= ZONE_PER_BLOCK * ZONE_PER_BLOCK;
    if(sbi->s_version == MINIX_V2 && zone < ZONE_PER_BLOCK * ZONE_PER_BLOCK * ZONE_PER_BLOCK) {
        indir = get_indir(inode,minix_inode->triple_indir_zone,(zone / ZONE_PER_BLOCK ) / ZONE_PER_BLOCK);
        indir = get_indir(inode,zone,(zone / ZONE_PER_BLOCK) % ZONE_PER_BLOCK);
        indir = get_indir(inode,zone,zone % ZONE_PER_BLOCK);
        return indir;
    }
    mfs_err("can't find zone(%d).\n",zone);
    return 0;
}

static unsigned long test_and_alloc_indir(struct inode *inode,
        unsigned long offset,int num) {
    unsigned long indir = 0;
    struct super_block *sb = inode_sb(inode);
    struct minix_sb_info *sbi = sb_info(sb);
    u8 *blk;
    int ret;
    blk = kalloc(BLOCK_SIZE);
    if(!blk)
        return 0;

    ret = sb_bread(sb,blk,offset);
    if(ret)
        return 0;

    if(sbi->s_version == MINIX_V1)
        indir = ((unsigned short *)blk)[num];
    else if(sbi->s_version == MINIX_V2) 
        indir = ((unsigned long*)blk)[num];
    else {
        mfs_err("only suport minix v1|v2 filesystem.\n");
        kfree(blk);
        return 0;
    }

    if(!indir)
        indir = minix_new_block(inode);
    if(sbi->s_version == MINIX_V1)
        ((unsigned short *)blk)[num] = indir;
    else if(sbi->s_version == MINIX_V2)
        ((unsigned long *)blk)[num] = indir;
    kfree(blk);

    return indir;
}

static unsigned long blk_alloc(struct inode *inode,unsigned long zone) {
    struct super_block *sb = inode_sb(inode);
    struct minix_sb_info *sbi = sb_info(sb);
    struct minix_inode_info *minix_inode = inode_info(inode);
    unsigned long indir = 0;
    if(zone < sbi->s_dzones) {
        indir = minix_inode->i_zone[zone] = minix_new_block(inode);
        goto out_sync;
    }
    zone -= sbi->s_dzones;
    if(zone < ZONE_PER_BLOCK) {
        if(!minix_inode->indir_zone)
            minix_inode->indir_zone = minix_new_block(inode);
        indir = test_and_alloc_indir(inode,minix_inode->indir_zone,zone);
        goto out_sync;
    }

    zone -= ZONE_PER_BLOCK;
    if(zone < ZONE_PER_BLOCK * ZONE_PER_BLOCK) {
        if(!minix_inode->double_indir_zone)
            minix_inode->double_indir_zone = minix_new_block(inode);
        indir = test_and_alloc_indir(inode,minix_inode->double_indir_zone,zone / ZONE_PER_BLOCK);
        indir = test_and_alloc_indir(inode,indir,zone % ZONE_PER_BLOCK);
        goto out_sync;
    }

    zone -= ZONE_PER_BLOCK * ZONE_PER_BLOCK;
    if(sbi->s_version == MINIX_V2 && zone < ZONE_PER_BLOCK * ZONE_PER_BLOCK * ZONE_PER_BLOCK) {
        if(!minix_inode->triple_indir_zone)
            minix_inode->triple_indir_zone = minix_new_block(inode);
        indir = test_and_alloc_indir(inode,minix_inode->triple_indir_zone,(zone / ZONE_PER_BLOCK) / ZONE_PER_BLOCK);
        indir = test_and_alloc_indir(inode,indir,(zone / ZONE_PER_BLOCK) % ZONE_PER_BLOCK);
        indir = test_and_alloc_indir(inode,indir,zone % ZONE_PER_BLOCK);
        goto out_sync;
    }

    return 0;
out_sync:
    minix_sync_inode(inode);
    return indir;
}

int inode_bread(struct inode *inode,unsigned long zone,void *buff) {
    off_t offset;
    object_t rdev = inode->i_rdev;
    offset = get_blk(inode,zone);
    if(offset == 0)
        return -EINVAL;
    return blk_readpage(rdev,buff,offset);
}

int inode_bwrite(struct inode *inode,unsigned long zone,void *buff) {
    off_t offset;
    object_t rdev = inode->i_rdev;
    offset = get_blk(inode,zone);
    if(offset == 0) {
        offset = blk_alloc(inode,zone);
        if(offset == 0)
            return -ENOSPC;
    }
    return blk_writepage(rdev,buff,offset);
}
