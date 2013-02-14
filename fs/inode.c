#include    "fs.h"

/* 当前缓存区里面存放的I结点范围 0结点未使用,所以第一次调用get_inode不会返回错误的I结点 */
static int  ins = 0;
static int  ine = 0;
static char buf[BLOCK_SIZE];

MinixInode *get_inode(int dev,int nr,MinixSuperBlock *super){
    int offset,nb,in;
    nb = (nr - 1) / V2_INODES_PER_BLOCK;
    in = (nr -1 ) % V2_INODES_PER_BLOCK;
    if((nr >= ine) || (nr < ins)){ 
        offset = nb + 1 + 1 + super->s_imap_blocks + super->s_zmap_blocks;
        if(OK != block_rw(READ,dev,buf,offset,1))panic("Read inode Error!");
        ins = nb * V2_INODES_PER_BLOCK;
        ine = ins + V2_INODES_PER_BLOCK;
    }
    return (MinixInode *)(buf + in * V2_INODES_PER_BLOCK);
}
