#ifndef __OBJECT_H__
#define __OBJECT_H__
#include    <types.h>

#ifndef OBJECT_NAME_LEN     0x10

typedef struct{
    unsigned    r:1;        /*! 拥有者可访问标志 !*/
    unsigned    w:1;        /*! 拥有者可修改标志 !*/
    unsigned    o:6;        /*! 保留 !*/
    unsigned    gr:1;       /*! 同组对象可访问标志 !*/
    unsigned    gw:1;       /*! 同组对象可更改标志 !*/
    unsigned    go:6;       /*! b保留 !*/
    unsigned    otr:1;      /*! 其他对象可访问标志 !*/
    unsigned    otw:1;      /*! 其他对象可修改标志 !*/
    unsigned    oto:6;      /*! 保留,将来扩展,比如可知执行 之类 !*/
    unsigned    oo:8;       /*! 保留 !*/
}mode_t;

typedef struct _object Object;      /*! 对象,none中的一切,当然,现实中很匮乏 ~*/
typedef struct int (*Methon)(Object);
struct _object{
    id_t    id;                         /*! 对象ID，对象的唯一标识 !*/ 
    id_t    guid;                       /*! 对象所属分组。 !*/
    id_t    awnor;                      /*! 拥有者  !*/
    mode_t  mode;                       /*! 对象权限 !*/
    size_t  count;                      /*! 对象引用计数，当该标记为0时，系统可以将其释放 ！*/
    char    name[OBJECT_NAME_LEN];      /*! 对象名称，用来给人看的，与机器无关 !*/
    Methon  *read;                      /*! 对象访问方法,至于怎么访问,由具体对象决定,比如文件对象就是读文件内容,进程就访问进程内存影像 !*/
    Methon  *write;                     /*! 道理同上 !*/
    Methon  *clone;                     /*! 克隆对象拷贝一个对象的镜像,但是这个镜像是一个独立的对象,同一个对象由引用计数控制 !*/
};

#endif
