#ifndef __FS_H__
#define __FS_H__
#include <none/types.h>
#include <none/time.h>
#include <none/stat.h>
#include <none/list.h>

struct inode {
    umode_t             i_mode;
    uid_t               i_uid;
    gid_t               i_gid;
    unsigned int        i_flags;
    unsigned long       i_ino;
    object_t            i_rdev;
    loff_t              i_size;

    struct super_block  *i_sb;
    struct list_head    i_list;

    struct timespec     i_atime;
    struct timespec     i_mtime;
    struct timespec     i_ctime;

    unsigned short      i_bytes;
    unsigned int        i_blkbits;
    blkcnt_t            i_blocks;

    u64                 i_version;
    atomic_u64          i_count;
    u8                  i_private[0];
};

struct super_block {
    object_t                s_dev;
    object_t                s_bdev;
    umode_t                 s_mode;
    atomic_u32              s_count;
    loff_t                  s_maxbytes;
    unsigned char           s_blocksize_bits;
    unsigned long           s_blocksize;
    unsigned long           s_flags;
    unsigned long           s_magic;

    struct list_head        s_list;
    struct list_head        s_inodes;
    struct inode            *s_root;

    char                    s_id[32];
    u8                      s_uuid[16];

    unsigned int            s_max_links;

    u8                      s_fs_info[0];
};

struct file{
    struct inode *inode;
    off_t   offset;
    cnt_t   cnt;
};

struct dentry {
    struct inode *d_inode;
    size_t d_inamelen;
    char d_iname[0];
};

static inline void *sb_info(struct super_block *sb){
    return sb->s_fs_info;
}

static inline void *inode_info(struct inode *inode){
    return inode->i_private;
}

static inline struct super_block *inode_sb(struct inode *inode) {
    return inode->i_sb;
}

int blk_rw(const object_t dev,const int cmd,
        void *buff,off_t offset,blkcnt_t count);
static inline int blk_readpage(const object_t dev,void *buff,off_t offset) {
    return blk_rw(dev,IF_READPAGE,buff,offset,1);
}

static inline int blk_writepage(const object_t dev,void *buff,off_t offset) {
    return blk_rw(dev,IF_WRITEPAGE,buff,offset,1);
}
int sb_bread(struct super_block *sb,void *buff,off_t offset);
int sb_bwrite(struct super_block *sb,void *buff,off_t offset);

void generic_seek(object_t caller,int whence,off_t offset);
void generic_mount(object_t caller,object_t mnt,umode_t mode);
void generic_umount(object_t caler);

#endif
