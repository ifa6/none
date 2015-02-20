#ifndef __MINIX_FS_H__
#define __MINIX_FS_H__
#include <fs/fs.h>
#include "minix.h"
#include "../kernel.h"
#include <none/stat.h>
#include <stddef.h>
#include <x86/bitops.h>

#ifdef FS_LOG
#define fs_log(fmt,...) dbg("ROOTFS",fmt,##__VA_ARGS__)
#else
#define fs_log(...)
#endif

#define mfs_err(fmt,...) err("ROOTFS",fmt,##__VA_ARGS__)
#define pname(name,nlen) ({\
        for(int i = 0;i < nlen && name[i];i ++)\
        printk("%c",name[i]);\
        })

#define minix_set_bit(nr,addr) \
    __set_bit((nr),(unsigned long*)(addr))
#define minix_test_bit(nr,addr) \
    test_bit((nr),(unsigned long *)(addr))
#define minix_test_and_set_bit(nr,addr) \
    __test_and_set_bit((nr),(unsigned long *)(addr))
#define minix_test_and_clear_bit(nr,addr)   \
    __test_and_clear_bit((nr),(unsigned long *)(addr))
#define minix_find_first_zero_bit(addr,size) \
    find_first_zero_bit((unsigned long *)(addr),(size))

#define current_fsuid() 0
struct minix_inode_info {
    unsigned long i_nlinks;
    unsigned long i_zone[V2_NR_DZONES]; 
    unsigned long indir_zone;
    unsigned long double_indir_zone;
    unsigned long triple_indir_zone;
};

struct minix_sb_info {
    unsigned long s_ninodes;
    unsigned long s_nzones;
    unsigned long s_imap_blocks;
    unsigned long s_zmap_blocks;
    unsigned long s_inosize;
    unsigned long s_dzones;
    unsigned long s_firstdatazone;
    unsigned long s_log_zone_size;
    unsigned long s_max_size;
    unsigned short s_namelen;
    unsigned short s_dirsize;
    unsigned short s_version;
    u8              **s_imap;
    u8              **s_zmap;
};

static inline struct super_block *sbi_sb(struct minix_sb_info *sbi){
    return container_of(sbi,struct super_block,s_fs_info);
}

static inline struct inode *inode_iget(struct minix_inode_info *inode_info){
    return container_of(inode_info,struct inode,i_private);
}

int blk_rw(const object_t dev,const int cmd, void *buff,off_t offset,blkcnt_t count);
int zone_rw(struct inode *inode,int cmd,unsigned long zone,void *buff);

struct inode *minix_find_inode(struct super_block *sb,unsigned long ino);
struct super_block *minix_sget(object_t dev,int *error);
unsigned long minix_inode_by_name(struct inode *dir,String name,size_t nlen);
object_t minix_path_walk(struct inode *dir,String name,umode_t mode);
object_t normal_open(struct inode *inode,String name,umode_t mode);
object_t mount_open(struct inode *inode,String name,umode_t mode);
void minix_read(object_t o,void *buffer,cnt_t count);
void minix_write(object_t o,void *buffer,cnt_t count);

#endif
