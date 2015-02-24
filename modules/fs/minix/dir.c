#include "minix_fs.h"
#define DIR_IN_BLOCK    (BLOCK_SIZE / sizeof(struct minix_dir_entry))
static inline int namecompare(int len,int maxlen,String name,String buffer) {
    if(len < maxlen && buffer[len])
        return 0;
    return !memcmp(name,buffer,len);
}

static inline void *minix_next_entry(void *de,struct minix_sb_info *sbi) {
    return (void*)((char *)de + sbi->s_dirsize);
}

unsigned long minix_inode_by_name(struct minix_inode_info *di,String name,size_t nlen) {

    if(!di || !S_ISDIR(di->i_mode)) {
        mfs_err("Not a directory.\n");
        SET_ERR(-ENOTDIR);
        return 0;
    }

    static char block[BLOCK_SIZE];
    struct minix_sb_info *sbi = di->i_sb;
    struct minix_dir_entry *drp = (struct minix_dir_entry *)block;
    size_t dir_per_block = sbi->s_blocksize / sbi->s_dirsize;
    size_t dnoze = FULL_BLOCK(di->i_size);
    //fs_log("dir block count(%d),i_size(%d)\n",dnoze,di->i_size);
    foreach(i,0,dnoze){
        if(ERROR == zone_rw(di,IF_READPAGE,i,block)){
            zerror("search_dir : zone_rw fail\n");
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
    return 0;
}
