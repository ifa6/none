#include "minix_fs.h"
static inline int namecompare(int len,int maxlen,
        String name,String buffer) {
    if(len < maxlen && buffer[len])
        return 0;
    return !memcmp(name,buffer,len);
}

static inline void *minix_next_entry(void *de,struct minix_sb_info *sbi) {
    return (void*)((char *)de + sbi->s_dirsize);
}

unsigned long minix_inode_by_name(struct inode *di,String name,size_t nlen) {

    if(!di || !S_ISDIR(di->i_mode)) {
        mfs_err("Not a directory.\n");
        SET_ERR(-ENOTDIR);
        return 0;
    }

    void *blk;
    struct super_block *sb = inode_sb(di);
    struct minix_sb_info *sbi = sb_info(sb);
    struct minix_dir_entry *drp;
    size_t dir_per_block = sb->s_blocksize / sbi->s_dirsize;
    size_t dnoze = FULL_BLOCK(di->i_size);
    blk = kalloc(sb->s_blocksize);
    if(!blk) {
        mfs_err("memory out.\n");
        return 0;
    }
    drp = blk;
    fs_log("dir_per_block(%d),dir block count(%d),i_size(%d).\n"
            ,dir_per_block,dnoze,di->i_size);
    foreach(i,0,dnoze){
        if(0 > blk_read(di,i,blk)){
            mfs_err("I/O error.\n");
            SET_ERR(-EIO);
            goto error_ret;
        }
        foreach(j,0,dir_per_block){
#if 0
            printk(">req ");
            pname(name,nlen);
            printk(">dir ");
            pname(drp->name,sbi->s_dirsize);
            printk("\n");
#endif
            if(namecompare(nlen,sbi->s_dirsize,name,drp->name))
                return drp->inode;
            drp = minix_next_entry(drp,sbi);
        }
    }
    SET_ERR(-ENOENT);
    mfs_err("No such file or directory.\n");
error_ret:
    kfree(blk);
    return 0;
}
