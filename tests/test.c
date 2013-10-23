#include    <stdio.h>
#include    <string.h>
#include    <x86/io.h>
#include    <sys/inter.h>
#include    "bmp.h"

#define VGABASE ((void *)0x0)
#define VGALIMIT    0x10000

#pragma pack(1) 
typedef struct{
    char signature[4];
    unsigned short entryPoint;
    unsigned short PMInit;
    unsigned short biosDataSel;
    unsigned short aSel;
    unsigned short bSel;
    unsigned short b8Sel;
    unsigned short cSel;
    char inProteMode;
    char checkSum;
}PMInfoBlock;

#pragma pack()
static PMInfoBlock * getPMInfo(void);
static void installGDT(unsigned short nr,unsigned long base,unsigned long limit,char g,char d,char p,char dpl,char s,char type);
static unsigned long _int10(unsigned long ax,unsigned long bx,unsigned long cx,unsigned long dx,unsigned long si,unsigned long di);
static void drawPixel(int mode,int x,int y,unsigned short color);
static void drawLine(int x1,int y1,int x2,int y2,unsigned short color);
static void drawX(int x1,int x2,int y1,int y2,int color);
static void drawCircle(int xc, int yc, int r, int fill, long c) ;
//static void setPaletts(BMPRGB *color);

#define M640x400x8      0x0100
#define M640x480x8      0x0101
#define M800x600x4      0x0102
#define M800x600x8      0x0103
#define M1024x768x4     0x0104
#define M1024x768x8     0x0105
#define M1280x1024x4    0x0106
#define M1280x1024x8    0x0107
#define M320x200x32k    0x010D
#define M320x200x16     0x010E
#define M320x200x24     0x010F
#define M640x480x32K    0x0110
#define M640x480x16     0x0111
#define M640x480x24     0x0112
#define M800x600x32K    0x0113
#define M800x600x16     0x0114
#define M800x600x24     0x0115
#define M1024x768x32K   0x0116
#define M1024x768x16    0x0117
#define M1024x768x24    0x0118

#define int10(ax,bx,cx,dx,si,di) ((unsigned long (*)())0x1000)(ax,bx,cx,dx,si,di)
#define selectMode(mode)        int10(0x4f02,mode,0,0,0,0)
#define selectPlane(page)       ({\
        int10(0x4f05,0,0,page,0,0);\
        int10(0x4f05,1,0,page,0,0);\
        })

static unsigned short entry = 0;
static unsigned short volatile page = 0;
int main(void){
    PMInfoBlock *pm = NULL;
    installGDT(0xa000 >> 3,0xa0000,0xffff,0,0,1,0,1,2);
    installGDT(0xb000 >> 3,0xb0000,0xffff,0,0,1,0,1,2);
    memcpy(VGABASE,(void*)(0xc0000),VGALIMIT);
    pm = getPMInfo();
    pm->biosDataSel = 0x10;
    entry = pm->entryPoint;

#if 0
    if(pm){
        printf("PMID        : <%p> %c%c%c%c\n",pm,pm->signature[0],pm->signature[1],pm->signature[2],pm->signature[3]);
        printf("entryPoint  : %x\n",pm->entryPoint);
        printf("PMInit      : %x\n",pm->PMInit);
        printf("biosDataSel : %x\n",pm->biosDataSel);
        printf("aSel        : %x\n",pm->aSel);
        printf("b8Sel       : %x\n",pm->b8Sel);
        printf("cSel        : %x\n",pm->cSel);
        printf("inProteMode : %d\n",pm->inProteMode);
    }
#endif

#if 0
    printf("Type    : %hx\n",bmp->header.bfType);
    printf("Size    : %x\n",bmp->header.bfSize);
    printf("Offset  : %x\n",bmp->header.bfOffset);
    printf("Width   : %x\n",bmp->info.biWidth);
    printf("Height  : %x\n",bmp->info.biHeight);
    printf("BitCount: %hx\n",bmp->info.biBitCount);
    getchar();
#endif
    memcpy((void*)0x1000,(void*)_int10,0x100);
    selectMode(M640x480x8);
    drawX(0,640,0,480,33);
    drawX(40,600,40,440,60);
    drawX(40,600,40,60,150);
    drawX(60,580,60,420,200);
    drawCircle(320,240,140,1,170);
    drawX(0,640,460,480,43);
    drawCircle(20,470,10,1,40);
    drawX(600,640,460,480,60);
    while(1);
    return 0;
}

static void drawX(int x1,int x2,int y1,int y2,int color){
    for(int i = y1;i < y2;i++){
        drawLine(x1,i,x2,i,color);
    }
}

static inline void drawCircle8(int xc, int yc, int x, int y,long c) {
    // 参数 c 为颜色值
    drawPixel(0, xc + x, yc + y, c);
    drawPixel(0, xc - x, yc + y, c);
    drawPixel(0, xc + x, yc - y, c);
    drawPixel(0, xc - x, yc - y, c);
    drawPixel(0, xc + y, yc + x, c);
    drawPixel(0, xc - y, yc + x, c);
    drawPixel(0, xc + y, yc - x, c);
    drawPixel(0, xc - y, yc - x, c);
}
 
