#include    "keyboard.h"

#define ESC '\e'
#define BACKSPACE '\b'
#define TAB '\t'
#define ENTER   '\n'
#define CTRL_L  '\r'
#define SHIFT_L '\r'
#define SHIFT_R '\r'

static const unsigned char keymap[][55] = {
    {
        0,ESC,'1','2','3','4','5','6','7','8','9','0','-','=',BACKSPACE,
        TAB,'q','w','e','r','t','y','u','i','o','p','[',']',ENTER,
        CTRL_L,'a','s','d','f','g','h','j','k','l',';','\'','`',SHIFT_L,'\\', 
        'z','x','c','v','b','n','m',',','.','/',SHIFT_R,
    },
    {
        0,ESC,'!','@','#','$','%','^','&','*','(',')','_','+',BACKSPACE,
        TAB,'Q','W','E','R','T','Y','U','I','O','P','{','}',ENTER,
        CTRL_L,'A','S','D','F','G','H','J','K','L',':','"','~',SHIFT_L,'|',
        'Z','X','C','V','B','N','M','<','>','?',SHIFT_R,
    }
};

#define KB_IN_BYTES 0x32
struct{
    int head;
    int tail;
    bool full;
    unsigned char buf[KB_IN_BYTES];
}kb_in;

#define buf kb_in.buf
#define head kb_in.head
#define tail kb_in.tail
#define full kb_in.full
static inline void push(unsigned char ch){
    if((head != tail) || (!full)){
        head = (head + 1) % KB_IN_BYTES;
        buf[head] = ch;
        if(head == tail) full = true;
    }
}

static inline unsigned char pop(void){
    unsigned char ch = -1;
    if(tail != head || full){
        ch = buf[tail];
        tail = (tail + 1) % KB_IN_BYTES;
        if(tail == head) full = false;
    }
    return ch;
}
#undef  buf
#undef  head
#undef  tail
#undef  full


static int keyboard_handler(object_t o,int nr){
    (void)nr;
    unsigned char in = inb(0x60);
    push(in);
    doint(o,HARDWARE,0,0,0);
    return OK;
}

static char buffer[52];
static count_t index = 0;


static Object *admit = NULL;
static count_t count = 0;
static void *_buf = NULL;

static void _input(Object *this){
    (void)this;
    static bool shift = false;
    unsigned char ch = pop();
    const unsigned char *str = 0;
    if(ch == 54) shift = true;
    else if(ch == 54 + 0x80) shift = false;
    else{
        if(shift) str = keymap[1];
        else str = keymap[0];
        if((ch < 55) && (ch > 0)){
            buffer[index++] = str[ch];
            printk("%c",buffer[index - 1]);
            if(index >= 52) index = 0;
            if(admit && index){
                copy_buffer(admit,_buf,count);
                admit = NULL;
                count = 0;
                _buf = NULL; 
            }
        }
    }
}

void copy_buffer(Object *o,void *buf,count_t len){
    int _v = 0;;
    if(0 == index){
        admit = o;
        count = len;
        _buf = buf;
    }else{
        if(len >= index){
            memcpy(buf,buffer,index);
            _v = index;
        }else{
            _v = len;
            memcpy(buf,buffer,len);
            memcpy(buffer,buffer + len,len - index);
        }
        index -= len;
        ret(o,_v);
    }
}

static void _reset(Object *thiz){
    outb_p(0xfe,0x64);
    ret(thiz->admit,OK);
}

void keyboard_init(void){
    kb_in.head = kb_in.tail = 0;
    kb_in.full = false;
    self()->fns[HARDWARE] = _input;
    self()->fns[EXIT] = _reset;
    put_irq_handler(1,keyboard_handler);
}
