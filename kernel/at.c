#include    "kernel.h"
#include    "driver.h"
#include    "at.h"

#define AT_IRQ 14 

#define min(a,b)    (((a) > (b)) ? (b) : (a))
#define port_read(port,buf,nr)\
    asm("cld;rep;insw"::"d"(port),"D"(buf),"c"(nr))

#define port_write(port,buf,nr)\
    asm("cld;rep;outsw"::"d"(port),"S"(buf),"c"(nr))

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

void at_cmd(Byte cmd,Byte ftr,Byte count,unsigned long long offset,bool slave){
    Byte low,mid,high,device;
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

static int open(Message *m){
    return OK;
}

static int close(Message *m){
    return OK;
}

static int at_handler(int irq){
    static Message m = {.type = HARD_INT,};
    interrupt(AT_PID,&m);
    return OK;
}

static int rd_wt(Message *m){
    Message intm;
    unsigned char cmd;
    unsigned char count;
    unsigned long offset;
    unsigned long nr,n = 0;
    cmd = ((m->type == READ) ? AT_READ : AT_WRITE);
    nr = m->count;
    count = (nr + 511) / 512;
    offset = (m->offset) / 512;
    at_cmd(cmd,0,count,offset,false);
    if(at_isbusy())  return ERROR;
    while(nr > 0){
        if(m->type == READ){
            recvie(HARDWARE,&intm);
            port_read(AT_DATA,(m->buf) + n,256);
        }else{
            for(int i = 50000;i && !(inb_p(AT_STATUS) & ATS_DRQ);i--);
            port_write(AT_DATA,(m->buf) + n,256);
            recvie(HARDWARE,&intm);
        }
        nr -= 512;
        n += 512;
    }
    return OK;
}

static int ioctl(Message *m){
    return OK;
}

void at_init(void){
    printk("AT HD startup...\n");
    put_irq_handler(AT_IRQ,at_handler);
    enable_irq(AT_IRQ);
    outb_p(AT_RESET,AT_DEVICE_CTL);
}

int at_main(void){
    Driver dev = {
        .open = open,
        .read = rd_wt,
        .write = rd_wt,
        .ioctl = ioctl,
        .close = close,
    };
    at_init();
    shared_io_task(&dev);
    return 0;
}