//Bresenham's circle algorithm
static void drawCircle(int xc, int yc, int r, int fill, long c) {
    int x = 0, y = r, yi, d;
    d = 3 - 2 * r;

    if (fill) {
        while (x <= y) {
            for (yi = x; yi <= y; yi ++)
                drawCircle8(xc, yc, x, yi, c);
            if (d < 0) {
                d = d + 4 * x + 6;
            } else {
                d = d + 4 * (x - y) + 10;
                y --;
            }
            x++;
        }
    } else {
        while (x <= y) {
            drawCircle8(xc, yc, x, y, c);
            if (d < 0) {
                d = d + 4 * x + 6;
            } else {
                d = d + 4 * (x - y) + 10;
                y --;
            }
            x ++;
        }
    }
}

static void drawPixel(int mode,int x,int y,unsigned short color){
    unsigned int pos = y * 640 + x;
    unsigned short _page = pos >> 16;
    /*! FIXME : 暂时将就下吧, !*/
    if(_page != page){
        page = _page;
        selectPlane(page << 2);
    }
    ((unsigned char *)0xa0000)[pos & 0xffff] = color;
}

#define SWAP(a,b) { a ^= b; b ^= a; a ^= b; }
#define ABS(x)  ((x) >= 0 ? (x) : -(x))
static void drawLine(int x1,int y1,int x2,int y2,unsigned short color){
    int dx = ABS(x2 - x1);
    int dy = ABS(y2 - y1);
    int yx = 0;

    if( dx < dy){
        SWAP(x1,y1);
        SWAP(x2,y2);
        SWAP(dx,dy);
        yx = 1;
    }
    int ix = (x2 - x1) > 0 ? 1 : -1;
    int iy = (y2 - y1) > 0 ? 1 : -1;
    int n2dy = dy << 1;
    int n2dydx = (dy - dx) << 1;
    int d = (dy << 1) - dx;
    if(yx){
        for(int cx = x1,cy = y1;cx != x2;cx += ix){
            if(d < 0){
                d += n2dy;
            }else{
                cy += iy;
                d += n2dydx;
            }
            drawPixel(0,cy,cx,color);
        }
    }else{
        for(int cx = x1,cy = y1;cx != x2;cx += ix){
            if(d < 0){
                d += n2dy;
            }else{
                cy += iy;
                d += n2dydx;
            }
            drawPixel(0,cx,cy,color);
        }
    }
}


static PMInfoBlock * getPMInfo(void){
    void * pm = VGABASE;
    for(int i = 0;i < VGALIMIT;i++){
        if(!strncmp(pm + i,"PMID",4)){
            return pm + i;
        }
    }
    return NULL;
}

static void installGDT(unsigned short nr,unsigned long base,unsigned long limit,char g,char d,char p,char dpl,char s,char type){
    struct{
        long  limitL:16;
        long  baseL:16;
        long  baseM:8;
        long  type:4;
        long  s:1;
        long  dpl:2;
        long  p:1;
        long  limitH:4;
        long  avl:1;
long  :1;
       long  d:1;
       long  g:1;
       long  baseH:8;
    }* const GDT = (void*)GDT_TABLE;
    GDT[nr].baseL = base & 0xffff;
    GDT[nr].baseM = (base >> 16) & 0xff;
    GDT[nr].baseH = (base >> 24) & 0xff;
    GDT[nr].limitL = (limit) & 0xffff;
    GDT[nr].limitH = (limit >> 16) & 0xf;
    GDT[nr].g = g;
    GDT[nr].d = d;
    GDT[nr].p = p;
    GDT[nr].dpl = dpl;
    GDT[nr].s = s;
    GDT[nr].type = type;
}

static unsigned long _int10(unsigned long ax,unsigned long bx,unsigned long cx,unsigned long dx,unsigned long si,unsigned long di){
    __asm__(
            "shll $16,%%eax\n\t"
            "movw $0x30,%%ax\n\t"
            "cli\n\t"
            "movw %%ax,%%ds\n\t"
            "movw %%ax,%%es\n\t"
            "movw %%ax,%%ss\n\t"
            "shrl $16,%%eax\n\t"
            "ljmp $0x28,$(0f - _int10 + 0x1000)\n\t"
            ".code16;0:call $0x28,$0x8702\n\t"
            ".code32;.byte 0x66\n\t"
            "ljmp $0x08,$(0f - _int10 + 0x1000)\n\t"
            "0:shll $16,%%eax\n\t"
            "movl $0x10,%%eax\n\t"
            "movl %%eax,%%ss\n\t"
            "movl %%eax,%%ds\n\t"
            "movl %%eax,%%es\n\t"
            "shrl $16,%%eax\n\t"
            "sti\n\t"
            :
            :"a"(ax),"b"(bx),"c"(cx),"d"(dx),"S"(si),"D"(di)
            );
    return ax;
}

#if 0
static void setPaletts(BMPRGB *color){
    outb(0xffff,0x3c6);
    for(int i = 0;i < 256;i++){
        outb(i,0x3c8);
        outb(color[i].red >> 2,0x3c9);
        outb(color[i].green >> 2,0x3c9);
        outb(color[i].blue >> 2,0x3c9);
    }
}
#endif
