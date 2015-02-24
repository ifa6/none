#include "minix_fs.h"
#include "../kernel.h"
#include <none/util.h>
#include <none/time.h>
static u32 count_free(u8 *map[],unsigned blocksize,u32 numbits) {
    u32 sum = 0;
    unsigned blocks = DIV_ROUND_UP(numbits,blocksize * 8);
    while(blocks--) {
        unsigned words = blocksize / 2;
        u16 *p = (u16 *)(*map++);
        while(words--)
            sum += 16 - hweight16(*p++);
    }
    return sum;
}

void minix_free_block(struct minix_inode_info *inode,unsigned long block) {
    struct minix_sb_info *sbi = inode->i_sb;
    u8 *ib;
    int k = BLOCK_SHIFT + 3;
    unsigned long bit,zone;

    if(block < sbi->s_firstdatazone || block >= sbi->s_nzones) {
        mfs_err("Trying to free block not in datazone.\n");
        return ;
    }
    zone = block - sbi->s_firstdatazone + 1;
    bit = zone & ((1 << k) - 1);
    zone >>= k;
    if(zone >= sbi->s_zmap_blocks) {
        mfs_err("nonexistent bitmap buffer.\n");
        return ;
    }
    ib = sbi->s_zmap[zone];
    lock();
    if(!minix_test_and_clear_bit(bit,ib))
        mfs_err("(%d): bit already cleared.\n",block);
    unlock();
    //mark_buffer_dirty(ib);
}

int minix_new_block(struct minix_inode_info *inode){
    struct minix_sb_info *sbi = inode->i_sb;
    unsigned int bits_per_zone = 8 * sbi->s_blocksize;
    unsigned int i;
    for(i = 0;i < sbi->s_zmap_blocks;i++) {
        u8 *zb = sbi->s_zmap[i];
        unsigned int j;
        lock();
        j = minix_find_first_zero_bit(zb,bits_per_zone);
        if(j < bits_per_zone) {
            unlock();
            j += i * bits_per_zone + sbi->s_firstdatazone - 1;
            if(j < sbi->s_firstdatazone || j >= sbi->s_nzones)
                break;
            return j;
        }
        unlock();
    }
    return 0;
}

unsigned long minix_count_free_blocks(struct minix_sb_info *sbi) {
    u32 bits = sbi->s_nzones - sbi->s_firstdatazone + 1;
    return (count_free(sbi->s_zmap,sbi->s_blocksize,bits) 
            << sbi->s_log_zone_size);
}

static inline void minix_clear_inode(struct minix_inode_info *inode) {
    inode->i_nlinks = 0;
    inode->i_mode = 0;
}

void minix_free_inode(struct minix_inode_info *inode) {
    struct minix_sb_info *sbi = inode->i_sb;
    u8 *ib;
    unsigned int k = BLOCK_SHIFT + 3;
    unsigned long inr,bit;

    inr = inode->i_inr;
    if(inr < 1 || inr > sbi->s_ninodes) {
        mfs_err("inode 0 or nonexistent inode.\n");
        return;
    }
    bit = inr & ((1 << k) - 1);
    inr >>= k;
    if(inr >= sbi->s_imap_blocks) {
        mfs_err("nonexistenet imap in superblock.\n");
        return;
    }
    minix_clear_inode(inode);
    ib = sbi->s_imap[inr];
    lock();
    if(!minix_test_and_clear_bit(bit,ib))
            mfs_err("bit %lu already cleared.\n",bit);
    unlock();
}

void minix_inode_init_owner(struct minix_inode_info *inode,const struct minix_inode_info *dir,
        umode_t mode) {
    inode->i_uid = current_fsuid();
    if(dir && dir->i_mode & S_ISGID) {
        inode->i_gid = dir->i_gid;
        if(S_ISDIR(mode))
            mode |= S_ISGID;
    }
}

struct minix_inode_info *minix_new_inode(const struct minix_inode_info *dir,mode_t mode,int *error) {
    struct minix_sb_info *sbi = dir->i_sb;
    struct minix_inode_info *inode;
    u8 *ib;
    unsigned long i,j, bits_per_zone = 8 * sbi->s_blocksize;
    inode = kalloc(sizeof(*inode));
    memset(inode,0,sizeof(*inode));
    if(!inode) {
        *error = -ENOMEM;
        return NULL;
    }
    j = bits_per_zone;
    *error = -ENOSPC;
    lock();
    for(i = 0;i < sbi->s_imap_blocks;i++) {
        ib = sbi->s_imap[0];
        j = minix_find_first_zero_bit(ib,bits_per_zone);
        if(j < bits_per_zone)
            break;
    }
    if(!ib || j >= bits_per_zone) {
        unlock();
        kfree(inode);
        return NULL;
    }
    if (minix_test_and_set_bit(j,ib)) {
        unlock();
        mfs_err("bit already set.\n");
        kfree(inode);
        return NULL;
    }
    unlock();
    j += i * bits_per_zone;
    if(!j || j > sbi->s_ninodes) {
        kfree(inode);
        return NULL;
    }
    minix_inode_init_owner(inode,dir,mode);
    inode->i_inr = j;
    inode->i_mtime = inode->i_atime = inode->i_ctime = time(NULL);
    *error = 0;
    return inode;
}

unsigned long minix_count_free_inodes(struct minix_sb_info *sb) {
    u32 bits = sb->s_ninodes + 1;
    return count_free(sb->s_imap,sb->s_blocksize,bits);
}
