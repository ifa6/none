/*
 *      汇编不给力
 *      :D
 */
#include <x86/io.h>
#include <string.h>
#include <stdlib.h>
#include <sys/inter.h>
#include "../../kernel/kernel.h"
#include "ne2k.h"
#include <z.h>
//#define     RECV_PACKET     1
//#define     TRANS_PACKET    0xa


#define     NE2K_IRQ        3

#define     TRANS_PAGE      0x40   //0x4000~0x4600该地址是NIC的缓冲区,主机内存
#define     RECV_PAGE       0x46   //0x4600~0x8000,每一页是256字节
#define     RECV_PAGE_END   0x7f

#define     shortNetToHost(num) ({\
        unsigned short _v;          \
        __asm__("xchgb %%al,%%ah\n\t\t":"=a"(_v):"a"(num):); \
        _v; \
})

static  unsigned char imr = 0x1b;

//static  unsigned char rcr = 0;
//tatic  unsigned char tcr = 0;
//static  unsigned char dcr = 0x58;
#pragma     pack(1)
typedef struct{
    unsigned char state;
    unsigned char next;
    unsigned short len;
}recvHeadT,*recvHeadTp;
#pragma pack()

void NICtoPC(void *dest,unsigned short dma,int count){
    count++;
    neSetRemoteByteCount((count&-2));
    count >>= 1;
    neSetRemoteAddr(dma);
    neReadDMA();
    __asm__("0:in   %%dx,%%ax\n\t\t"
            "stosw\n\t\t"
            "loop 0b\n\t\t"
            ::"D"(dest),"c"(count),"d"(IOPORT)
            :"eax");
    while(!(NE_RDC & neGetIntState()));
    neSetIntState(NE_RDC);
}
void PCtoNIC(void *src,unsigned short dma,int count){
    count++;
    neSetRemoteByteCount((count & -2));
    count >>= 1;
    neSetRemoteAddr(dma);
    neWriteDMA();
    __asm__("0:lodsw\n\t\t"
            "out   %%ax,%%dx\n\t\t"
            "loop 0b\n\t\t"
            ::"S"(src),"c"(count),"d"(IOPORT)
            :"eax");
    //等待写完成
    while(!(NE_RDC & neGetIntState()));
    neSetIntState(NE_RDC);
}
static void ne2kInit(unsigned char *mac){
    neCmd(NE_DMA_ABORT|NE_STOP);                                //停止运行
    //字长,高位在15-8,16位DMA传送,回路检测,自动远程操作
    neSetDataConfig(NE_WTS|NE_LS|NE_ARM|NE_BOS);        //配置数据寄存器
    neSetRemoteByteCount(0);                            //字节计数归零
    //outb(rcr,RECEIVECONFIGURATION);               //配置接收寄存器
    neSetRecvConfig(/*! NE_AM|NE_AB| !*/NE_SEP|NE_AR);
    neSetTransferPage(TRANS_PAGE);          //传送页
    neSetTransferConfig(NE_LB00);           //环状模式
    neSetRecvPage(RECV_PAGE,RECV_PAGE_END); //发送缓冲区
    neSetBoundary(RECV_PAGE);               //分界
    neSetCurrnet(RECV_PAGE+1);
    neSetIntState(0xff);                    //中断状态复位
    neSetIntMask(imr);                      //终端掩码,内容是什么我也不知道
    //neSetTransferConfig(NE_LB00);         //进入正常模式,NIC可以工作了
    neCmd(NE_DMA_ABORT|NE_START);           //运行
    //读设置取MAC地址
    NICtoPC(mac,0,12);
    mac[1] = mac[2];
    mac[2] = mac[4];
    mac[3] = mac[6];
    mac[4] = mac[8];
    mac[5] = mac[10];
    neSetMAC((*(unsigned long *)mac),*(unsigned long *)&mac[4]);
    neSetMap(0xffffffff,0xffffffff);
}

