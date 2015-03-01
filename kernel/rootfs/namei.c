#include "minix_fs.h"
#include <z.h>

#define MAY_EXEC    1
#define MAY_WRITE   2
#define MAY_READ    4

static inline int namecompare(int len,int maxlen,
        String name,String buffer) {
    if(len < maxlen && buffer[len])
        return 0;
    return !memcmp(name,buffer,len);
}

static inline void *minix_next_entry(void *de,struct minix_sb_info *sbi) {
    return (void*)((char *)de + sbi->s_dirsize);
}

static bool permission(struct inode *inode,umode_t mask) {
    struct minix_inode_info *mi = inode_info(inode);
    umode_t mode = inode->i_mode;

 //   fs_log("permission inode->i_rdev(%d),mi->i_nlinks(%d).\n",
  //          inode->i_rdev,mi->i_nlinks);
    if(inode->i_rdev && !mi->i_nlinks)
        return false;

    mode >>= 6;
  //  fs_log("permission (mode & mask & 0007) => (%o %o %d).\n",
   //         mode,mask,mode & mask & 0007);
    if((mode & mask & 0007) == mask)
        return true;
    return false;
}

static void *minix_find_entry(struct inode *dir,String name,int nlen,struct minix_dir_entry **res_dir,unsigned long *res_zone) {
    void *bb;
    int i,entries,res = 0;
    DECAL_SB(dir);
    struct minix_dir_entry *de;
    unsigned long dir_per_block  = sb->s_blocksize / sbi->s_dirsize;

    if(!nlen)
        return NULL;
    bb = kalloc(sb->s_blocksize);
    if(!bb)
        return NULL;
    entries = dir->i_size / sbi->s_dirsize;

    /* check for '..',as we might have to do some 'magic' fot it */
    if(nlen == 2 && name[0] == '.' && name[1] == '.') {
        todo("unhandler '..'.\n");
        goto out_err;
    }

    res = inode_bread(dir,bb,0);
    if(res)
        goto out_err;

    i = 0; de = bb;
    while(i < entries) {
        if((void*)de >= sb->s_blocksize + bb) {
            if(inode_bread(dir,bb,i / dir_per_block)) {
                i += dir_per_block;
                continue;
            }
            de = bb;
        }
#if 0
        fs_log("match (");
        pname(name,nlen);
        printk(",");
        pname(de->name,sbi->s_namelen);
        printk(").\n");
#endif
        if(namecompare(nlen,sbi->s_namelen,name,de->name)) {
            *res_dir = de;
            if(res_zone)
                *res_zone = i / dir_per_block;
            return bb;
        }

        de = minix_next_entry(de,sbi);
        i++;
    }

out_err:
    kfree(bb);
    return NULL;
}

static int minix_add_entry (struct inode *dir,String name,int nlen,unsigned long ino) {
    int res;
    void *bb;
    DECAL_INODE(dir);
    unsigned long block = mi->i_zone[0],i;
    struct minix_dir_entry *de;
    size_t dir_per_block = sb->s_blocksize / sbi->s_dirsize;
    bb = kalloc(sb->s_blocksize);
    if(!nlen)
        return -EINVAL;
    if(!bb)
        return -ENOMEM;

    res = sb_bread(sb,bb,block);
    if(res) {
        kfree(bb);
        return res;
    }
    i = 0; de = bb;
    while(1){
        if((void*)de >= bb + sb->s_blocksize) {
            block = bmap(dir,i / dir_per_block,true);
            if(!block) {
                kfree(bb);
                return -EINVAL;
            }
            if(sb_bread(sb,bb,block)) {
                i += dir_per_block;
                continue;
            }
            de = bb;
        }
        if(i * sbi->s_dirsize >= dir->i_size) {
            fs_log("(s_dirsize,dir->i_size) = >(%p,%d,%d).\n",dir,i * sbi->s_dirsize,dir->i_size);
            de->inode = 0;
            dir->i_size = (i + 1) *sbi->s_dirsize;
            dir->i_ctime.tv_sec = time(NULL);
            minix_sync_inode(dir);
        }
        fs_log("add entry (%s,%d) => inode(%d,%s).\n",name,nlen,de->inode,de->name);

        if(!de->inode) {
            de->inode = ino;
            memcpy(de->name,name,nlen);
            memset(de->name + nlen,0,sbi->s_namelen - nlen);
            dir->i_mtime.tv_sec = time(NULL);
            sb_bwrite(sb,bb,block);
            fs_log("de %s %d dir(%d).\n",de->name,de->inode,dir->i_size);
            kfree(bb);
            return 0;
        }
        de = minix_next_entry(de,sbi);
        i++;
    }
}

static struct inode *minix_lookup(struct inode *dir, String name,size_t nlen) {
    void *bb;
    DECAL_SB(dir);
    unsigned long ino;
    struct inode *inode = NULL;
    struct minix_dir_entry *de;

