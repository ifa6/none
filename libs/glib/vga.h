#ifndef __NONE_VGA_H__
#define __NONE_VGA_H__

#include <stdint.h>

#define BIOSMEM_SEG 0x40

#define BIOSMEM_INITIAL_MODE  0x410
#define BIOSMEM_CURRENT_MODE  0x449
#define BIOSMEM_NB_COLS       0x44A
#define BIOSMEM_PAGE_SIZE     0x44C
#define BIOSMEM_CURRENT_START 0x44E
#define BIOSMEM_CURSOR_POS    0x450
#define BIOSMEM_CURSOR_TYPE   0x460
#define BIOSMEM_CURRENT_PAGE  0x462
#define BIOSMEM_CRTC_ADDRESS  0x463
#define BIOSMEM_CURRENT_MSR   0x465
#define BIOSMEM_CURRENT_PAL   0x466
#define BIOSMEM_NB_ROWS       0x484
#define BIOSMEM_CHAR_HEIGHT   0x485
#define BIOSMEM_VIDEO_CTL     0x487
#define BIOSMEM_SWITCHES      0x488
#define BIOSMEM_MODESET_CTL   0x489
#define BIOSMEM_DCC_INDEX     0x48A
#define BIOSMEM_VS_POINTER    0x4A8
#define BIOSMEM_VBE_FLAG      0x4B9
#define BIOSMEM_VBE_MODE      0x4BA



#define read_byte(addr)         *((uint8_t *)(addr))
#define write_byte(addr,value)  *((uint8_t *)(addr)) = (value)
#define read_word(addr)         *((uint16_t *)(addr))
#define write_word(addr,value)  *((uint16_t *)(addr)) = (value)
/*
 *
 * VGA registers
 *
 */
#define VGAREG_ACTL_ADDRESS            0x3c0
#define VGAREG_ACTL_WRITE_DATA         0x3c0
#define VGAREG_ACTL_READ_DATA          0x3c1

#define VGAREG_INPUT_STATUS            0x3c2
#define VGAREG_WRITE_MISC_OUTPUT       0x3c2
#define VGAREG_VIDEO_ENABLE            0x3c3
#define VGAREG_SEQU_ADDRESS            0x3c4
#define VGAREG_SEQU_DATA               0x3c5

#define VGAREG_PEL_MASK                0x3c6
#define VGAREG_DAC_STATE               0x3c7
#define VGAREG_DAC_READ_ADDRESS        0x3c7
#define VGAREG_DAC_WRITE_ADDRESS       0x3c8
#define VGAREG_DAC_DATA                0x3c9

#define VGAREG_READ_FEATURE_CTL        0x3ca
#define VGAREG_READ_MISC_OUTPUT        0x3cc

#define VGAREG_GRDC_ADDRESS            0x3ce
#define VGAREG_GRDC_DATA               0x3cf

#define VGAREG_MDA_CRTC_ADDRESS        0x3b4
#define VGAREG_MDA_CRTC_DATA           0x3b5
#define VGAREG_VGA_CRTC_ADDRESS        0x3d4
#define VGAREG_VGA_CRTC_DATA           0x3d5

#define VGAREG_MDA_WRITE_FEATURE_CTL   0x3ba
#define VGAREG_VGA_WRITE_FEATURE_CTL   0x3da
#define VGAREG_ACTL_RESET              0x3da

#define VGAREG_MDA_MODECTL             0x3b8
#define VGAREG_CGA_MODECTL             0x3d8
#define VGAREG_CGA_PALETTE             0x3d9

/* Video memory */
#define VGAMEM_GRAPH 0xA000
#define VGAMEM_CTEXT 0xB800
#define VGAMEM_MTEXT 0xB000

void load_dac_palette(uint8_t num) ;
void biosfn_set_video_mode(uint8_t mode);

#endif
