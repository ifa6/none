#include    <stdio.h>
#include    <string.h>
#include    <x86/io.h>
#include    <sys/inter.h>
#define     edprint(fmt,...) printf("\er%4d : \ew"fmt"\n",__LINE__,##__VA_ARGS__)
#include    <none/const.h>
#include    <z.h>

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
//static void setPaletts(BMPRGB *color);
static inline void lifeLoop(void);

#define LIFE_X  640
#define LIFE_Y  480

#define LEFT(x)  ((x) ?: LIFE_X)
#define RIGHT(x) ((x) == LIFE_X ? 0 : (x))
#define UP(y)    ((y) ?: LIFE_Y)
#define DOWN(y)  ((y) == LIFE_Y ? 0 : (y))

typedef struct{
    enum{DEATH,LIVEING}s;
    int nl;
}Life;
static Life map[LIFE_Y][LIFE_X] = {[0][0] = {DEATH,0}};

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

static void lifeOnc(int x,int y){
    const int left = LEFT(x - 1),right = RIGHT(x + 1);
    const int up = UP(y - 1),down = DOWN(y + 1);
    const int speed = (map[x][y].s == DEATH) ? -1 : 1;
    map[left][up].nl       += speed;
    map[left][y].nl        += speed;
    map[left][down].nl     += speed;
    map[x][up].nl          += speed;
    map[x][down].nl        += speed;
    map[right][up].nl      += speed;
    map[right][y].nl       += speed;
    map[right][down].nl    += speed;
}

#define thiz    map[y][x]
static void inline telkLife(int x,int y){
    unsigned short color = 0xce;
    if(thiz.s == DEATH)
        drawPixel(0,x,y,color);
    else
        drawPixel(0,x,y,0xDE);
    drawPixel(0,x,y,0xDE);
}
static void inline godLife(int x,int y){
    if(thiz.s == DEATH && thiz.nl == 3){
        thiz.s = LIVEING;
    } else {
        if(thiz.nl < 2 || thiz.nl > 3)
            thiz.s = DEATH;
    }
}

#undef  thiz


#define foreach_life(expr)  \
    foreach(y,0,LIFE_Y){\
        foreach(x,0,LIFE_X){\
            expr;\
        }\
    }


static inline void lifeLoop(void){
    //memset(map,0,640 * 480 *sizeof(Life));
    //foreach_life(map[i][j].s = (((char*)0x100000)[i * j] & 1));
    while(1){
        foreach_life(telkLife(x,y));
        //foreach_life(lifeOnc(x,y));
        //foreach_life(godLife(x,y));
    }
    foreach_life(lifeOnc(x,y));
    foreach_life(godLife(x,y));
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


static void drawPixel(int mode,int x,int y,unsigned short color){
    unused(mode);
    unsigned int pos = y * 640 + x;
    unsigned short _page = pos >> 16;
    /*! FIXME : 暂时将就下吧, !*/
    if(_page != page){
        page = _page;
        selectPlane(page << 2);
    }
    ((unsigned char *)0xa0000)[pos & 0xffff] = color;
}

int main(void){
    PMInfoBlock *pm = NULL;
    installGDT(0xa000 >> 3,0xa0000,0xffff,0,0,1,0,1,2);
    installGDT(0xb000 >> 3,0xb0000,0xffff,0,0,1,0,1,2);
    memcpy(VGABASE,(void*)(0xc0000),VGALIMIT);
    pm = getPMInfo();
    pm->biosDataSel = 0x10;
    entry = pm->entryPoint;

    memcpy((void*)0x1000,(void*)_int10,0x100);
    selectMode(M640x480x8);
    lifeLoop();
    while(1);
    return 0;
}
