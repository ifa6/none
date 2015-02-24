#ifndef __MINIX_H__
#define __MINIX_H__

#include <none/types.h>

#define FULL_BLOCK(x)   (((x) + (BLOCK_SIZE - 1)) / BLOCK_SIZE)

#define MINIX_SUPER_BLOCK      1
#define V1_INODE_SIZE   sizeof(minix_inode)
#define V1_INODES_PER_BLOCK (BLOCK_SIZE / V1_INODE_SIZE)
#define V2_INODE_SIZE   sizeof(minix2_inode)
#define V2_INODES_PER_BLOCK (BLOCK_SIZE / V2_INODE_SIZE)

/* file type */
#define MINIX_FIFO  0x0100
#define MINIX_CHAR  0x0200
#define MINIX_DIR   0x0400
#define MINIX_BLOCK 0x0600
#define MINIX_FILE  0x1000

#define V1_NR_DZONES       7	/* # direct zone numbers in a V1 inode */
#define V1_NR_TZONES       9	/* total # zone numbers in a V1 inode */
#define V2_NR_DZONES       7	/* # direct zone numbers in a V2 inode */
#define V2_NR_TZONES      10	/* total # zone numbers in a V2 inode */

#define MINIX_ROOT_INO      1

/* File system types. */
#define MINIX_SUPER_MAGIC   0x137F /* minix v1 fs,14 char names */
#define MINIX_SUPER_MAGIC1  0x138F /* minix v1 fs,30 char names */
#define MINIX2_SUPER_MAGIC  0x2468 /* minix v2 fs,14 char names */
#define MINIX2_SUPER_MAGIC2 0x2478 /* minix v2 fs,30 char names */
#define MINIX3_SUPER_MAGIC  0x4d5a /* minix v3 fs,60 char names */
#define SUPER_REV    0x7F13	/* magic # when 68000 disk read on PC or vv */
#define SUPER_V2_REV 0x6824	/* V2 magic written on PC, read on 68K or vv */

#define MINIX_V1    0x0001
#define MINIX_V2    0x0002
#define MINIX_V3    0x0003

struct minix_inode {
    u16 i_mode;
    u16 i_uid;
    u32 i_size;
    u32 i_time;
    u8  i_gid;
    u8  i_nlinks;
    u16 i_zone[V1_NR_TZONES];
}__attribute__((packed));

struct minix2_inode {
  u16 i_mode;		    /* file type, protection, etc. */
  u16 i_nlinks;		    /* how many links to this file */
  u16 i_uid;			/* user id of the file's owner */
  u16 i_gid;			/* group number */
  u32 i_size;			/* current file size in bytes */
  u32 i_atime;          /* time of last access (V2 only) */
  u32 i_mtime;          /* when was file data last changed */
  u32 i_ctime;          /* when was inode itself changed (V2 only)*/
  u32 i_zone[V2_NR_DZONES];	/* zone numbers for direct, ind, and dbl ind */
  u32 indir_zone;
  u32 double_indir_zone;
  u32 triple_indir_zone;
}__attribute__((packed));

struct minix_super_block{
  u16 s_ninodes;		/* # usable inodes on the minor device */
  u16 s_nzones;		/* total device size, including bit maps etc */
  u16 s_imap_blocks;		/* # of blocks used by inode bit map */
  u16 s_zmap_blocks;		/* # of blocks used by zone bit map */
  u16 s_firstdatazone;	/* number of first data zone */
  u16 s_log_zone_size;	/* log2 of blocks/zone */
  u32 s_max_size;		/* maximum file size on this device */
  u16 s_magic;		/* magic number to recognize super-blocks */
  u16 s_pad;			/* try to avoid compiler-dependent padding */
  u32 s_zones;		/* number of zones (replaces s_nzones in V2) */
}__attribute__((packed));

/*
 * V3 minix super-block data on disk
 */
struct minix3_super_block {
	u32 s_ninodes;
	u16 s_pad0;
	u16 s_imap_blocks;
	u16 s_zmap_blocks;
	u16 s_firstdatazone;
	u16 s_log_zone_size;
	u16 s_pad1;
	u32 s_max_size;
	u32 s_zones;
	u16 s_magic;
	u16 s_pad2;
	u16 s_blocksize;
	u8  s_disk_version;
}__attribute__((packed));

struct minix_dir_entry {
	u16  inode;
	char name[0];
};

struct minix3_dir_entry {
	u32  inode;
	char name[0];
};

#endif
