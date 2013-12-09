#ifndef __FS_H__
#define __FS_H__

#include    <sys/inter.h>
#include    <types.h>
#include    <stdio.h>
#include    <object.h>
#include    "minix.h"
#include    "file.h"



extern MinixSuperBlock *super;
extern MinixInode root_inode;

/*! 读写块,在dev设备,count块 !*/
int block_rw(const dev_t dev,const int cmd,void *buf,size_t offset,size_t count);
/*! 不解释 !*/
MinixSuperBlock *read_super(const dev_t dev);
int get_inode(int nr,MinixInode *inode);
/*! 对inode节点的逻辑区号进行读写操作,逻辑区号的计算公式是 文件大小 / 块大小 !*/
int zone_rw(MinixInode *inode,int cmd,zone_t zone,void *buff);

/*! 吃掉路径字符串,吐出inode,或在NULL !*/
MinixInode *eat_path(String path);

#endif
