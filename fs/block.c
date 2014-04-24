#include    "fs.h"

#define BLOCK(x)  ((x) * (BLOCK_SIZE / 512))
#define ZONE_IN_BLOCK   (BLOCK_SIZE / sizeof(zone_t))

/*! 读取在dev设备的offset逻辑扇区读写count块数据到buffer !*/
int block_rw(const dev_t dev,const int cmd,void *buff,off_t offset,size_t count){
    return run(dev,cmd,.offset = BLOCK(offset),.count =  BLOCK(count),.buffer = buff);
}

/*!
 *  参数里面的zone是inode内部逻辑区号,从0到 (i_size + (BLOCK_SIZE - 1)) / (BLOCK_SIZE) 
 *  返回的是实际的物理区号
 */
#define _MAX_ZONE(inode)   FULL_BLOCK((inode)->i_size)
static zone_t  _get_zone(MinixInode *inode,zone_t zone){
    if(zone > _MAX_ZONE(inode)) return 0;
    dev_t     dev = inode->i_dev; 
    if((0 <= zone) && (zone < V2_NR_DZONES)){ /*! 直接块 !*/
        return inode->i_zone[zone];
    }else{
        int n;
        static char block[BLOCK_SIZE];
        zone_t  *nz = inode->i_zone + V2_NR_DZONES;
        zone -= V2_NR_DZONES;
        n = nz[zone / ZONE_IN_BLOCK];
        if(ERROR == block_rw(dev,READ,block,n,1)){
            zerror("get_zone: read %b block fail for device %d",n,inode->i_dev);
            return 0;
        }
        nz = (zone_t *)block;
        return nz[zone % ZONE_IN_BLOCK];
    }
    return 0;
}
/*! 读写inode节点的zone区块 !*/
int zone_rw(MinixInode *inode,int cmd,zone_t zone,void *buff){
    off_t   offset;
    dev_t   dev = inode->i_dev; 
    /*! 这不知道是怎么回事 !*/
    offset = _get_zone(inode,zone);
    /*! 计算zone所在的块 !*/
    if(offset == 0){
        zerror("zone_rw : offset is bad");
        return ERROR;
    }
    return block_rw(dev,cmd,buff,offset,1);
}
