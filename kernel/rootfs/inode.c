#include "minix_fs.h"
#include <none/time.h>
#include <none/util.h>

#define inode_entry(i)  container_of(i,struct inode,i_list)
#define I_OFFSET(sbi,n) (2 + sbi->s_imap_blocks + sbi->s_zmap_blocks + n)
#define ZONE_PER_BLOCK(x) (sbi->s_version == MINIX_V1 ?\
        (BLOCK_SIZE / sizeof(unsigned short)) :\
        (BLOCK_SIZE / sizeof(unsigned long)))

static inline unsigned long _get(struct minix_sb_info *sbi,
        void *bb,int num) {
    if(sbi->s_version == MINIX_V1)
        return ((unsigned short *)bb)[num];
    return ((unsigned long *)bb)[num];
}

static inline void _set(struct minix_sb_info *sbi,
        void *bb,int num,unsigned long indir) {
    if(sbi->s_version == MINIX_V1)
        ((unsigned short *)bb)[num] = indir;
    else if(sbi->s_version == MINIX_V2)
        ((unsigned long *)bb)[num] = indir;
}

static unsigned long __indir_map(struct inode *inode,
        unsigned long blk,int num,bool create) {
    DECAL_INODE(inode);
    void *bb;
    unsigned long indir = 0;
    bb = kalloc(BLOCK_SIZE);
    if(!bb)
        return 0;
    if(sb_bread(sb,bb,blk))
        goto out;

    indir = _get(sbi,bb,num);
    if(!indir && create) {
        indir = minix_new_block(inode);
        if(indir) {
            _set(sbi,bb,num,indir);
            sb_bwrite(sb,bb,blk);
        }
    }
out:
    kfree(bb);
    return indir;
}

unsigned long bmap(struct inode *inode,unsigned long zone,bool create) {
    DECAL_INODE(inode);
    unsigned long zone_per_block = ZONE_PER_BLOCK(sbi);
    unsigned long indir = 0;
    if(zone > DIV_ROUND_UP(inode->i_size,BLOCK_SIZE))
        return 0;
    if(zone < sbi->s_dzones) {
        if(create && !mi->i_zone[zone]) {
            mi->i_zone[zone] = minix_new_block(inode);
            if(mi->i_zone[zone]) {
                inode->i_ctime.tv_sec = time(NULL);
                minix_sync_inode(inode);
            }
        }
        return mi->i_zone[zone];
    }

    zone -= sbi->s_dzones;
    if(zone < zone_per_block) {
        if(create && !mi->indir_zone) {
            mi->indir_zone = minix_new_block(inode);
            if(mi->indir_zone) {
                inode->i_ctime.tv_sec = time(NULL);
                minix_sync_inode(inode);
            }
        }
        if(!mi->indir_zone)
            return 0;
        return __indir_map(inode,mi->indir_zone,zone,create);
    }

    zone -= zone_per_block;
    if(zone < zone_per_block * zone_per_block) {
        if(create && !mi->double_indir_zone) {
            mi->double_indir_zone = minix_new_block(inode);
            if(mi->double_indir_zone) {
                inode->i_ctime.tv_sec = time(NULL);
                minix_sync_inode(inode);
            }
        }
        if(!mi->double_indir_zone)
            return 0;
        indir = __indir_map(inode,mi->double_indir_zone,
                zone / zone_per_block,create);
        if(!indir)
            return 0;
        return __indir_map(inode,indir,zone % zone_per_block,create);
    }

    zone -= zone_per_block * zone_per_block;
    if(sbi->s_version == MINIX_V2 &&
            zone < zone_per_block * zone_per_block * zone_per_block) {
        if(create && mi->triple_indir_zone) {
            mi->triple_indir_zone = minix_new_block(inode);
            if(mi->triple_indir_zone) {
                inode->i_ctime.tv_sec = time(NULL);
                minix_sync_inode(inode);
            }
        }
        if(!mi->triple_indir_zone)
            return 0;
        indir = __indir_map(inode,mi->triple_indir_zone,
                zone / (zone_per_block * zone_per_block),create);
        if(!indir)
            return 0;
        indir = __indir_map(inode,indir,zone / zone_per_block,create);
        if(!indir)
            return 0;
        return __indir_map(inode,indir,zone % zone_per_block,create);
    }
    return 0;
}

