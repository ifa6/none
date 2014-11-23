#ifndef __NONE_GRAPHICS_H__
#define __NONE_GRAPHICS_H__
#include <stdint.h>

typedef union {
    uint8_t c256;
    struct { uint8_t b,g,r; }c16m;
    struct { uint16_t r:5,g:6,b:5; }c16b;
    struct { uint16_t r:5,g:5,b:5,u:1; }c15b;
}color_t;

typedef struct { int x,y; }pixel_t;
typedef struct graphics_t graphics_t;

struct graphics_t{
    pixel_t cur_pixel;
    color_t color;
    uint16_t height,width;

    /* virtual function */
    uint16_t (*enable)(void);
    void (*clear)(void);
    void (*setcolor)(graphics_t *thiz,color_t color);
    void (*pixel)(graphics_t *thiz,int x,int y);
    void (*scanline)(int x1,int x2,int y);

    /* genices function */
    void (*moveto)(graphics_t *thiz,int x,int y);
    void (*text)(graphics_t *thiz,int x,int y,const char *text);
    void (*line)(graphics_t *thiz,int x1,int y1,int x2,int y2);
    void (*linerel)(graphics_t *thiz,int dx,int dy);
    void (*lineto)(graphics_t *thiz,int dx,int dy);
    void (*circle)(graphics_t *thiz,int xc,int yc,int r,int fill);
    void (*ellipse)(graphics_t *thiz,int x,int y,int stangle,int endangle,int xradius,int yradius);
    void (*poly)(graphics_t *thiz,int n,pixel_t *border);
    void (*rectangle)(graphics_t *thiz,int x1,int y1,int x2,int y2);
};

extern graphics_t *newM800x600x888(void);
extern graphics_t *newGraphics();
extern void glib_init(void);

#endif
