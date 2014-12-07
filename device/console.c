#include    "vga.h"
#include    "input/keyboard.h"

#define MAX_CONSOLES    1

static  unsigned long video_mem_base;       /* base of video memory */
static  unsigned long video_num_columns;    /* Number of text columns */
static  unsigned long video_num_lines;      /* NUmber of text lines */
static  unsigned long video_size_row;       /* Byte per row */
static  int fg_cons;    /*  */

struct {
    unsigned char  attr;        /* char attrib */
    unsigned char  def_attr;    /* default attrib */
    unsigned short erase_char;   /* erase char and attrib */
    unsigned long  mem_start;   /* memory start */
    unsigned long  mem_end;     /* memory end */
    unsigned long  top;         /* screen top */
    unsigned long  bottom;      /* screen bottom */
    unsigned long  pos;         /* cursor position */
    unsigned int   state;
}vc_cons[MAX_CONSOLES];


/* The maco consult Linus */

#define attr        vc_cons[cons].attr
#define def_attr    vc_cons[cons].def_attr
#define erase_char  vc_cons[cons].erase_char
#define mem_start    vc_cons[cons].mem_start
#define mem_end    vc_cons[cons].mem_end
#define top    vc_cons[cons].top
#define bottom    vc_cons[cons].bottom
#define pos    vc_cons[cons].pos
#define state    vc_cons[cons].state


static inline void set_top(int cons){

    //cli();
    if(cons != fg_cons) return;
    mc6845_write((0xff&(top - video_mem_base)>>9),START_ADDR_H);
    mc6845_write(0xff&((top - video_mem_base)>>1),START_ADDR_L);
    //sti();

}

static inline void set_cur(int cons){

    //cli();
    if(cons != fg_cons) return;
    mc6845_write(0xff&((pos - video_mem_base)>>9),CURSOR_H);
    mc6845_write(0xff&((pos - video_mem_base)>>1),CURSOR_L);
    //sti();

}


static inline void scrup(int cons){

    if(bottom > pos) return;
    top += video_size_row;
    bottom += video_size_row;

#if 0
    if(bottom > mem_end){
        __asm__ __volatile__("rep movsl\n\t\t"
                "movl video_num_columns,%%ecx\n\t\t"
                "rep stosw\n\t\t"
                ::"c"(((video_num_lines - 1)*(video_size_row))>>2),
                "D"(mem_start),"S"(top),"a"(erase_char)
                );
        bottom -= top - mem_start; 
        pos -=top - mem_start;
        top = mem_start;
    }

#endif
    set_top(cons);
}

static inline void scrtop(int cons){
    if(bottom > mem_end){
        __asm__ __volatile__("rep movsl\n\t\t"
                "movl video_num_columns,%%ecx\n\t\t"
                "rep stosw\n\t\t"
                ::"c"(((video_num_lines - 1)*(video_size_row))>>2),
                "D"(mem_start),"S"(top),"a"(erase_char)
                );
        bottom -= top - mem_start; 
        pos -= top - mem_start;
        top = mem_start;
    } else {
        __asm__ __volatile__("rep stosw\n\t\t"
                ::"D"(bottom),"c"(video_num_columns),"a"(erase_char));
        top += video_size_row;
        bottom += video_size_row;
    }
    set_top(cons);
}

static inline void scrdown(int cons){
    if(top - video_size_row <= mem_start) return;
    top -= video_size_row;
    bottom -= video_size_row;

    set_top(cons);
}

static inline void lf(int cons){
    if(pos + video_size_row > bottom) scrtop(cons);
    pos += video_size_row;
    set_cur(cons);
}

static inline void cr(int cons){
    pos -= (pos - mem_start) % video_size_row;
    set_cur(cons);
}

static inline void del(int cons){
    if((pos - mem_start) % video_size_row){
        pos -= 2;
        *(unsigned short *)pos = erase_char;
    }
    set_cur(cons);
}


static inline void insert(int cons,unsigned char ch){
    *(unsigned short *)pos  = ch|(attr<<8);
    if(pos + 2 > bottom){
        scrup(cons);
    }
    pos += 2;
    set_cur(cons);
}

extern void cons_print(int cons,const char * buf,count_t count){
    unsigned char ch;

    foreach(i,0,count){
        ch = buf[i];
        if(state == 1){
            switch(ch){
                case    'o':attr = (attr & 0xf0) | 0x00;break;  /*! normal !*/
                case    'O':attr = (attr & 0x0f) | 0x00;break;
                case    'b':attr = (attr & 0xf0) | 0x01;break;  /*! blue !*/
                case    'B':attr = (attr & 0x0f) | 0x10;break;
                case    'g':attr = (attr & 0xf0) | 0x02;break;  /*! green !*/
                case    'G':attr = (attr & 0x0f) | 0x20;break;
                case    'y':attr = (attr & 0xf0) | 0x03;break;  /*! yellow !*/
                case    'Y':attr = (attr & 0x0f) | 0x30;break;
                case    'r':attr = (attr & 0xf0) | 0x04;break;  /*! red !*/
                case    'R':attr = (attr & 0x0f) | 0x40;break;
                case    'v':attr = (attr & 0xf0) | 0x05;break;  /*! !*/
                case    'V':attr = (attr & 0x0f) | 0x50;break;
                case    'h':attr = (attr & 0xf0) | 0x06;break;  
                case    'H':attr = (attr & 0x0f) | 0x60;break;  /*! white !*/
                case    'w':attr = (attr & 0xf0) | 0x07;break;
                case    'W':attr = (attr & 0x0f) | 0x70;break;
                case    'l':attr |= 0x08;break;     /*! hight light !*/
                case    'L':attr &= 0xf7;break;
                case    'f':attr |= 0x80;break;     /*! !*/
                case    'F':attr &= 0x7f;break;
                case    'D': scrdown(cons);break;
                case    'U': scrup(cons);break;
            }
            state = 0;
        } 
        else if(ch == '\e') state = 1;
        else if(ch == '\b') del(cons);
        else if(ch == '\n'){
            lf(cons);
            cr(cons);
        }else{
            insert(cons,ch);
        }
    }
}

extern void cons_init(void){

    int cons = 0;

    fg_cons = 0;
    video_mem_base = 0xb8000;
    video_num_lines = 25;
    video_num_columns = 80;
    video_size_row = video_num_columns << 1;

    attr = 0xf;
    state = 0;
    erase_char = ' ' | 0xf<<8;

    mem_start = video_mem_base;
    mem_end = mem_start + 80*25*2*3;
    top = ((mc6845_read(START_ADDR_H)<<9)|(mc6845_read(START_ADDR_L)<<1)) + mem_start;
    bottom = top + 80*25*2;
    pos = ((mc6845_read(CURSOR_H)<<9)|(mc6845_read(CURSOR_L)<<1)) + mem_start;

}

static void cons_write(object_t caller,void *ptr,count_t count){
    cons_print(0,ptr,count);
    ret(caller,OK);
}

static void cons_read(object_t caller,void *ptr,count_t count){
    copy_buffer(caller,ptr,count);
}

int cons_main(void){
    cons_init();
    keyboard_init();
    hook(READ ,cons_read);
    hook(WRITE,cons_write);
    workloop();
    return 0;
}
