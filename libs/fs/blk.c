#include <fs/fs.h>
#include <none/util.h>

int blk_rw(const object_t dev,const int cmd,
        void *buff,off_t offset,blkcnt_t count){
    return run(dev,cmd,buff,count,offset);
}

int sb_bread(struct super_block *sb,void *buff,off_t offset) {
    return blk_rw(sb->s_bdev,IF_READPAGE,buff,offset,DIV_ROUND_UP(sb->s_blocksize,BLOCK_SIZE));
}
