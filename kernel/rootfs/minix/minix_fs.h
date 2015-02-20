#ifndef __MINIX_FS_H__
#define __MINIX_FS_H__
#include "../kernel.h" 
#include "file.h"
#include "minix.h"
#include <sys/inter.h>
#include <none/list.h>
#include <none/stat.h>
#include <none/fcntl.h>
#include <x86/bitops.h>


#ifdef FS_LOG
#define fs_log(fmt,...) dbg("ROOTFS",fmt,##__VA_ARGS__)
#else
#define fs_log(...)
#endif

#define mfs_err(fmt,...) printk("[ROOTFS] : "fmt,##__VA_ARGS__)
#define pname(name,nlen) ({\
        for(__auto_type i = 0;i < nlen && name[i];i ++)\
        printk("%c",name[i]);\
        })

#define INODE_VERSION(i)    (i)->i_sb->version

struct minix_sb_info;
struct minix_inode_info {
    struct list_head i_list;
    struct minix_sb_info *i_sb;
    object_t i_object;
    unsigned long i_mode;
    unsigned long i_uid;
    unsigned long i_gid;
    unsigned long i_atime;
    unsigned long i_mtime;
    unsigned long i_ctime;
    unsigned long i_inr;
    unsigned long i_nlinks;
    unsigned long i_size;
    unsigned long i_zone[V2_NR_DZONES];
    unsigned long indir_zone;
    unsigned long double_indir_zone;
    unsigned long triple_indir_zone;
};

struct minix_sb_info {
    object_t s_dev;
    unsigned long s_ninodes;
    unsigned long s_nzones;
    unsigned long s_imap_blocks;
    unsigned long s_zmap_blocks;
    unsigned long s_inosize;
    unsigned long s_dzones;
    unsigned long s_firstdatazone;
    unsigned long s_log_zone_size;
    unsigned long s_max_size;
    unsigned long s_blocksize;
    unsigned short s_dirsize;
    unsigned short s_namelen;
    unsigned short s_version;
    u8             **s_imap;
    u8             **s_zmap;
    struct list_head s_inohead;
    struct minix_inode_info *s_rootino;
};

unsigned long minix_inode_by_name(struct minix_inode_info *dir,String name,size_t namelen);
struct minix_inode_info *minix_lookup(struct minix_inode_info *dir,String name,size_t namelen);
struct minix_inode_info *minix_find_inode(struct minix_sb_info *sbi,unsigned long inr);
struct minix_sb_info *sb_bread(object_t dev);
object_t minix_path_walk(struct minix_inode_info *dir,String name,unsigned long mode);
object_t normal_open(struct minix_inode_info *inode,String name,unsigned long mode);
object_t mount_open(struct minix_inode_info *mnt,String name,unsigned long mode);
/*! 读写块,在dev设备,count块 !*/
int block_rw(const object_t dev,const int cmd,void *buf,size_t offset,size_t count);
int zone_rw(struct minix_inode_info *inode,int cmd,unsigned long zone,void *buff);
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

#endif