void neSend(void *data,size_t len){
    cli();
    //正在发送,则将当前包加入发送队列
    if(data != NULL){
        if(0x26 == inb(COMMAND)){
            printk("---\n");
            return;
        }else{
            PCtoNIC(data,(TRANS_PAGE<<8),len);
            neSendPack(TRANS_PAGE,len);
        }
    }
    sti();
}
/*
 *      返回接收的字节数,为-1则表明接收失败.
 */
int neRecv(void *data,size_t len){
    unsigned char bound;
    unsigned char currnet;
    recvHeadT recv;

    bound = neGetBoundary() + 1;
    currnet = neGetCurrnet();
    if(bound > RECV_PAGE_END)
        bound = RECV_PAGE;

    //有数据在NIC DMA中 
    if(bound != currnet){
        NICtoPC(&recv,bound << 8,sizeof(recvHeadT));
        //由于网络顺序是和本地相反的,所以要进行一次转换
        //printk("len:\e next:\e  \n",recv.len,recv.next);
        //recv.len = shortNetToHost(recv.len);
        //去除4字节的CRC
        recv.len -= 4;
        //接收状态错误,下一页指针错误,长度错误都丢弃所有的包
        if(recv.next > RECV_PAGE_END || recv.next < RECV_PAGE || recv.len > 0x600){
            neSetCurrnet(RECV_PAGE);
            neSetBoundary(RECV_PAGE_END);
            return -1;
        }else{
            if(data != NULL){
                NICtoPC(data,(bound<<8) | sizeof(recvHeadT),len);
                neSetBoundary((recv.next - 1));
            }
        }
    }
    return len;
}

static int ne2k_handler(object_t o,int irq){
    unused(irq);
    int state = 0;

    state = neGetIntState();
    doint(o,HARDWARE,state,0,0);

    cli();
    neSetIntMask(imr);
    neSetIntState(state);
    sti();

    return OK;
}

typedef struct _ioInq{
    Object *admit;
    count_t count;
    char   *buffer;
    struct _ioInq *next;
}IOInq;

static IOInq *inq = NULL;
static IOInq *tail = NULL;

static void ne2k_push(IOInq *in){
    if(!inq){
        inq = in;
        tail = inq;
    }
    tail->next = in;
    tail = in;
    tail->next = NULL;
}

static void ne2k_pop(void){
    IOInq *in;
    if(inq){
        in = inq;
        inq = inq->next;
        kfree(in);
    }
}

static void _rw(Object *thiz){
    if(thiz->fn == WRITE){
        if(thiz->count < 60){
            char buf[60];
            memset(buf,0,60);
            memcpy(buf,thiz->ptr,thiz->count);
            thiz->count = 60;
            neSend(buf,thiz->count);
            printx(buf,thiz->count);
        } else {
            neSend(thiz->ptr,thiz->count);
        }
        //printx(thiz->ptr,thiz->count);
        ret(thiz->admit,OK);
    }else{
        IOInq *in = kalloc(sizeof(IOInq));
        if(in){
            in->admit = thiz->admit;
            in->admit = thiz->admit;
            in->buffer = thiz->buffer;
            in->next = NULL;
            in->count = thiz->count;
            ne2k_push(in);
        }else{
            ret(thiz->admit,ERROR);
        }
    }
}

static void _io(Object *thiz){
#if 1
    size_t len;
    if(thiz->status & NE_ISR_PRX){
        if(inq){
            len = neRecv(inq->buffer,inq->count);
            ret(inq->admit,len);
            ne2k_pop();
        }
    }
#endif
    unused(len);
}

static void ne2k_init(void){
    static unsigned char mac[12];
    hook(WRITE,_rw);
    hook(READ,_rw);
    hook(HARDWARE,_io);
    put_irq_handler(NE2K_IRQ,ne2k_handler);
    ne2kInit(mac);
}

int ne2k_main(void){
    ne2k_init();
    dorun();
    return 0;
}