static struct inode *minix_special_inode(struct super_block *sb,
        void *raw_inode,unsigned long ino) {
    struct inode *inode;
    struct minix_inode_info *minix_inode;
    struct minix_sb_info *sbi;
    if(!sb || !raw_inode || !ino){
        fs_log("sb(%p),raw_inode(%p),ino(%d).\n",sb,raw_inode,ino);
        return NULL;
    }
    inode = kalloc(sizeof(*inode) + sizeof(struct minix_inode_info));
    if(!inode) {
        fs_log("memory out.\n");
        return NULL;
    }
    minix_inode = inode_info(inode);
    sbi = sb_info(sb);
    inode->i_sb = sb;
    inode->i_ino = ino;
    inode->i_rdev = sb->s_bdev;
    minix_inode->i_rawdata = raw_inode;
    if(sbi->s_version == MINIX_V1) {
        struct minix_inode *v1 = raw_inode;
        inode->i_mode = v1->i_mode;
        inode->i_uid  = v1->i_uid;
        inode->i_gid   = v1->i_gid;
        inode->i_mtime.tv_sec = v1->i_time;
        inode->i_ctime.tv_sec = v1->i_time;
        inode->i_atime.tv_sec = time(NULL);
        inode->i_size = v1->i_size;
        minix_inode->i_nlinks = v1->i_nlinks;
        for(unsigned long i = 0;i < sbi->s_dzones;i++)
            minix_inode->i_zone[i] = v1->i_zone[i];
        minix_inode->indir_zone = v1->i_zone[sbi->s_dzones];
        minix_inode->double_indir_zone = v1->i_zone[sbi->s_dzones + 1];
    } else if(sbi->s_version == MINIX_V2){
        struct minix2_inode *v2 = raw_inode;
        inode->i_mode = v2->i_mode;
        inode->i_uid = v2->i_uid;
        inode->i_gid = v2->i_gid;
        inode->i_size = v2->i_size;
        inode->i_atime.tv_sec = v2->i_atime;
        inode->i_mtime.tv_sec = v2->i_mtime;
        inode->i_ctime.tv_sec = v2->i_ctime;
        for(unsigned long i = 0;i < sbi->s_dzones;i++)
            minix_inode->i_zone[i] = v2->i_zone[i];
        minix_inode->indir_zone = v2->indir_zone;
        minix_inode->double_indir_zone = v2->double_indir_zone;
        minix_inode->triple_indir_zone = v2->triple_indir_zone;
    } else {
        mfs_err("only suport minix fs V1 | V2.\n");
        kfree(inode);
        return NULL;
    }
    list_add(&(inode->i_list),&(sb->s_inodes));
    return inode;
}

void minix_sync_inode(struct inode *inode) {
    struct super_block *sb = inode_sb(inode);
    struct minix_sb_info *sbi = sb_info(sb);
    struct minix_inode_info *minix_inode = inode_info(inode);
    int ino_per_block = sb->s_blocksize / sbi->s_inosize;
    int bn,in;

    void *blk = NULL;
    bn = (inode->i_ino - 1) / ino_per_block;
    in = (inode->i_ino - 1) % ino_per_block;
    if(sbi->s_version == MINIX_V1) {
        struct minix_inode *v1 = minix_inode->i_rawdata;
        v1->i_mode = inode->i_mode;
        v1->i_uid = inode->i_uid;
        v1->i_gid = inode->i_gid;
        v1->i_time = inode->i_mtime.tv_sec;
        v1->i_size = inode->i_size;
        v1->i_nlinks = minix_inode->i_nlinks;
        for(unsigned long i = 0;i < sbi->s_dzones;i++)
            v1->i_zone[i] = minix_inode->i_zone[i];
        v1->i_zone[sbi->s_dzones] = minix_inode->indir_zone;
        v1->i_zone[sbi->s_dzones + 1] = minix_inode->double_indir_zone;
    } else if(sbi->s_version == MINIX_V2) {
        struct minix2_inode *v2 = minix_inode->i_rawdata;
        v2->i_mode = inode->i_mode;
        v2->i_uid = inode->i_uid;
        v2->i_gid = inode->i_gid;
        v2->i_mtime = inode->i_mtime.tv_sec;
        v2->i_ctime = inode->i_ctime.tv_sec;
        v2->i_atime = inode->i_atime.tv_sec;
        v2->i_size = inode->i_size;
        v2->i_nlinks = minix_inode->i_nlinks;
        for(unsigned long i = 0;i < sbi->s_dzones;i++)
            v2->i_zone[i] = minix_inode->i_zone[i];
        v2->indir_zone = minix_inode->indir_zone;
        v2->double_indir_zone = minix_inode->double_indir_zone;
        v2->triple_indir_zone = minix_inode->triple_indir_zone;
    } else {
        mfs_err("only suport minix filesystem v1 | v2.\n");
        return;
    }
    blk = minix_inode->i_rawdata - 
        in * sbi->s_inosize;
    sb_bwrite(sb,blk,I_OFFSET(sbi,bn));
}


