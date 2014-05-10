#include    "fs.h"
#include    <string.h>

/*! 测试一个INODE 快的硬盘,先做点有趣的事情才有兴趣继续搞下去 !*/

int get_inode(int nr,MinixInode *inode){
    if(inode == NULL) return ERROR;
    static char buf[BLOCK_SIZE];
    int bn = (nr - 1) / (BLOCK_SIZE / sizeof(d2_inode));
    int in = (nr - 1) % (BLOCK_SIZE / sizeof(d2_inode));
    off_t offset = 1 + 1 + super->s_imap_blocks + super->s_zmap_blocks + bn;
    /*! -1一个inode是因为inode节点是从1开始,而不是0.但是,不应该是把第0个空闲吗? !*/
    if(OK != block_rw(super->s_dev,READ,buf,offset,1))panic("Read inode Error!");
    memcpy(inode,&(D2_INODE(buf)[in]),sizeof(d2_inode));
    inode->i_sp = super;
    inode->i_dev = super->s_dev;
    return OK;
}
