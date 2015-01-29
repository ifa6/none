#include    "buffer.h"
#include    "kernel.h"


/*! 缓存管理,进程间大量数据传输,会首先传输到缓存里面,然后通知接受进程去处理 !*/
typedef struct _buffer{
    union{
        struct _buffer  *next;
        char data[0x1000];
    };
}Buffer;
static Buffer   *first = NULL;

void buffer_init(void){
    int i = 0;
    Buffer  *buf = (void*)BUFFER_START;
    for(i = 0;i < BUFFER_COUNT - 1;i++){
        buf[i].next = buf+i+1;
    }
    buf[i].next = NULL;
    first = buf;
}

static void *get_buffer(void){
    Buffer *buff = NULL;
    if(first){
        buff = first;
        first = first->next;
    }
    return buff;
}

static void free_buffer(Buffer *buff){
    if(!buff) panic("free buffer error\n");
    buff = (void*)(((Pointer)buff) & (~0xfff));
    buff->next = first;
    first = buff;
}

void *dobuffer(int fn,void *s,size_t len){
    void  *buff = NULL;
    len &= 0xfff;
    if(fn == IF_WRITE){
        buff = get_buffer();
        if(and(,buff,s,len)){
            memcpy(buff,s,len);
        }
    }else if(fn == IF_READ){
        free_buffer(s);
    }
    return buff;
}