static struct inode *minix_iget(struct super_block *sb,
        unsigned long ino){
    int ret;
    int block,bn,in;
    struct minix_sb_info *sbi = sb_info(sb);
    struct inode *inode;
    int ino_per_block = sb->s_blocksize / sbi->s_inosize;
    u8  *ib;

    if(!ino || ino > sbi->s_ninodes) {
        mfs_err("Bad inode number on %s : %ld is out of range.\n",
                sb->s_id,ino);
        return NULL;
    }
    ib = kalloc(BLOCK_SIZE);
    if(!ib) {
        mfs_err("memory out.\n");
        return NULL;
    }
    ino--;
    bn = ino / ino_per_block;
    in = ino % ino_per_block;

    block = 2 + sbi->s_imap_blocks + sbi->s_zmap_blocks + bn;
    ret = sb_bread(sb,ib,block);
    if(ret) {
        mfs_err("unable to read inode block.\n");
        goto out_bad_inode;
    }
    inode = minix_special_inode(sb,ib + sbi->s_inosize * in,ino + 1);
    if(!inode){
        mfs_err("unable to sepcail inode.\n");
        goto out_bad_inode;
    }

    ino -= in;
    for(int i = 0;i < ino_per_block;i++) {
        struct inode *inode;
        if(i == in)
            continue;
        inode = minix_special_inode(sb,ib + sbi->s_inosize * i,
                ino + i + 1);
        if(!inode)
            break;
    }

    //kfree(ib);
    return inode;
out_bad_inode:
    kfree(ib);
    goto out;
out:
    return NULL;
}

struct inode *minix_find_inode(struct super_block *sb,unsigned long ino) {
    struct inode *inode;
    list_for_each(pos,&(sb->s_inodes)) {
        inode = inode_entry(pos);
        if(inode->i_ino == ino)
            return inode;
    }
    return minix_iget(sb,ino);
}
        
static struct super_block *minix_alloc_sb(object_t dev,String id) {
    struct super_block *sb;
    sb = kalloc(sizeof(struct super_block) + sizeof(struct minix_sb_info));
    if(!sb)
        return NULL;
    memset(sb,0,sizeof(struct super_block) + sizeof(struct minix_sb_info));
    sb->s_bdev      = dev;
    sb->s_blocksize = BLOCK_SIZE;
    sb->s_blocksize_bits = BLOCK_SHIFT;
    strcpy(sb->s_id,id);
    INIT_LIST_HEAD(&(sb->s_list));
    INIT_LIST_HEAD(&(sb->s_inodes));
    return sb;
}

struct super_block *minix_sget(object_t dev,int *error){
    struct minix_sb_info *sbi;
    struct super_block *sb;
    struct minix_super_block *msb;
    unsigned long i = 0,block = 0;
    u8 **map = NULL;

    msb = kalloc(BLOCK_SIZE);
    if(!msb) {
        *error = -ENOMEM;
        return NULL;
    }

    sb = minix_alloc_sb(dev,"MINIX");
    if(!sb) {
        *error = -ENOMEM;
        goto out_sb_nomem;
    }

