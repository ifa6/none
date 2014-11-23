#include "graphics.h"
#include "vbe.h"
#define video ((uint8_t *)0xa0000)
#define HEIGHT  600
#define WIDTH   800

static void pixel(graphics_t *thiz,int x,int y){
    unsigned long offset = 0;
    uint16_t bank;
    static volatile uint16_t cur_bank = 0;
    if(x < WIDTH && y < HEIGHT){
        offset = (y * 800 + x) * 3;
        bank = offset >> 16;
        offset = offset & 0xffff;
        if(bank != cur_bank){
            dispi_set_bank(bank);
            cur_bank = bank;
        }
        (video + offset)[0] = thiz->color.c16m.b;
        (video + offset)[1] = thiz->color.c16m.g;
        (video + offset)[2] = thiz->color.c16m.r;
    }
}

static uint16_t enable(void){
    return vbe_biosfn_set_mode(VBE_VESA_MODE_800X600X888);
}

static void clear(void){
    for(int i = 0;i < (HEIGHT * WIDTH) *3 / 0x10000;i++){
        dispi_set_bank(i);
        __asm__(
                "cld\n\t"
                "rep stosl\n\t"
                ::"D"(video),"c"(0x10000 >> 2),"a"(0)
               );
    }
    dispi_set_bank(0);
}

graphics_t *newM800x600x888(void){
    graphics_t *g;
    g = newGraphics();
    if(g){
        g->pixel = pixel;
        g->enable = enable;
        g->clear = clear;
        g->height = HEIGHT;
        g->width = WIDTH;
    }
    return g;
}
