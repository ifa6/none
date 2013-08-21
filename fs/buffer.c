#include    "fs.h"

#define NR_HASH 307

extern  int end;        // 编译指定
BufferHead  *start_buffer = (BufferHead *) &end;
BufferHead  *hand_table[NR_HASH];
static BufferHead   *free_list;

int NR_BUFFERS  = 0;

#define _hashfn(dev,block)  ((unsigned)(dev ^ block) % NR_HASH)
#define hash(dev,block) hash_table[_hashfn(dev,block)]

typedef struct _blkInq{
    Object *inq;        /*! 请求对象 !*/

}BlkInq;

static void buffer_init(void *end){
    BufferHead *h = start_buffer;
    void *b = (end) & (0xffffc000); // 1KB对齐
    while((b -= BLOCK_SIZE) >= ((void *)(h + 1))){
        memset(h,0,sizeof(BufferHead));
        h->data = b;
        h->prev_free = h - 1;
        h->next_free = h + 1;
        h++;
        NR_BUFFERS++;
    }
    h--;
    free_list = start_buffer;
    free_list->prev_free = h;
    h->next_free = free_list;
    memset(hand_table,0,sizeof(hand_table));
    //for(int i = 0;i < NR_HASH;hash_table[i++] = NULL);
}

static void 

void buffer_main(void){
    printk("Buffer strartup...\n");
    buffer_init((void *)BUFFER_END);
    while(1){
        get();
        dorun(self());
    }
}
