#include "minix_fs.h"
#include <string.h>
#define inode_entry(i)  container_of(i,struct minix_inode_info,i_list)
static void minix_special_inode(struct minix_sb_info *sbi,
        struct minix_inode_info *ino,void *raw_inode,
        unsigned long inr) {

    if(!sbi || !raw_inode || !ino)
        return;

    ino->i_sb = sbi;
    ino->i_inr = inr;
    ino->i_object = sbi->s_dev;
    if(sbi->s_version == MINIX_V1) {
        struct minix_inode *v1 = raw_inode;
        ino->i_mode = v1->i_mode;
        ino->i_uid  = v1->i_uid;
        ino->i_gid  = v1->i_gid;
        ino->i_nlinks = v1->i_nlinks;
        ino->i_mtime = v1->i_time;
        ino->i_size  = v1->i_size;
        for(int i = 0;i < sbi->s_dzones;i++)
            ino->i_zone[i] = v1->i_zone[i];
        ino->indir_zone = v1->i_zone[sbi->s_dzones];
        ino->double_indir_zone = v1->i_zone[sbi->s_dzones + 1];
    } else if(sbi->s_version == MINIX_V2) {
        struct minix2_inode *v2 = raw_inode;
        ino->i_mode = v2->i_mode;
        ino->i_uid  = v2->i_uid;
        ino->i_gid  = v2->i_gid;
        ino->i_nlinks = v2->i_nlinks;
        ino->i_size = v2->i_size;
        ino->i_atime = v2->i_atime;
        ino->i_ctime = v2->i_ctime;
        ino->i_mtime = v2->i_mtime;
        for(int i = 0;i < sbi->s_dzones;i++)
            ino->i_zone[i] = v2->i_zone[i];
        ino->indir_zone = v2->indir_zone;
        ino->double_indir_zone = v2->double_indir_zone;
        ino->triple_indir_zone = v2->triple_indir_zone;
    } else {
        mfs_err("only suport minix fs V1 | V2\n.");
    }
}

static struct minix_inode_info *minix_iget(struct minix_sb_info *sbi,
        unsigned long inr) {

    int ret;
    int block,bn,in;
    int ino_per_block = sbi->s_blocksize / sbi->s_inosize;
    struct minix_inode_info *inode;
    static u8 ib[BLOCK_SIZE];

    if(!inr || inr > sbi->s_ninodes) {
        mfs_err("Bad inode number on ramdisk : %ld is out of range.",
                inr);
    }
    inr--;
    bn = inr / ino_per_block;
    in = inr % ino_per_block;

    block = 2 + sbi->s_imap_blocks + sbi->s_zmap_blocks + bn;
    ret = block_rw(sbi->s_dev,IF_READPAGE,ib,block,1);
    if(ret != OK) {
        mfs_err("unable to read inode block.\n");
        return NULL;
    }

    inode = kalloc(sizeof(*inode));
    if(NULL == inode) {
        mfs_err("memory out.\n");
        return NULL;
    }
    minix_special_inode(sbi,inode,ib + sbi->s_inosize * in,inr + 1);
    list_add(&(inode->i_list),&(sbi->s_inohead));

    inr -= in;
    for(int i = 0;i < ino_per_block;i++) {
        if(i == in)
            continue;
        struct minix_inode_info *ino = kalloc(sizeof(*inode));
        if(ino == NULL)
            break;
        minix_special_inode(sbi,ino,ib + sbi->s_inosize * i,inr + i + 1);
        list_add_tail(&(ino->i_list),&(sbi->s_inohead));
    }
    return inode;
}

struct minix_inode_info *minix_find_inode(struct minix_sb_info *sbi,
        unsigned long inr) {
    struct minix_inode_info *inode;
    list_for_each(pos,&(sbi->s_inohead)) {
        inode = inode_entry(pos);
        //fs_log("inode(%d,%d),req(%d).\n",inode->i_inr,inode->i_size,inr);
        if(inode->i_inr == inr)
            return inode;
    }
    return minix_iget(sbi,inr);
}


struct minix_sb_info *sb_bread(object_t dev) {
    static u8 ms[BLOCK_SIZE];
    struct minix_sb_info *sbi;
    struct minix_super_block *sb = (void*)ms;
    int ret;

    sbi = kalloc(sizeof(*sbi));
    if(NULL == sbi)
        goto out_sb_nomem;

    ret = block_rw(dev,IF_READPAGE,ms,MINIX_SUPER_BLOCK,1);
    if(ret != OK)
        goto out_bad_sb;

    sbi->s_dev = dev;
    sbi->s_nzones        = sb->s_nzones;
    sbi->s_ninodes       = sb->s_ninodes;
    sbi->s_max_size      = sb->s_max_size;
    sbi->s_blocksize     = BLOCK_SIZE;
    sbi->s_imap_blocks   = sb->s_imap_blocks;
    sbi->s_zmap_blocks   = sb->s_zmap_blocks;
    sbi->s_firstdatazone = sb->s_firstdatazone;
    sbi->s_log_zone_size = sb->s_log_zone_size;
    INIT_LIST_HEAD(&(sbi->s_inohead));

    if(sb->s_magic == MINIX_SUPER_MAGIC) {
        sbi->s_version = MINIX_V1;
        sbi->s_dirsize = 16;
        sbi->s_namelen = 14;
        sbi->s_inosize = sizeof(struct minix_inode);
        sbi->s_dzones  = V1_NR_DZONES;
    } else if(sb->s_magic == MINIX_SUPER_MAGIC1) {
        sbi->s_version = MINIX_V1;
        sbi->s_dirsize = 32;
        sbi->s_namelen = 30;
        sbi->s_inosize = sizeof(struct minix_inode);
        sbi->s_dzones  = V1_NR_DZONES;
    } else if(sb->s_magic == MINIX2_SUPER_MAGIC) {
        sbi->s_version = MINIX_V2;
        sbi->s_nzones  = sb->s_zones;
        sbi->s_dirsize = 16;
        sbi->s_namelen = 14;
        sbi->s_inosize = sizeof(struct minix2_inode);
        sbi->s_dzones  = V2_NR_DZONES;
    } else if(sb->s_magic == MINIX2_SUPER_MAGIC2) {
        sbi->s_version = MINIX_V2;
        sbi->s_nzones  = sb->s_zones;
        sbi->s_dirsize = 32;
        sbi->s_namelen = 30;
        sbi->s_inosize = sizeof(struct minix2_inode);
        sbi->s_dzones  = V2_NR_DZONES;
    } else  {
        mfs_err("super block magic %x\n",sb->s_magic);
        goto out_no_fs;
    }

    if(sbi->s_imap_blocks == 0 || sbi->s_zmap_blocks == 0)
        goto out_illegal_sb;

    sbi->s_rootino = minix_find_inode(sbi,MINIX_ROOT_INO);
    if(!sbi->s_rootino)
        goto out_bad_rootino;
    goto out;

out_bad_rootino :
    mfs_err("Can't find root inode.\n");
    goto out_sb_free;

out_no_fs:
    mfs_err("Can't find a Minix filesystem V1 | V2 "
            "on ramdisk.\n");
    goto out_sb_free;

out_illegal_sb:
    mfs_err("bad supperblock.\n");
    goto out_sb_free;

out_sb_nomem:
    mfs_err("memory out.\n");
    goto out;

out_bad_sb:
    mfs_err("unable to read superblock.\n");
out_sb_free:
    kfree(sbi);
    sbi = NULL;
out:
    return sbi;
}