    sbi = sb_info(sb);
    *error = sb_bread(sb,msb,MINIX_SUPER_BLOCK);
    if(*error)
        goto out_bad_sb;

    sbi->s_nzones       = msb->s_ninodes;
    sbi->s_ninodes      = msb->s_ninodes;
    sbi->s_max_size     = msb->s_max_size;
    sbi->s_imap_blocks  = msb->s_imap_blocks; 
    sbi->s_zmap_blocks  = msb->s_zmap_blocks;
    sbi->s_firstdatazone = msb->s_firstdatazone;
    sbi->s_log_zone_size = msb->s_log_zone_size;
    if(msb->s_magic == MINIX_SUPER_MAGIC) {
        sbi->s_version = MINIX_V1;
        sbi->s_dirsize = 16;
        sbi->s_namelen = 14;
        sbi->s_inosize = sizeof(struct minix_inode);
        sbi->s_dzones  = V1_NR_DZONES;
    } else if(msb->s_magic == MINIX_SUPER_MAGIC1) {
        sbi->s_version = MINIX_V1;
        sbi->s_dirsize = 32;
        sbi->s_namelen = 30;
        sbi->s_inosize = sizeof(struct minix_inode);
        sbi->s_dzones  =  V1_NR_DZONES;
    } else if(msb->s_magic == MINIX2_SUPER_MAGIC) {
        sbi->s_version = MINIX_V2;
        sbi->s_dirsize = 16;
        sbi->s_namelen = 14;
        sbi->s_inosize = sizeof(struct minix2_inode);
        sbi->s_dzones  =  V2_NR_DZONES;
    } else if(msb->s_magic == MINIX2_SUPER_MAGIC2) {
        sbi->s_version = MINIX_V2;
        sbi->s_dirsize = 32;
        sbi->s_namelen = 30;
        sbi->s_inosize = sizeof(struct minix2_inode);
        sbi->s_dzones  = V2_NR_DZONES;
    } else {
        goto out_no_fs;
    }

    if(sbi->s_imap_blocks == 0 || sbi->s_zmap_blocks == 0)
        goto out_illegal_sb;

    i = (sbi->s_imap_blocks + sbi->s_zmap_blocks) * sizeof(sbi->s_imap);
    map = kalloc(i);
    if(!map)
        goto out_no_map;
    memset(map,0,i);
    sbi->s_imap = &map[0];
    sbi->s_zmap = &map[sbi->s_imap_blocks];
    block = 2;
    for(i = 0;i < sbi->s_imap_blocks + sbi->s_zmap_blocks;i++) {
        map[i] = kalloc(BLOCK_SIZE);
        if(map[i] == NULL)
            goto out_no_bitmap;
        *error = sb_bread(sb,map[i],block);
        if(*error)
            goto out_no_bitmap;
        block++;
    }

    minix_set_bit(0,sbi->s_imap[0]);
    minix_set_bit(0,sbi->s_zmap[0]);
    sb->s_root = minix_find_inode(sb,MINIX_ROOT_INO);
    if(!sb->s_root)
        goto out_bad_rootino;

    return sb;

out_bad_rootino:
    mfs_err("Can't find root inode.\n");
    goto out_free_bitmap;

out_no_bitmap:
    mfs_err("bad superblock or unable to read bitmaps.\n");
out_free_bitmap:
    for(i = 0;i < sbi->s_imap_blocks + sbi->s_zmap_blocks;i++)
        if(map[i])
            kfree(map[i]);
    kfree(map);
    goto out_free_sb_msb;

out_no_map:
    mfs_err("can't allocate map.\n");
    goto out_free_sb_msb;

out_illegal_sb:
    mfs_err("bad superblock.\n");
    goto out_free_sb_msb;

out_no_fs:
    mfs_err("unsuport super block magic %x.\n",msb->s_magic);
    goto out_free_sb_msb;

out_bad_sb:
    mfs_err("unable to read superblock.\n");
    goto out_free_sb_msb;

out_sb_nomem:
    mfs_err("memory out.");
    goto out_free_msb;

out_free_sb_msb:
    kfree(sb);
out_free_msb:
    kfree(msb);
    goto out;
out:
    return NULL;
}

