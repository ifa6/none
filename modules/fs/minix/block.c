#include    "minix_fs.h"

#define BLOCK(x)        x
#define ZONE_IN_BLOCK   (BLOCK_SIZE / sizeof(unsigned long))

/*! 读取在dev设备的offset逻辑扇区读写count块数据到buffer !*/
int block_rw(const object_t dev,const int cmd,
        void *buff,off_t offset,size_t count){
    return run(dev,cmd, buff,BLOCK(count),BLOCK(offset));
}

static unsigned long get_indir(struct minix_inode_info *inode,
        unsigned long zone,int num) {
    static char blk[BLOCK_SIZE];
    if(OK != block_rw(inode->i_object,IF_READPAGE,blk,zone,1)){
        return 0;
    }
    if(inode->i_sb->s_version == MINIX_V1)
        return ((unsigned short *)blk)[num];
    else if(inode->i_sb->s_version == MINIX_V2)
        return ((unsigned long*)blk)[num];
    return 0;
}

/*! 之前对minix 2文件系统了解不多,没有二次,三次间接块,这次参考grub2写这个函数 !*/
#define _MAX_ZONE(s)   FULL_BLOCK(s)
static unsigned long  v2_zone(struct minix_inode_info *inode,unsigned long zone){
    struct minix_sb_info *sbi = inode->i_sb;
    unsigned long indir;
    if(zone > _MAX_ZONE(inode->i_size))
        return 0;

    /*! 直接块 !*/
    if(zone < sbi->s_dzones)
        return inode->i_zone[zone];

    zone -= sbi->s_dzones;
    /* Indirect block */
    if(zone < ZONE_IN_BLOCK){
        return get_indir(inode,inode->indir_zone,zone);
    }

    zone -= ZONE_IN_BLOCK;
    if(zone < ZONE_IN_BLOCK * ZONE_IN_BLOCK){
        indir = get_indir(inode,inode->double_indir_zone,zone / ZONE_IN_BLOCK);
        indir = get_indir(inode,indir,zone % ZONE_IN_BLOCK);
        return indir;
    }

    zone -= ZONE_IN_BLOCK * ZONE_IN_BLOCK;
    if(sbi->s_version == MINIX_V2 && zone < ZONE_IN_BLOCK * ZONE_IN_BLOCK * ZONE_IN_BLOCK) {
        indir = get_indir(inode,inode->triple_indir_zone,(zone / ZONE_IN_BLOCK ) / ZONE_IN_BLOCK);
        indir = get_indir(inode,zone,(zone / ZONE_IN_BLOCK) % ZONE_IN_BLOCK);
        indir = get_indir(inode,zone,zone % ZONE_IN_BLOCK);
        return indir;
    }
    zerror("get_zone failure,%d",__LINE__);
    return 0;
}
/*! 读写inode节点的zone区块 !*/
int zone_rw(struct minix_inode_info *inode,int cmd,unsigned long zone,void *buff){
    off_t   offset;
    object_t   dev = inode->i_object;

    offset = v2_zone(inode,zone);
    if(offset == 0){
        zerror("zone_rw : offset is bad,at zone %x",zone);
        return ERROR;
    }
    //fs_log("block(%d).\n",dev);
    return block_rw(dev,cmd,buff,offset,1);
}
