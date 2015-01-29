#include "minix_fs.h"
#include <none/fcntl.h>
#include <none/scntl.h>
#include  "../kernel.h"

struct minix_sb_info    *super;
struct minix_inode_info *root_inode;

#define MIN(a,b)    ((a) < (b) ? (a) : (b))
#define MAX(a,b)    ((a) > (b) ? (a) : (b))

static char buff[BLOCK_SIZE];
        
static int v2_read(struct minix_inode_info *inode,void *buffer,off_t offset,count_t count){
    unsigned long  zone = offset / BLOCK_SIZE;
    static char   block[BLOCK_SIZE];
    count_t read_count = BLOCK_SIZE - (offset % BLOCK_SIZE);

    count = MIN(inode->i_size - offset,count);
    read_count = MIN(count ,read_count);
    if(read_count){
        try(ERROR == ,zone_rw(inode,IF_READPAGE,zone,block),throw e_zone_rw);
        memcpy(buffer,block + (offset % BLOCK_SIZE),read_count);
    }
    count -= read_count;
    zone++;
    /*! ~~~~~~~~~~~~~~~~~~~~~~~ 第二步,拷贝BLOCK_SIZE对齐的块 ~~~~~~~~~~~~~~~~~~ ~*/
    count_t n = count / BLOCK_SIZE;
    foreach(i,0,n){
        try(ERROR == ,zone_rw(inode,IF_READPAGE,zone,block),throw e_zone_rw);
        memcpy(buffer + read_count,block,count);
        count -= BLOCK_SIZE;
        read_count += BLOCK_SIZE;
        zone++;
    }
    /*! ~~~~~~~~~~~~~~~~~~~~~ 第三步,拷贝剩下的不足BLOCK_SIZE的块 ~~~~~~~~~~~~~ !*/
    if(count){
        try(ERROR ==,zone_rw(inode,IF_READPAGE,zone,block),throw e_zone_rw);
        memcpy(buffer + read_count,block,count);
        read_count += count;
    }

    catch(e_zone_rw){ 
        return read_count;
    }
}

static void minix_read(object_t o,void *buffer,count_t count){
    count_t read_count;
    File *file = self()->private_data;
    fs_log("read %d bytes offset %d for %s.\n",count,file->offset,self()->name);
    read_count = v2_read(file->inode,buffer,file->offset,count);
    file->offset += read_count;
    ret(o,read_count); 
}

static int v2_write(struct minix_inode_info *inode,void *buffer,off_t offset,count_t count){
    count_t write_count;
    unsigned long  zone = offset / BLOCK_SIZE;

    if(offset + count > inode->i_size){
        count = inode->i_size - offset;
    }

    fs_log("write %d bytes offset %d for %s\n",count,zone,self()->name);
    /*! ~~~~~~~~~~~~~~~~~~~ 第一步,拷贝开头不足一个区部分 ~~~~~~~~~~~~~~~~~~~~~~~ !*/
    write_count = BLOCK_SIZE - (offset % BLOCK_SIZE);
    write_count = MIN(count ,write_count);
    if(write_count){
        try(ERROR == ,zone_rw(inode,IF_READPAGE,zone,buff),throw e_zone_rw);
        memcpy(buff + (offset % BLOCK_SIZE),buffer,write_count);
        try(ERROR == ,zone_rw(inode,IF_WRITEPAGE,zone,buff),throw e_zone_rw);
    }
    count -= write_count;
    zone++;
    /*! ~~~~~~~~~~~~~~~~~~~~~~~ 第二步,拷贝BLOCK_SIZE对齐的块 ~~~~~~~~~~~~~~~~~~ ~*/
    count_t n = count / BLOCK_SIZE;
    foreach(i,0,n){
        memcpy(buff,buffer + write_count,BLOCK_SIZE);
        try(ERROR == ,zone_rw(inode,IF_WRITEPAGE,zone,buff),throw e_zone_rw);
        count -= BLOCK_SIZE;
        write_count += BLOCK_SIZE;
        zone++;
    }
    /*! ~~~~~~~~~~~~~~~~~~~~~ 第三步,拷贝剩下的不足BLOCK_SIZE的块 ~~~~~~~~~~~~~ !*/
    if(count){
        memcpy(buff,buffer + write_count,count);
        try(ERROR ==,zone_rw(inode,IF_WRITEPAGE,zone,buff),throw e_zone_rw);
        write_count += write_count;
    }

    catch(e_zone_rw){ 
        return write_count;
    }
}

