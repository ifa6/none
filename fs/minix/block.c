#include    "fs.h"

#define BLOCK(x)  ((x) * (BLOCK_SIZE / 512))
#define ZONE_IN_BLOCK   (BLOCK_SIZE / sizeof(zone_t))

/*! 读取在dev设备的offset逻辑扇区读写count块数据到buffer !*/
int block_rw(const dev_t dev,const int cmd,void *buff,off_t offset,size_t count){
    return run(dev,cmd, buff,BLOCK(offset),BLOCK(count));
}

static zone_t get_indir(MinixInode *inode,zone_t zone,int num) {
    static char blk[BLOCK_SIZE];
    if(OK != block_rw(inode->i_dev,READ,blk,zone,1)){
        return 0;
    }
    return ((zone_t*)blk)[num];
}

/*! 之前对minix 2文件系统了解不多,没有二次,三次间接块,这次参考grub2写这个函数 !*/
#define _MAX_ZONE(inode)   FULL_BLOCK((inode)->i_size)
static zone_t  _get_zone(MinixInode *inode,zone_t zone){
    zone_t indir;
    if(zone > _MAX_ZONE(inode))
        return 0;
    /*! 直接块 !*/
    if(zone < V2_NR_DZONES){
        return inode->i_zone[zone];
    }

    zone -= V2_NR_DZONES;
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
    if(zone < ZONE_IN_BLOCK * ZONE_IN_BLOCK * ZONE_IN_BLOCK) {
        indir = get_indir(inode,inode->triple_indir_zone,(zone / ZONE_IN_BLOCK ) / ZONE_IN_BLOCK);
        indir = get_indir(inode,zone,(zone / ZONE_IN_BLOCK) % ZONE_IN_BLOCK);
        indir = get_indir(inode,zone,zone % ZONE_IN_BLOCK);
        return indir;
    }
    zerror("get_zone failure,%d",__LINE__);
    return 0;
}
/*! 读写inode节点的zone区块 !*/
int zone_rw(MinixInode *inode,int cmd,zone_t zone,void *buff){
    off_t   offset;
    dev_t   dev = inode->i_dev; 

    offset = _get_zone(inode,zone);
    if(offset == 0){
        zerror("zone_rw : offset is bad,at zone %x",zone);
        return ERROR;
    }
    return block_rw(dev,cmd,buff,offset,1);
}
