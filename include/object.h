#ifndef __OBJECT_H__
#define __OBJECT_H__
#include    <types.h>

#define OBJECT_NAME_LEN     0x10
#define NR_METHON           0x10
#define NR_OBJECT           0x300       /*! 当前版本所允许的最大对象数量 !*/
#define MAX_BODY            0x400       /*! OBJECT 结构体最大允许值 !*/

typedef long  ObjectDesc;         /*! 对象描述符 ,(文件描述符对象版)!*/
typedef struct _object Object;      /*! 对象,none中的一切,当然,现实中很匮乏 ~*/
typedef struct _ilink   iLink;      /*! 中断请求链 !*/

typedef struct{
    unsigned    r:1;        /*! 拥有者可访问标志 !*/
    unsigned    w:1;        /*! 拥有者可修改标志 !*/
    unsigned    :6;         /*! 保留 !*/
    unsigned    gr:1;       /*! 同组对象可访问标志 !*/
    unsigned    gw:1;       /*! 同组对象可更改标志 !*/
    unsigned    :6;         /*! 保留 !*/
    unsigned    otr:1;      /*! 其他对象可访问标志 !*/
    unsigned    otw:1;      /*! 其他对象可修改标志 !*/
    unsigned    :14;        /*! 保留,将来扩展,比如可知执行 之类 !*/
}Purview;

struct _ilink{
    Object   *admit;
    int      fn;
    unsigned long r1;
    unsigned long r2;
    unsigned long r3;
    iLink    *inext;
};

typedef void (*Methon)(Object*);
struct _object{
    id_t    id;                         /*! 对象ID，对象的唯一标识 !*/
    id_t    guid;                       /*! 对象所属分组。 !*/
    id_t    awnor;                      /*! 拥有者  !*/
    Purview prw;                        /*! 对象权限 !*/
    size_t  cnt;                        /*! 对象引用计数，当该标记为0时，系统可以将其释放 !*/
    char    name[OBJECT_NAME_LEN];      /*! 对象名称，用来给人看的，与机器无关 !*/
    union{
        struct{ unsigned long r1,r2,r3;};
        struct{ off_t offset;count_t count;void *buffer;};
        struct{ void *pointer;};
        struct{ int status;};
    };
    Object  *admit;                     /*! 调用者 !*/
    Object  *wait;                      /*! 这个类等待你的回复 !*/
    int     talk;                       /*! 与爱人之间的桥梁 !*/
    enum { WAITING,SLEEPING,ADMINTING,ACTIVE }work;          /*! 金被日,金日成,金正日,金酱油 !*/
    struct{Object *wlink,*wnext,*wtail;};   /*! 等待调用你的方法的类的队列 !*/
    iLink   *ilink;                         /*! 优先执行链(中断请求) !*/
    struct{
        int     fn;
        union{
            struct{
                /*! 对象访问方法,至于怎么访问,由具体对象决定,比如文件对象就是读文件内容,进程就访问进程内存影像 !*/
                Methon  read;          
                Methon  write;         /*! 道理同上 !*/
                Methon  open;
                Methon  close;
                Methon  clone; /*! 克隆对象拷贝一个对象的镜像,但是这个镜像是一个独立的对象,同一个对象由引用计数控制 !*/
                Methon  hw;
                Methon  ioctl;
            };
            /*! 自定义方法 !*/
            Methon  fns[NR_METHON];
        };
    };
};

#ifndef OBJECT
#define OBJECT(_) ((Object *)(_))
#endif

#define toObject(_)   (object_table[_])

extern  Object *object_table[NR_OBJECT];     /*! 对象表,在该表中的对象才是真正的对象 !*/
extern void dorun(void);
extern Object *cloneObject(Object *obj);
extern ObjectDesc byName(String);
extern ObjectDesc byId(id_t id);

#endif