    if(nlen > sbi->s_namelen)
        return NULL;

    bb = minix_find_entry(dir,name,nlen,&de,NULL);
    if(!bb)
        return NULL;
    ino = de->inode;
    kfree(bb);
    fs_log("%p = minix_find_entry(%p,%s,%d,&de).\n",bb,dir,name,ino);
    if(de->inode)
        inode = minix_find_inode(sb,ino);
    fs_log("%p = minix_find_inode(sb,%d).\n",inode,ino);
    return inode;
}

static struct inode *minix_get_dir(struct inode *inode,String pathname) {
    char c;
    int nlen;
    String thisname;
    DECAL_SB(inode);

    if(*pathname == '/')
        pathname++;
    while(1) {
        thisname = pathname;
        if(!S_ISDIR(inode->i_mode) || !permission(inode,MAY_EXEC))
            return NULL;
        for(nlen = 0;(c = *pathname++) && c != '/';nlen++);
        if(!c)
            return inode;
        inode = minix_lookup(inode,thisname,nlen);
        fs_log("%p = minix_lookup(%p,%s,%d)\n",inode,inode,thisname,nlen);
        if(!inode)
            return NULL;
    }
}

static struct inode *minix_dir_namei(struct inode *base,String pathname,int *nlen,String *name) {
    char c;
    String basename;
    struct inode *dir;

    dir = minix_get_dir(base,pathname);
    if(!dir)
        return NULL;
    basename = pathname;
    while((c = *pathname++))
        if(c == '/')
            basename = pathname;
    *nlen = pathname - basename - 1;
    *name = basename;
    return dir;
}

struct inode *minix_namei(struct inode *base,String pathname) {
    int nlen;
    String basename;
    struct inode *inode;
    DECAL_SB(base);

    base = minix_dir_namei(base,pathname,&nlen,&basename);
    if(!base)
        return NULL;
    if(!nlen)
        return base;
    inode = minix_lookup(base,basename,nlen);
    if(!inode)
        return NULL;
    inode->i_atime.tv_sec = time(NULL);
    minix_sync_inode(inode);
    return inode;
}

int open_namei(String pathname,int flag,umode_t mode,struct inode **res_inode) {
    String basename;
    int nlen,error;
    struct inode *dir,*inode;
    if((flag & O_TRUNC) && !(flag & O_ACCMODE))
        flag |= O_WRONLY;
    mode &= 0777;
    mode |= S_IFREG;
    dir = minix_dir_namei(root,pathname,&nlen,&basename);
    if(!dir)
        return -ENOENT;
    if(!nlen) {
        if(!(flag & (O_ACCMODE | O_CREAT | O_TRUNC))) {
            *res_inode = dir;
            return 0;
        }
        return -EISDIR;
    }
    inode = minix_lookup(dir,basename,nlen);
    if(!inode) {
        if(!(flag & O_CREAT))
            return -ENOENT;
        if(!permission(dir,MAY_WRITE))
            return -EACCES;
        inode = minix_new_inode(dir,mode,&error);
        if(!inode)
            return error;
        error = minix_add_entry(dir,basename,nlen,inode->i_ino);
        if(error) {
            minix_free_inode(inode);
            return -error;
        }
        *res_inode = inode;
        return 0;
    }
    if(flag & O_EXCL)
        return -EEXIST;
    if((S_ISDIR(inode->i_mode) && (flag & O_ACCMODE)) ||
        !permission(inode,ACC_MODE(flag)))
        return -EPERM;
    inode->i_atime.tv_sec = time(NULL);
    *res_inode = inode;
    return 0;
}

int sys_mknod(String filename,int mode,object_t obj) {
    void *bb;
    int nlen,error;
    String basename;
    struct minix_dir_entry *de;
    struct inode *dir,*inode;

    dir = minix_dir_namei(root,filename,&nlen,&basename);
    if(!dir)
        return -ENOENT;
    if(!nlen)
        return -ENOENT;
    if(!permission(dir,MAY_WRITE))
        return -EPERM;
    bb = minix_find_entry(dir,basename,nlen,&de,NULL);
    if(bb) {
        kfree(bb);
        return -EEXIST;
    }
    inode = minix_new_inode(dir,mode,&error);
    if(!inode)
        return -ENOSPC;

    if(S_ISBLK(mode) || S_ISCHR(mode))
        inode->i_rdev = obj;

    inode->i_mtime.tv_sec = inode->i_atime.tv_sec = time(NULL);
    minix_sync_inode(inode);
    error = minix_add_entry(dir,basename,nlen,inode->i_ino);
    if(error) {
        minix_free_inode(inode);
        return error;
    }
    return 0;
}

