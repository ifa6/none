#include "keyboard.h"
#include "keymap.h"
#include <none/if.h>
#include <stdbool.h>

#define KB_IN_BYTES 0x32
#define MAXBUFF 0x100
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
    doint(o,IF_INTR,0,0,0);
    return OK;
}

static char buffer[MAXBUFF];
static cnt_t index = 0;


static object_t _caller = 0;
static cnt_t  _count = 0;
static void     *_buf = NULL;

static void _ispress(object_t caller){
    ret(caller,index);
}
static void _input(object_t caller){
    (void)caller;
    unsigned int ch = pop();
    static const unsigned int *str = keymap[0];
    switch(ch){
    case KEY_LEFTSHIFT:
    case KEY_RIGHTSHIFT:
        //printk("KEY SHIFT\n");
        str = keymap[1];
        break;
    case 0x80 + KEY_LEFTSHIFT:
    case 0x80 + KEY_RIGHTSHIFT:
        //printk("KEY UNSHIFT\n");
        str = keymap[0];
        break;
    case KEY_BACKSPACE:
        if(index > 0){
            index--;
            printk("%c",'\b');
        }
        break;
    case KEY_ESC ... KEY_EQUAL:
    case KEY_TAB ... KEY_RIGHTBRACE:
    case KEY_A ... KEY_GRAVE:
    case KEY_BACKSLASH ... KEY_SLASH:
    case KEY_SPACE:
    case KEY_KP7 ... KEY_KPDOT:
        if(index < MAXBUFF - 1){
            buffer[index++] = str[ch];
            printk("%c",buffer[index - 1]);
        }
        break;
    case KEY_ENTER:
        if(index < MAXBUFF - 1){
            buffer[index++] = str[ch];
            printk("%c",buffer[index - 1]);
        }
        if(_caller && index) {
            copy_buffer(_caller,_buf,_count);
        }
        break;
    }
}

void copy_buffer(object_t caller,void *buf,cnt_t len){
    int _v = 0;;
    if(0 == index){
        _caller = caller;
        _count = len;
        _buf = buf;
    } else {
        if(len >= index){
            memcpy(buf,buffer,index);
            _v = index;
            index = 0;
        } else {
            _v = len;
            memcpy(buf,buffer,len);
            index -= len;
            memcpy(buffer,buffer + len, index);
        }
        ret(caller,_v);
        _caller = 0;
        _count = 0;
        _buf = NULL;
    }
}

static void _reset(object_t caller){
    outb_p(0xfe,0x64);
    ret(caller,OK);
}

void keyboard_init(void){
    kb_in.head = kb_in.tail = 0;
    kb_in.full = false;
    hook(IF_INTR,_input);
    hook(IF_CLOSE,_reset);
    hook(IF_USER1,_ispress);
    put_irq_handler(1,keyboard_handler);
}
