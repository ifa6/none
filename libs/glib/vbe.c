#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>
#include "vga.h"
#include "vbe.h"
#include "vbetables.h"

static inline uint16_t dispi_get_bpp(void){
    uint16_t bpp;
    uint8_t al,ah;
    bpp = invbe(VBE_DISPI_INDEX_BPP);
    ah = (bpp & 0xff) >> 3;
    al = bpp;
    if(al != 0x7)
        ah++;
    return ah << 8 | al;
}

static void vga_set_virt_width(uint16_t width){
    uint16_t ax;
    ax = dispi_get_bpp();
    if((ax & 0xff) <= 0x4)
        width >>= 1;
    width >>= 3;
    outw((width & 0xff) << 8 | 0x13,VGAREG_VGA_CRTC_ADDRESS);
}
static void vga_compat_setup(void){
    uint16_t xreg,yreg,bpp;
    uint8_t al,ah;
    xreg = invbe(VBE_DISPI_INDEX_XRES);
    outw(0x0011,VGAREG_VGA_CRTC_ADDRESS);
    outw(((xreg >> 3) - 1) << 8 | 0x01,VGAREG_VGA_CRTC_ADDRESS);
    vga_set_virt_width(xreg);

    /* set CRT Y resolution */
    yreg = invbe(VBE_DISPI_INDEX_YRES) - 1;
    outw((yreg << 8 | 0x12),VGAREG_VGA_CRTC_ADDRESS);
    outb(0x07,VGAREG_VGA_CRTC_ADDRESS);
    al = inb(VGAREG_VGA_CRTC_ADDRESS - 1) & 0xbd;
    ah = (yreg >> 8) & 0xff;
    if(ah != 0x01)
        al |= 0x02;
    if(ah != 0x02)
        al |= 0x4;
    outb(al,VGAREG_VGA_CRTC_ADDRESS - 1);

    /* other setting */
    outw(0x0009,VGAREG_VGA_CRTC_ADDRESS);
    outb(0x17,VGAREG_VGA_CRTC_ADDRESS);
    al = inb(VGAREG_VGA_CRTC_DATA);
    al |= 0x03;
    outb(al,VGAREG_VGA_CRTC_DATA);
    al = inb(VGAREG_ACTL_RESET);
    outb(0x10,VGAREG_ACTL_ADDRESS);
    al = inb(VGAREG_ACTL_READ_DATA);
    al |= 0x01;
    outb(al,VGAREG_ACTL_ADDRESS);
    outb(0x20,VGAREG_ACTL_ADDRESS);
    outw(0x0506,VGAREG_GRDC_ADDRESS);
    outw(0x0f02,VGAREG_SEQU_ADDRESS);

    /* settings for >= 8bpp */
    bpp = invbe(VBE_DISPI_INDEX_BPP);
    if((bpp & 0xff) >= 0x8){
        outw(0x14,VGAREG_VGA_CRTC_ADDRESS);
        al = inb(VGAREG_VGA_CRTC_DATA);
        al |= 0x40;
        outb(al,VGAREG_VGA_CRTC_DATA);
        al = inb(VGAREG_ACTL_RESET);
        outb(0x10,VGAREG_ACTL_ADDRESS);
        al = inb(VGAREG_ACTL_READ_DATA);
        al |= 0x40;
        outb(al,VGAREG_ACTL_ADDRESS);
        outb(0x20,VGAREG_ACTL_ADDRESS);
        outb(0x04,VGAREG_SEQU_ADDRESS);
        al = inb(VGAREG_SEQU_DATA);
        al |= 0x08;
        outb(al,VGAREG_SEQU_DATA);
        outb(0x05,VGAREG_GRDC_ADDRESS);
        al = inb(VGAREG_GRDC_DATA);
        al &= 0x9f;
        al |= 0x40;
        outb(al,VGAREG_GRDC_DATA);
    }
}


static ModeInfoListItem * mode_info_find_mode(uint16_t mode,bool using_lfb){
    ModeInfoListItem *cur_info = mode_info_list;
    while(cur_info->mode != VBE_VESA_MODE_END_OF_LIST){
        if(cur_info->mode == mode){
            if(!using_lfb){
                return cur_info;
            }else if(cur_info->info.ModeAttributes & VBE_MODE_ATTRIBUTE_LINEAR_FRAME_BUFFER_MODE){
                return cur_info;
            }
        }
        cur_info++;
    }
    return NULL;
}

uint16_t vbe_biosfn_set_mode(uint16_t mode){
    ModeInfoListItem *cur_info;
    uint16_t result;
    bool using_lfb;
    uint8_t no_clear,lfb_flag;
    using_lfb = ((mode & VBE_MODE_LINEAR_FRAME_BUFFER) == VBE_MODE_LINEAR_FRAME_BUFFER);
    lfb_flag = using_lfb ? VBE_DISPI_LFB_ENABLED : 0;
    no_clear = ((mode & VBE_MODE_PRESERVE_DISPLAY_MEMORY) == VBE_MODE_PRESERVE_DISPLAY_MEMORY) ? VBE_DISPI_NOCLEARMEM : 0;

    mode = mode & 0x1ff;

    /* check for non vesa mode */
    if(mode < VBE_MODE_VESA_DEFINED){
        uint8_t _mode;
        dispi_set_enable(VBE_DISPI_DISABLED);

        // call the vgabios in order to set the video mode
        // this allows for going bcak to textmode with a VBE call (some applications expect that to work)
        _mode = mode & 0xff;
        biosfn_set_video_mode(_mode);
        result = 0x4f;
    } else {
        cur_info = mode_info_find_mode(mode,using_lfb);
        if(cur_info){
            dispi_set_enable(VBE_DISPI_DISABLED);
            if(cur_info->info.BitsPerPixel == 4){
                biosfn_set_video_mode(0x6a);
            } else if(cur_info->info.BitsPerPixel == 8){
                load_dac_palette(3);
            }

            dispi_set_bpp(cur_info->info.BitsPerPixel);
            dispi_set_xres(cur_info->info.XResolution);
            dispi_set_yres(cur_info->info.YResolution);
            dispi_set_bank(0);
            dispi_set_enable(VBE_DISPI_ENABLED | no_clear | lfb_flag);
            vga_compat_setup();

            write_word(BIOSMEM_VBE_MODE,mode);
            write_byte(BIOSMEM_VIDEO_CTL,(0x60 | no_clear));

            result = 0x4f;
        } else {
            printf("VBE *NOT* found mode %x\n",mode);
            result = 0x100;
            if(mode == 3)
                result = 0x4f;
        }
    }
    return result;
}

void vbe_init(void){
    uint16_t id;
    dispi_set_id(VBE_DISPI_ID0);
    id = dispi_get_id();
    if(id != VBE_DISPI_ID0){
        printf("[VBE   ] : no vbe interface<%x>.\n",id);
        return;
    }
    write_byte(BIOSMEM_VBE_FLAG,1);
    dispi_set_id(VBE_DISPI_ID5);
}