static void minix_write(object_t o,void *buffer,count_t count) {
    count_t write_count;
    File *file = self()->private_data;
    write_count = v2_write(file->inode,buffer,file->offset,count);
    file->offset += write_count;
    ret(o,write_count); 
}

static void minix_close(object_t o){
    File *file = self()->private_data;
    file->cnt--;
    ret(o,OK);
    if(file->cnt <= 0) {
        todo("sync inode.");
        kfree(self()->private_data);
        self()->private_data = NULL;
        run(MM_PID,MIF_CLOSE,0,0,0);
    }
}

static void minix_seek(object_t o,int whence,off_t offset){
    File *file = self()->private_data;
    switch(whence){
    case SEEK_SET: file->offset = offset; break;
    case SEEK_CUR: file->offset += offset; break;
    case SEEK_END: file->offset = offset + file->inode->i_size; break;
    };
    ret(o,file->offset);
}

static void minix_open(object_t o,String name,unsigned long mode){
    File *file = self()->private_data;
    fs_log("double open (%s).\n",name);
    file->cnt++;
    ret(o,self()->id);
}


static void minix_umount(object_t o) {
    unused(o);
}

static void minix_domount(struct minix_inode_info *inode,object_t mnt,unsigned long mode) {
    inode->i_mode   = S_IFMNT | (mode & 0777);
    inode->i_object = mnt;
    hook(FIF_UMOUNT,minix_umount);
}

static void minix_mount(object_t o,object_t mnt,unsigned long mode) {
    File *file = self()->private_data;
    struct minix_inode_info *inode = file->inode;
    minix_domount(inode,mnt,mode);
    fs_log("mount (%d) to (%d).\n",self()->id,mnt);
    ret(o,OK);
}

object_t mount_open(struct minix_inode_info *mnt,String name,
        unsigned long mode) {
    fs_log("mount open (%d).\n",mnt->i_object);
    return run(mnt->i_object,IF_OPEN,name,mode,0);
}

object_t normal_open(struct minix_inode_info *inode,String name,
        unsigned long mode) {
    if(inode) {
        object_t id = fork();
        if(0 == id) {
            File *file = kalloc(sizeof(File));
            strcpy(self()->name,name);
            file->inode = inode;
            file->offset = 0;
            file->cnt = 1;
            self()->private_data = file;
            hook(FIF_OPEN,minix_open);
            hook(FIF_READ ,minix_read);
            hook(FIF_WRITE,minix_write);
            hook(FIF_CLOSE,minix_close);
            hook(FIF_SEEK ,minix_seek);
            hook(FIF_MOUNT,minix_mount);
            workloop();
        } else {
            return id;
        }
    }
    return -ENFILE;
}

static void rootfs_open(object_t o,void *buffer,unsigned long mode){
    ret(o,minix_path_walk(root_inode,buffer,mode));
}

static void rootfs_init(void){
    fs_log("rootfs init.\n");
    super = sb_bread(RAMDISK_PID);
    if(super == NULL) 
        panic("\erDon't read super block.\ew\n");

    fs_log("..............super block...............\n");
    fs_log("version            : %s\n",
            super->s_version == MINIX_V1 ? "minix v1" :
            super->s_version == MINIX_V2 ? "minix v2" :
            "unkonw");
    fs_log("device             : %d\n",super->s_dev);
    fs_log("ninodes            : %d\n",super->s_ninodes);
    fs_log("inode size         : %d\n",super->s_inosize);
    fs_log("dzones             : %d\n",super->s_dzones);
    fs_log("dir size           : %d\n",super->s_dirsize);
    fs_log("name length        : %d\n",super->s_namelen);

    root_inode = super->s_rootino;

    fs_log("..............root inode................\n");
    fs_log("size               : %d\n",root_inode->i_size);

    hook(IF_OPEN,rootfs_open);
}

int rootfs_main(void){
    rootfs_init();
    workloop();
    return 0;
}
