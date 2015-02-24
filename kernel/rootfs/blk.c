#include    "minix_fs.h"

#define BLOCK(x)        x
#define ZONE_PER_BLOCK   (BLOCK_SIZE / sizeof(unsigned long))

static unsigned long get_indir(struct inode *inode,
        unsigned long zone,int num) {
    struct super_block *sb = inode_sb(inode);
    struct minix_sb_info *sbi = sb_info(sb);
    char *blk = kalloc(BLOCK_SIZE);
    unsigned long indir = 0;
    int ret;
    ret = sb_bread(sb,blk,zone);
    if(ret){
        return 0;
    }
    if(sbi->s_version == MINIX_V1)
        indir =  ((unsigned short *)blk)[num];
    else if(sbi->s_version == MINIX_V2)
        indir = ((unsigned long*)blk)[num];
    return indir;
}

/*! 之前对minix 2文件系统了解不多,没有二次,三次间接块,这次参考grub2写这个函数 !*/
#define _MAX_ZONE(s)   FULL_BLOCK(s)
static unsigned long  get_zone(struct inode *inode,unsigned long zone){
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

int blk_read(struct inode *inode,unsigned long zone,void *buff) {
    off_t offset;
    object_t rdev = inode->i_rdev;
    offset = get_zone(inode,zone);
    if(offset == 0)
        return -EINVAL;
    return blk_rw(rdev,IF_READPAGE,buff,offset,1);
}

int blk_write(struct inode *inode,unsigned long zone,void *buff) {
    off_t offset;
    object_t rdev = inode->i_rdev;
    offset = get_zone(inode,zone);
    if(offset == 0)
        return -EINVAL;
    return blk_rw(rdev,IF_WRITEPAGE,buff,offset,1);
}
