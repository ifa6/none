#include "minix_fs.h"
#include <none/fcntl.h>
#include <none/scntl.h>

static struct super_block *super;
struct inode *root;

object_t mount_open(struct inode *inode,String name,umode_t mode) {
    fs_log("mount open(%d).\n",inode->i_rdev);
    return run2(inode->i_rdev,IF_OPEN,name,mode);
}

static void minix_close(object_t caller) {
    struct file *file = self()->private_data;
    file->cnt--;
    ret(caller,OK);
    if(file->cnt <= 0) {
        todo("sync inode.");
        kfree(self()->private_data);
        self()->private_data = NULL;
        run0(MM_PID,MIF_CLOSE);
    }
}

static void minix_open(object_t caller,String name,umode_t unused(mode)) {
    struct file *file = self()->private_data;
    fs_log("double open(%s).\n",name);
    file->cnt++;
    ret(caller,self()->id);
}

object_t normal_open(struct inode *inode,String name,umode_t unused(mode)) {
    if(inode) {
        object_t id = fork();
        if(0 == id) {
            struct file *file = kalloc(sizeof(struct file));
            strcpy(self()->name,name);
            file->inode = inode;
            file->offset = 0;
            file->cnt = 1;
            self()->private_data = file;
            hook(FIF_OPEN,minix_open);
            hook(FIF_READ,minix_read);
            hook(FIF_WRITE,minix_write);
            hook(FIF_CLOSE,minix_close);
            hook(FIF_SEEK,generic_seek);
            hook(FIF_MOUNT,generic_mount);
            workloop();
        } else {
            return id;
        }
    }
    return -ENFILE;
}

static void rootfs_open(object_t caller,void *pathname,int flag,
        umode_t mode) {
    int res;
    struct inode *inode;
    res = open_namei(pathname,flag,mode,&inode);
    if(res) {
        fs_log("%d opoen_namei(%s,%o,%o,%p).\n",
                res,pathname,flag,mode,&inode);
        eret(caller,-1,res);
    } else {
        ret(caller,normal_open(inode,pathname,mode));
    }
}

static void rootfs_mkdir(object_t caller,void *buffer,umode_t mode) {
    int res = minix_mkdir(buffer,mode);
    if(res) {
        fs_log("%d minix_mkdir(%s,%o).\n",res,buffer,mode);
        eret(caller,-1,res);
    } else
        ret(caller,res);
}

static void rootfs_rmdir(object_t caller,void *name) {
    int res = minix_rmdir(name);
    if(res) {
        fs_log("%d minix_rmdir(%s).\n",res,name);
        eret(caller,-1,res);
    } else {
        ret(caller,res);
    }
}


static void info_inode(struct inode *inode) {
    fs_log(".......inode info....\n");
    fs_log("ino    : %d\n",inode->i_ino);
    fs_log("i_size : %d\n",inode->i_size);
    fs_log("i_mode : %o\n",inode->i_mode);
}
static void info_super(struct super_block *sb) {
    struct minix_sb_info *sbi = sb_info(sb);
    fs_log("..............super block...............\n");
    fs_log("version            : %s\n",
            sbi->s_version == MINIX_V1 ? "minix v1" :
            sbi->s_version == MINIX_V2 ? "minix v2" :
            "unkonw");
    fs_log("device             : %d\n",super->s_dev);
    fs_log("ninodes            : %d\n",sbi->s_ninodes);
    fs_log("inode size         : %d\n",sbi->s_inosize);
    fs_log("dzones             : %d\n",sbi->s_dzones);
    fs_log("dir size           : %d\n",sbi->s_dirsize);
    fs_log("name length        : %d\n",sbi->s_namelen);
    fs_log("imap blocks        : %d\n",sbi->s_imap_blocks);
    fs_log("zmap blocks        : %d\n",sbi->s_zmap_blocks);
}

static void rootfs_inode(object_t caller,unsigned long ino) {
    struct inode *inode = minix_find_inode(super,ino);
    info_inode(inode);
    ret(caller,OK);
}

static void rootfs_super(object_t caller) {
    info_super(super);
    ret(caller,OK);
}

static void rootfs_init(void){
    int error;
    struct minix_sb_info *unused(sbi);
    fs_log("rootfs init.\n");
    super = minix_sget(RAMDISK_PID,&error);
    if(super == NULL) 
        panic("\erDon't read super block.\ew\n");

    sbi = sb_info(super);
    info_super(super);

    root = super->s_root;
    info_inode(root);


    hook(FIF_OPEN ,rootfs_open);
    hook(FIF_MKDIR,rootfs_mkdir);
    hook(FIF_RMDIR,rootfs_rmdir);
    hook(IF_USER15,rootfs_inode);
    hook(IF_USER14,rootfs_super);
}

int rootfs_main(void ){
    rootfs_init();
    workloop();
    return 0;
}
