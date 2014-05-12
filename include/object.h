#ifndef __OBJECT_H__
#define __OBJECT_H__
#include    <types.h>

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

typedef void (*Methon)(Object*);
struct _object{
    id_t    id;                         /*! 对象ID，对象的唯一标识 !*/
    id_t    guid;                       /*! 对象所属分组。 !*/
    id_t    awnor;                      /*! 拥有者  !*/
    Purview prw;                        /*! 对象权限 !*/
    size_t  cnt;                        /*! 对象引用计数，当该标记为0时，系统可以将其释放 !*/
    char    name[OBJECT_NAME_LEN];      /*! 对象名称，用来给人看的，与机器无关 !*/
    pid_t   friend[NR_FRIEND];          /*! friend都是可直接访问的对象,他们是祖先指定的,祖先可信任,则他们就可信任 !*/
    union{ struct{
        union{
            long status;
            unsigned long mode;
            unsigned long r1;
            off_t offset;
        };
        union{
            unsigned long r2;
            count_t count;
        };
        union{
            unsigned long r3;
            void *buffer;
            void *ptr;
        };
    }; };
    Object  *admit;                     /*! 调用者 !*/
    Object  *wait;                      /*! 这个类等待你的回复 !*/
    int     talk;                       /*! 与爱人之间的桥梁 !*/
    enum { WAITING,SLEEPING,ADMINTING,ACTIVE }work;          /*! 金被日,金日成,金正日,金酱油 !*/
    struct{Object *wlink,*wnext,*wtail;};   /*! 等待调用你的方法的类的队列 !*/
    iLink   *ilink;                         /*! 优先执行链(中断请求) !*/
    struct{
        int     fn;
        Methon  fns[NR_METHON];
    };
};

#ifndef OBJECT
#define OBJECT(_) ((Object *)(_))
#endif

#define toObject(_)   ({\
        __auto_type _v = _;\
        if((_v < NR_FRIEND) && _v >= 0){ _v = self()->friend[_];}\
        object_table[_v];})

extern  Object *object_table[NR_OBJECT];     /*! 对象表,在该表中的对象才是真正的对象 !*/
extern void dorun(void);
extern Object *cloneObject(Object *obj);
extern object_t byName(String);
extern object_t byId(id_t id);

#endif
