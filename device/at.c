#include "../kernel/kernel.h"
#include "at.h"

/*!
 *
 *      AT硬盘驱动.
 *          驱动工作过程,首先对硬件初始化,设置中断处理程序.接下来调用get()系统调用阻塞等待其他
 *          类唤醒.当从get()返回,说明有其他对象调用了驱动的方法.驱动运行相应的方法.
 *      如果是来自其他类的读写请求,则将请求加入请求队列.驱动器继续调用get()阻塞自己.
 *      如果是来至中断的方法调用,则从IO队列选取合适的请求进行IO,如果IO完成,则调用ret()唤醒等待
 *      的对象,并选取下一个IO继续发送给硬件.驱动器继续调用get()阻塞自己.
 *
 */

#define AT_IRQ 14 

#define min(a,b)    (((a) > (b)) ? (b) : (a))
#define port_read(port,buf,nr)\
    __asm__("cld;rep;insw"::"d"(port),"D"(buf),"c"(nr))

#define port_write(port,buf,nr)\
    __asm__("cld;rep;outsw"::"d"(port),"S"(buf),"c"(nr))


typedef struct _ioInq{
    Object  *inq;                   /*! 请求对象    !*/
    int     cmd;                    /*! 请求命令    !*/
    off_t   offset;                 /*! 请求的偏移字节 !*/
    count_t count;                  /*! 请求字节数 !*/
    void    *buffer;                  /*! 数据buffer !*/
    struct _ioInq   *next,*prev;    /*! 请求链  !*/
}IOInq;

static  IOInq *inq = NULL;     /*! 请求队列,inq总是指向队列中最小的请求 !*/
static  IOInq *admit = NULL;   /*! 当前处理任务 !*/

/*! 将请求添加到队列中 !*/
static void _add(IOInq *iq){
    if(!inq){
        inq = iq;
        inq->next = inq;
        inq->prev = inq;
    }else{
        IOInq *in = inq;
        do{
            if(iq->offset < in->offset)break;
            in = in->next;
        }while(in != inq);
        iq->next =  in;
        iq->prev = in->prev;
        in->prev = iq;
#define _inqMin(a,b) (((a)->offset) > ((b)->offset) ? (b) : (a))
        inq = _inqMin(inq,iq);
#undef  _inqMin
    }
}

/*! 从队列中剔除请求,并将资源释放 !*/
static void _sub(void){
    if(admit){
        IOInq *next = admit->next;
        IOInq *prev = admit->prev;
        next->prev = prev;
        prev->next = next;
        kfree(admit);
        if(prev != next) admit = next;
        else inq = admit = NULL;
    }
}
static bool at_isbusy(void){
    unsigned char s;
    for(int i = 50000;i;i--){
        s = inb_p(AT_STATUS);
        s &= (ATS_BUSY | ATS_READY | ATS_SEEK);
        if( s == (ATS_READY | ATS_SEEK)) return false;
    }
    printk("\erAT DiskHard controller time out \n\ew");
    return true;
}

void at_cmd(byte_t cmd,byte_t ftr,byte_t count,unsigned long long offset,bool slave){
    byte_t low,mid,high,device;
    device = 0xE0;
    if(slave) device |= AT_SLAVE;
    device |= ((offset >> 24) & 0xf);
    low = offset & 0xff;
    mid = (offset >> 8) & 0xff;
    high = (offset >> 16) & 0xff;
    outb_p(0,AT_DEVICE_CTL);
    //while((inb(AT_STATUS) & AT_SBSY));
    outb_p(ftr,AT_FEATURES);
    outb_p(count,AT_SECTOR_COUNT);
    outb_p(low,AT_LBA_LOW);
    outb_p(mid,AT_LBA_MID);
    outb_p(high,AT_LBA_HIGH);
    outb_p(device,AT_DEVICE);
    outb_p(cmd,AT_COMMAND);
}

static void _doio(){
    int cmd = admit->cmd;
    count_t count = admit->count;
    off_t   offset = admit->offset;
    at_cmd(cmd,0,count,offset,false);
    if(at_isbusy()){
        ret(admit->inq,ERROR);
        _sub();
    }
    if(cmd == AT_WRITE){
        void *buffer = admit->buffer;
        for(int i = 50000;i && !(inb_p(AT_STATUS) & ATS_DRQ);i--);
        port_write(AT_DATA,buffer,256);
        admit->offset++;
        admit->count--;
    }
}

/*! 请求的处理 !*/
static void _rw(Object *this){
    IOInq *in = kalloc(sizeof(IOInq));
    if(in){
        in->inq = this->admit;
        in->cmd = (this->fn == READ ? AT_READ : AT_WRITE);
        in->offset = this->offset;
        in->count = this->count;
        in->buffer = this->buffer;
        _add(in);
        if(!admit){
            admit = in;
            _doio();
        }
    }else ret(this,ERROR);
}


static int at_handler(object_t o,int irq){
    (void)irq;
    int status = inb(AT_STATUS);	/* acknowledge interrupt */
    doint(o,HARDWARE,status,0,0);
    return OK;
}


/*! 发送读写设备给硬盘,然后返回等待硬盘准备好 !*/
static void _io(Object *this){
    if(admit){
        int status = this->status;
        void *buffer = admit->buffer;
        if(at_isbusy()) ret(admit->inq,ERROR);
        if(ATS_READY & status){
            if(admit->cmd == AT_READ)
                port_read(AT_DATA,buffer,256);
            else if(admit->cmd == AT_WRITE){
                for(int i = 50000;i && !(inb_p(AT_STATUS) & ATS_DRQ);i--);
                port_write(AT_DATA,buffer,256);
            } else panic("\erHardware IO \eb[\erFail\eb]\n");
            admit->buffer += 512;
            admit->count--;
        }

        if(admit->count <= 0){
            ret(admit->inq,OK);
            _sub();
            if(admit){
                _doio();
            }
        }
    }
}


static void at_init(void){
    hook(WRITE, _rw);
    hook(READ,_rw);
    hook(HARDWARE,_io);
    put_irq_handler(AT_IRQ,at_handler);
    //enable_irq(AT_IRQ);
    outb_p(AT_RESET,AT_DEVICE_CTL);
}

int at_main(void){
    at_init();
    dorun();
    return 0;
}
