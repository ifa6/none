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

    fs_log("permission inode->i_rdev(%d),mi->i_nlinks(%d).\n",
            inode->i_rdev,mi->i_nlinks);
    if(inode->i_rdev && !mi->i_nlinks)
        return false;

    mode >>= 6;
    fs_log("permission (mode & mask & 0007) => (%o %o %d).\n",
            mode,mask,mode & mask & 0007);
    if((mode & mask & 0007) == mask)
        return true;
    return false;
}

static void *minix_find_entry(struct inode *dir,String name,int nlen,struct minix_dir_entry **res_dir) {
    int i,entries;
    void *bb;
    DECAL_SB(dir);
    struct minix_dir_entry *de;
    unsigned long dir_per_block  = sb->s_blocksize / sbi->s_dirsize;

    if(!nlen)
        return NULL;
    bb = kalloc(sb->s_blocksize);
    if(!bb)
        return NULL;
    entries = dir->i_size / sbi->s_dirsize;

    *res_dir = NULL;
    /* check for '..',as we might have to do some 'magic' fot it */
    if(nlen == 2 && name[0] == '.' && name[1] == '.') {
        todo("unhandler '..'.\n");
        goto out_err;
    }

    if(inode_bread(dir,bb,0))
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
            return bb;
        }
        de = minix_next_entry(de,sbi);
        i++;
    }

out_err:
    kfree(bb);
    return NULL;
}


static void * minix_add_entry (struct inode *dir,String name,int nlen,struct minix_dir_entry **res_dir) {
    void *bb;
    DECAL_SB(dir);
    unsigned long block,i;
    struct minix_dir_entry *de;
    size_t dir_per_block = sb->s_blocksize / sbi->s_dirsize;
    bb = kalloc(sb->s_blocksize);
    if(!nlen)
        return NULL;
    if(!bb)
        return NULL;

    if(inode_bread(dir,bb,0))
        goto out_err;
    i = 0; de = bb;
    while(1){
        if((void*)de >= bb + sb->s_blocksize) {
            block = bmap(dir,i / dir_per_block,true);
            if(block)
                goto out_err;
            if(sb_bread(sb,bb,block)) {
                i += dir_per_block;
                continue;
            }
            de = bb;
        }
        if(i * sbi->s_dirsize >= dir->i_size) {
            de->inode = 0;
            dir->i_size = (i + 1) *sbi->s_dirsize;
            dir->i_ctime.tv_sec = time(NULL);
            minix_sync_inode(dir);
        }

        if(!de->inode) {
            dir->i_mtime.tv_sec = time(NULL);
            memcpy(de->name,name,nlen);
            sb_bwrite(sb,bb,block);
            *res_dir = de;
            return bb;
        }
        de = minix_next_entry(de,sbi);
        i++;
    }
out_err:
    kfree(bb);
    return NULL;
}

static struct inode *minix_lookup(struct inode *dir, String name,size_t nlen) {
    void *bb;
    DECAL_SB(dir);
    struct inode *inode = NULL;
    struct minix_dir_entry *de;
    unsigned long ino;

    if(nlen > sbi->s_namelen)
        return NULL;

    bb = minix_find_entry(dir,name,nlen,&de);
    if(!bb)
        return NULL;
    ino = de->inode;
    kfree(bb);
    fs_log("inode(%s,%d).\n",name,ino);
    if(ino)
        inode = minix_find_inode(sb,ino);
    fs_log("inode(%s,&%p,[%d],%d).\n",name,inode,ino,inode->i_size);
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
    fs_log("(%p) minix_get_dir (%p,%s)\n",dir,base,pathname);
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
    void *bb;
    String basename;
    int nlen,error;
    struct inode *dir,*inode;
    struct minix_dir_entry *de;
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
        bb = minix_add_entry(dir,basename,nlen,&de);
        if(!bb) {
            minix_free_inode(inode);
            return -ENOSPC;
        }
        de->inode = inode->i_ino;
        kfree(bb);
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
