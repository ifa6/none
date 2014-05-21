#include    "keyboard.h"

#define KEY_ESC         '\e'
#define KEY_TAB         '\t'
#define KEY_ENTER       '\n'
#define KEY_CTRL_L      '\0'
#define KEY_SHIFT_L     '\0'
#define KEY_SHIFT_R     '\0'
#define KEY_PRTSCREEN   '\0'
#define KEY_ALT_L       '\0'
#define KEY_ALT_R       '\0'
#define KEY_CAPLOCK     '\0'
#define KEY_F1          '\0'
#define KEY_F2          '\0'
#define KEY_F3          '\0'
#define KEY_F4          '\0'
#define KEY_F5          '\0'
#define KEY_F6          '\0'
#define KEY_F7          '\0'
#define KEY_F8          '\0'
#define KEY_F9          '\0'
#define KEY_F10         '\0'
#define KEY_F11         '\0'
#define KEY_F12         '\0'
#define KEY_NUM         '\0'
#define KEY_SCRL        '\0'
#define KEY_HOME        '\0'
#define KEY_END         '\0'
#define KEY_PAGEUP      '\0'
#define KEY_PAGEDONW    '\0'
#define KEY_UP          '\0'
#define KEY_LEFT        '\0'
#define KEY_RIGHT       '\0'
#define KEY_DONW        '\0'
#define KEY_5           '5'


static const unsigned char keymap[][0x7f] = {
    {
        0,KEY_ESC ,'1','2','3','4','5','6','7','8','9','0','-','=','\b',
          KEY_TAB ,'q','w','e','r','t','y','u','i','o','p','[',']',KEY_ENTER,
        KEY_CTRL_L,'a','s','d','f','g','h','j','k','l',';','\'','`',KEY_SHIFT_L,
        '\\'      ,'z','x','c','v','b','n','m',',','.','/',KEY_SHIFT_R,KEY_ALT_L, 
        [0x39] = ' ', KEY_CAPLOCK,KEY_F1,KEY_F2,KEY_F3,KEY_F4,KEY_F5,KEY_F6,KEY_F7,KEY_F8,KEY_F9,KEY_F10,
    },
    {
        0,KEY_ESC ,'!','@','#','$','%','^','&','*','(',')','_','+','\b',
          KEY_TAB ,'Q','W','E','R','T','Y','U','I','O','P','{','}',KEY_ENTER,
        KEY_CTRL_L,'A','S','D','F','G','H','J','K','L',':','"','~',KEY_SHIFT_L,
        '|'       ,'Z','X','C','V','B','N','M','<','>','?',KEY_SHIFT_R,KEY_ALT_L, 
        [0x39] = ' ', KEY_CAPLOCK,KEY_F1,KEY_F2,KEY_F3,KEY_F4,KEY_F5,KEY_F6,KEY_F7,KEY_F8,KEY_F9,KEY_F10,
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

        switch(ch){
        case 0x02 ... 0x29 : 
        case 0x2b ... 0x35 :
        case 0x39:
        case 0x4a:
        case 0x4c:
        case 0x4e:
            buffer[index++] = str[ch];
            printk("%c",buffer[index - 1]);
            if(index >= 52) index = 0;
            if(admit && index){
                copy_buffer(admit,_buf,count);
                admit = NULL;
                count = 0;
                _buf = NULL; 
            }
            break;
        case 0x49: printk("\eD"); break;
        case 0x51: printk("\eU"); break;
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
    self()->fns[CLOSE] = _reset;
    put_irq_handler(1,keyboard_handler);
}
