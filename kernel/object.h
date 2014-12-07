#ifndef __NONE_OBJECT_H__
#define __NONE_OBJECT_H__
#include    <none/types.h>

#define OBJECT_NAME_LEN     0x10
#define NR_METHON           0x10
#define NR_FRIEND           3
#define NR_OBJECT           0x300       /*! 当前版本所允许的最大对象数量 !*/

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

typedef void (*Methon)();
struct _object{
    object_t id;                         /*! 对象ID，对象的唯一标识 !*/
    object_t guid;                       /*! 对象所属分组。 !*/
    object_t awnor;                      /*! 拥有者  !*/
    object_t father;                     /*! 父 !*/
    Purview prw;                         /*! 对象权限 !*/
    size_t  cnt;                         /*! 对象引用计数，当该标记为0时，系统可以将其释放 !*/
    char    name[OBJECT_NAME_LEN];       /*! 对象名称，用来给人看的，与机器无关 !*/
    pid_t   friend[NR_FRIEND];           /*! friend都是可直接访问的对象,他们是祖先指定的,祖先可信任,则他们就可信任 !*/
    unsigned long fn,r1,r2,r3;
    Methon  fns[NR_METHON];
    Object  *wait;                          /*! 等待这个对象的答复 !*/
    int     talk;                           /*! 上面这个对象的答复 !*/
    enum { WAITING,SLEEPING,ACTIVE }work;   /*! 等待一个请求的完成,等待一个请求的到来,正在运行中 !*/
    struct{Object *wlink,*wnext,*wtail;};   /*! 等待调用你的方法的类的队列 !*/
    iLink   *ilink;                         /*! 优先执行链(中断请求) !*/
    void    *private_data;                  /*! 私有数据指针,仿Linux FS !*/
};

#ifndef OBJECT
#define OBJECT(_) ((Object*)_)
#endif

#define toObject(_)   ({\
        object_t _v = _;\
        if((_v < NR_FRIEND) && _v >= 0){ _v = self()->friend[_];}\
        object_table[_v];})

extern Object *object_table[NR_OBJECT];     /*! 对象表,在该表中的对象才是真正的对象 !*/
extern Object *cloneObject(Object *obj);
extern object_t byName(String);
extern object_t byId(id_t id);

#endif
