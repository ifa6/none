#ifndef __VGA_H__
#define __VGA_H__
#include    <x86/io.h>

/* VGA register port */

#define VGA_ADDR    0x03d4      /* vga address port */
#define VGA_DATA    0x03d5      /* vga data port */
#define VGA_MODE    0x03d8      /* select vga model */
#define VGA_PALLET  0x03d9      /* vga pallet */ 
#define VGA_STATE   0x03da      /* vga display state register */
#define VGA_RESET_LP    0x03db  /* reset light pen */
#define VGA_SET_LP  0x03dc      /*  */

#define START_ADDR_H    0x0c   /* reg index of video memory start addr High*/
#define START_ADDR_L    0x0d   /* reg index of video memory start addr Low */
#define CURSOR_H        0x0e   /* reg index of cursor position Hight */
#define CURSOR_L        0x0f   /* reg index of cursor position Low */

/* CGA model console register*/


/* mc6845 data register */

/* write\read mc6845 register */

#define mc6845_read(port) ({\
        unsigned char _d = 0; \
        outb_p((port),VGA_ADDR);    \
        _d = inb_p(VGA_DATA);    \
        _d; \
    })

#define mc6845_write(data,port) ({\
        outb_p((port),VGA_ADDR);    \
        outb_p((data),VGA_DATA);    \
    })


#endif
