#ifndef __MINIX_FS_H__
#define __MINIX_FS_H__
#include    "types.h"

typedef unsigned short u16_t;

#define BLOCK_SIZE    1024
#define SUPER_BLOCK      1

#define V2_INODE_SIZE   sizeof(d2_inode)
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

#define MINIX_NAME_LEN   14
#define MINIX_ROOT_INO  1

/* File system types. */
#define SUPER_MAGIC   0x137F	/* magic number contained in super-block */
#define SUPER_REV     0x7F13	/* magic # when 68000 disk read on PC or vv */
#define SUPER_V2      0x2468	/* magic # for V2 file systems */
#define SUPER_V2_REV  0x6824	/* V2 magic written on PC, read on 68K or vv */

typedef struct super_block MinixSuperBlock;
typedef struct inode MinixInode;

struct super_block{
  ino_t s_ninodes;		/* # usable inodes on the minor device */
  zone1_t  s_nzones;		/* total device size, including bit maps etc */
  short s_imap_blocks;		/* # of blocks used by inode bit map */
  short s_zmap_blocks;		/* # of blocks used by zone bit map */
  zone1_t s_firstdatazone;	/* number of first data zone */
  short s_log_zone_size;	/* log2 of blocks/zone */
  off_t s_max_size;		/* maximum file size on this device */
  short s_magic;		/* magic number to recognize super-blocks */
  short s_pad;			/* try to avoid compiler-dependent padding */
  zone_t s_zones;		/* number of zones (replaces s_nzones in V2) */

  /* The following items are only used when the super_block is in memory. */
  struct inode *s_isup;		/* inode for root dir of mounted file sys */
  struct inode *s_imount;	/* inode mounted on */
  unsigned s_inodes_per_block;	/* precalculated from magic number */
  dev_t s_dev;			/* whose super block is this? */
  int s_rd_only;		/* set to 1 iff file sys mounted read only */
  int s_native;			/* set to 1 iff not byte swapped file system */
  int s_version;		/* file system version, zero means bad magic */
  int s_ndzones;		/* # direct zones in an inode */
  int s_nindirs;		/* # indirect zones per indirect block */
  bit_t s_isearch;		/* inodes below this bit number are in use */
  bit_t s_zsearch;		/* all zones below this bit number are in use*/
};

struct inode{
  mode_t i_mode;		/* file type, protection, etc. */
  nlink_t i_nlinks;		/* how many links to this file */
  uid_t i_uid;			/* user id of the file's owner */
  gid_t i_gid;			/* group number */
  off_t i_size;			/* current file size in bytes */
  time_t i_atime;		/* time of last access (V2 only) */
  time_t i_mtime;		/* when was file data last changed */
  time_t i_ctime;		/* when was inode itself changed (V2 only)*/
  zone_t i_zone[V2_NR_TZONES];	/* zone numbers for direct, ind, and dbl ind */
  
  /* The following items are not present on the disk. */
  dev_t i_dev;			/* which device is the inode on */
  ino_t i_num;			/* inode number on its (minor) device */
  int i_count;			/* # times inode used; 0 means slot is free */
  int i_ndzones;		/* # direct zones (Vx_NR_DZONES) */
  int i_nindirs;		/* # indirect zones per indirect block */
  struct super_block *i_sp;	/* pointer to super block for inode's device */
  char i_dirt;			/* CLEAN or DIRTY */
  char i_pipe;			/* set to I_PIPE if pipe */
  char i_mount;			/* this bit is set if file mounted on */
  char i_seek;			/* set on LSEEK, cleared on READ/WRITE */
  char i_update;		/* the ATIME, CTIME, and MTIME bits are here */
};

typedef struct{
    ino_t  inode;
    char name[MINIX_NAME_LEN];
}MinixDirentry;

/* Declaration of the V1 inode as it is on the disk (not in core). */
typedef struct {        /* V1.x disk inode */
    mode_t d1_mode;       /* file type, protection, etc. */
    uid_t d1_uid;         /* user id of the file's owner */
    off_t d1_size;        /* current file size in bytes */
    time_t d1_mtime;      /* when was file data last changed */
    gid_t d1_gid;         /* group number */
    nlink_t d1_nlinks;        /* how many links to this file */
    u16_t d1_zone[V1_NR_TZONES];  /* block nums for direct, ind, and dbl ind */
} d1_inode;

/* Declaration of the V2 inode as it is on the disk (not in core). */
typedef struct {        /* V2.x disk inode */
    mode_t d2_mode;       /* file type, protection, etc. */
    u16_t d2_nlinks;      /* how many links to this file. HACK! */
    uid_t d2_uid;         /* user id of the file's owner. */
    u16_t d2_gid;         /* group number HACK! */
    off_t d2_size;        /* current file size in bytes */
    time_t d2_atime;      /* when was file data last accessed */
    time_t d2_mtime;      /* when was file data last changed */
    time_t d2_ctime;      /* when was inode data last changed */
    zone_t d2_zone[V2_NR_TZONES]; /* block nums for direct, ind, and dbl ind */
} d2_inode;

#endif