int minix_mkdir(String pathname,umode_t mode) {
    int nlen,error;
    void *bb;
    String basename;
    struct inode *dir,*inode;
    struct minix_dir_entry *de;
    struct super_block *sb;
    struct minix_sb_info *sbi;
    struct minix_inode_info *mi;

    dir = minix_dir_namei(root,pathname,&nlen,&basename);
    if(!dir || !nlen)
        return -ENOENT;
    if(!permission(dir,MAY_WRITE))
        return -EPERM;

    bb =  minix_find_entry(dir,basename,nlen,&de,NULL);
    if(bb) {
        kfree(bb);
        return -EEXIST;
    }

    inode = minix_new_inode(dir,mode,&error);
    if(!inode)
        return error;
    sb = inode_sb(inode);
    sbi = sb_info(sb);
    mi = inode_info(inode);
    inode->i_size = 2 * sbi->s_dirsize;
    inode->i_mtime.tv_sec = inode->i_atime.tv_sec = time(NULL);
    inode->i_mode = S_IFDIR | (mode & 0777);
    mi->i_zone[0] = minix_new_block(inode);
    if(!mi->i_zone[0]) {
        minix_free_inode(inode);
        return -ENOSPC;
    }

    bb = kalloc(sb->s_blocksize);
    if(!bb) {
        minix_free_inode(inode);
        return -ENOMEM;
    }
    de = bb;
    de->inode = inode->i_ino;
    strcpy(de->name,".");
    de = minix_next_entry(de,sbi);
    de->inode = dir->i_ino;
    strcpy(de->name,"..");
    mi->i_nlinks = 2;
    sb_bwrite(sb,bb,mi->i_zone[0]);
    kfree(bb);
    error = minix_add_entry(dir,basename,nlen,inode->i_ino);
    if(error) {
        minix_free_inode(inode);
        return error;
    }
    minix_sync_inode(inode);
    return 0;
}

static bool minix_emtry_dir(struct inode *inode) {
    void *bb;
    int len,nr,block;
    DECAL_INODE(inode);
    unsigned long dir_per_block = sb->s_blocksize / sbi->s_dirsize;
    struct minix_dir_entry *de;
    len = inode->i_size / sbi->s_dirsize;
    bb = kalloc(sb->s_blocksize);
    if(!bb)
        return false;
    if(len < 2 || !mi->i_zone[0] ||
            (inode_bread(inode,bb,0))) {
        mfs_err("warning - bad directory on dev %d.\n",inode->i_rdev);
        return false;
    }
    de = bb;
    if(de->inode != inode->i_ino || strcmp(de->name,"."))
        return false;
    de = minix_next_entry(de,sbi);
    if(!de->inode || strcmp(de->name,".."))
        return false;

    nr = 2;
    de = minix_next_entry(de,sbi);
    while(nr < len) {
        if(bb + sb->s_blocksize <= (void*)de) {
            block = bmap(inode,nr / dir_per_block,false);
            if(!block) {
                nr += dir_per_block;
                continue;
            }
            if(sb_bread(sb,bb,block)) {
                kfree(bb);
                return false;
            }
            de = bb;
        }
        if(de->inode) {
            kfree(bb);
            return false;
        }
        de = minix_next_entry(de,sbi);
        nr++;
    }
    kfree(bb);
    return true;
}

int minix_rmdir(String name) {
    int nlen;
    void *bb;
    String basename;
    unsigned long zone;
    struct super_block *sb;
    struct inode *inode,*dir;
    struct minix_dir_entry *de;
    struct minix_inode_info *mi;

    dir = minix_dir_namei(root,name,&nlen,&basename);
    if(!dir)
        return -ENOENT;
    if(!nlen)
        return -ENOENT;
    if(!permission(dir,MAY_WRITE))
        return -EPERM;
    sb = inode_sb(dir);
    bb = minix_find_entry(dir,basename,nlen,&de,&zone);
    if(!bb)
        return -ENOENT;
    inode = minix_find_inode(sb,de->inode);
    mi = inode_info(inode);
    if((dir->i_mode & S_ISVTX))
        return -EPERM;
    if(inode->i_rdev != dir->i_rdev)// || inode->i_count > 1)
        return -EPERM;
    if(inode == dir)
        return -EPERM;
    if(!S_ISDIR(inode->i_mode))
        return -ENOTDIR;
    if(!minix_emtry_dir(inode))
        return -ENOTEMPTY;
    if(mi->i_nlinks != 2)
        mfs_err("emptry directory has nlinks != 2(%d).\n",mi->i_nlinks);
    minix_free_inode(inode);
    de->inode = 0;
    dir->i_ctime.tv_sec = dir->i_mtime.tv_sec = time(NULL);
    inode_bwrite(dir,bb,zone);
    minix_sync_inode(dir);
    return 0;
}
