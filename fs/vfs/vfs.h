#ifndef __VFS_H__
#define __VFS_H__
#include <none/list.h>
struct dev_list {
    struct list_head  dlist;        /* 设备列表 */
    struct hlist_head inode_hlist;  /* 该设备上的已经存在的inode */
    dev_t  dev;                     /* 设备 */
};

typedef struct{
    struct dev_list *dlist;
}VFS;

typedef struct{

}DIR;

#endif
