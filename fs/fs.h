#ifndef __FS_H__
#define __FS_H__

#include    <sys/inter.h>
#include    <types.h>
#include    <stdio.h>
#include    "minix.h"

extern Proc *act_proc;
int block_rw(int cmd,int dev,void *buf,size_t offset,size_t count);
MinixSuperBlock *read_super(int dev);
MinixInode *get_inode(int dev,int nr,MinixSuperBlock *super);

#endif
