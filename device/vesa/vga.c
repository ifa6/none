#include <stdio.h>
#include <string.h>
#include <x86/io.h>
#include <none/object.h>
#include <sys/inter.h>

#include "vga.h"
#include "vgatables.h"
#include "vbe.h"

static inline void memsetw(uint16_t *addr,uint16_t value,size_t count){
    for(size_t i = 0; i < count;i++){
        addr[i] = value;
    }
}
#define memsetw(seg,addr,v,count)   memsetw((void *)(seg << 4 | addr),v,count << 1)
#define SCREEN_IO_START(x,y,p) ((((x * y) | 0x00ff) + 1) * p)
#define SCREEN_MEM_START(x,y,p) ((((x * y * 2) | 0x00ff) + 1) * p)

/* thank vgabios */
static inline void init_vga_card(void){
    __asm__(
            /* switch to color mode and enable CPU access 480 lines */
            "mov  $0x3c2,%dx\n\t"
            "mov  $0xc3,%al\n\t"
            "outb %al,%dx\n\t"

            /* more than 3c4/04 */
            "mov  $0x3c4,%dx\n\t"
            "mov  $0x04,%al\n\t"
            "outb %al,%dx\n\t"
            "mov  $0x3c5,%dx\n\t"
            "mov  $0x02,%al\n\t"
            "outb %al,%dx\n\t"
           );
}

static inline void init_bios_area(void){
    uint16_t word;

    /* init detected hardware BIOS Are */
    word = read_byte(BIOSMEM_INITIAL_MODE);
    word &= 0xffcf;
    word |= 0x0020;

    /* Just for the first int10 find its children */
    write_byte(BIOSMEM_CHAR_HEIGHT,0x10);

    /* Clear the screen */
    write_byte(BIOSMEM_VIDEO_CTL,0x60);

    /* Set the basic screen we have */
    write_byte(BIOSMEM_SWITCHES,0xf9);

    /* Set the basic modeset options */
    write_byte(BIOSMEM_MODESET_CTL,0x51);

    /* Set the default MSR */
    write_byte(BIOSMEM_CURRENT_MSR,0x09);
}

static uint8_t find_vga_entry(uint8_t mode) {
    for(uint8_t i = 0; i <= MODE_MAX;i++){
        if(vga_modes[i].svgamode == mode)
            return i;
    }
    return 0xff;
}

static void biosfn_perform_gray_scale_summing(uint16_t start,uint16_t count){
    uint8_t r,g,b;
    uint16_t i;

    inb(VGAREG_ACTL_RESET);
    outb(0x00,VGAREG_ACTL_ADDRESS);

    for(uint16_t index = 0; index < count; index++ ) {
        // set read address and switch to read mode
        outb(start,VGAREG_DAC_READ_ADDRESS);
        // get 6-bit wide RGB data values
        r=inb( VGAREG_DAC_DATA );
        g=inb( VGAREG_DAC_DATA );
        b=inb( VGAREG_DAC_DATA );

        // intensity = ( 0.3 * Red ) + ( 0.59 * Green ) + ( 0.11 * Blue )
        i = ( ( 77*r + 151*g + 28*b ) + 0x80 ) >> 8;

        if(i > 0x3f)
            i = 0x3f;

        // set write address and switch to write mode
        outb(start,VGAREG_DAC_WRITE_ADDRESS);
        // write new intensity value
        outb(  i & 0xff ,VGAREG_DAC_DATA);
        outb(  i & 0xff ,VGAREG_DAC_DATA);
        outb(  i & 0xff ,VGAREG_DAC_DATA);
        start++;
    }  
    inb(VGAREG_ACTL_RESET);
    outb(0x20,VGAREG_ACTL_ADDRESS);
} 

static void biosfn_set_cursor_shape (uint16_t CH,uint16_t CL) {
    uint16_t cheight,curs,crtc_addr;
    uint8_t modeset_ctl;

    CH &= 0x3f;
    CL &= 0x1f;

    curs = (CH << 8) + CL;
    write_word(BIOSMEM_CURSOR_TYPE,curs);

    modeset_ctl=read_byte(BIOSMEM_MODESET_CTL);
    cheight = read_word(BIOSMEM_CHAR_HEIGHT);
    if((modeset_ctl&0x01) && (cheight>8) && (CL<8) && (CH<0x20)) {
        if(CL!=(CH+1)) {
            CH = ((CH+1) * cheight / 8) -1;
        } else {
            CH = ((CL+1) * cheight / 8) - 2;
        }
        CL = ((CL+1) * cheight / 8) - 1;
    }

    // CTRC regs 0x0a and 0x0b
    crtc_addr=read_word(BIOSMEM_CRTC_ADDRESS);
    outb(0x0a,crtc_addr);
    outb(CH,crtc_addr+1);
    outb(0x0b,crtc_addr);
    outb(CL,crtc_addr+1);
}
static void biosfn_get_cursor_pos (uint8_t page,uint16_t *shape, uint16_t *pos) {

    if(page>7)
        return;
    // FIXME should handle VGA 14/16 lines
    * shape = read_word(BIOSMEM_CURSOR_TYPE);
    * pos = read_word(BIOSMEM_CURSOR_POS + page * 2);
}

static void biosfn_set_cursor_pos (uint8_t page,uint16_t  cursor) {
    uint8_t xcurs,ycurs,current;
    uint16_t nbcols,nbrows,address,crtc_addr;

    // Should not happen...
    if(page > 7)
        return;

    // Bios cursor pos
    write_word( BIOSMEM_CURSOR_POS + 2 * page, cursor);

    // Set the hardware cursor
    current = read_byte(BIOSMEM_CURRENT_PAGE);
    if(page == current) {
        // Get the dimensions
        nbcols = read_word(BIOSMEM_NB_COLS);
        nbrows = read_byte(BIOSMEM_NB_ROWS)+1;

        xcurs = cursor&0x00ff;ycurs=(cursor&0xff00)>>8;

        // Calculate the address knowing nbcols nbrows and page num
        address = SCREEN_IO_START(nbcols,nbrows,page)+xcurs+ycurs*nbcols;

        // CRTC regs 0x0e and 0x0f
        crtc_addr = read_word(BIOSMEM_CRTC_ADDRESS);
        outb(0x0e,crtc_addr);
        outb((address & 0xff00 >> 8),crtc_addr+1);
        outb(0x0f,crtc_addr);
        outb(address&0x00ff,crtc_addr+1);
    }
}

static void biosfn_set_active_page (uint8_t page) {
    uint16_t cursor,dummy,crtc_addr;
    uint16_t nbcols,nbrows,address;
    uint8_t mode,line;

    if(page > 7)
        return;

    // Get the mode
    mode = read_byte(BIOSMEM_CURRENT_MODE);
    line = find_vga_entry(mode);
    if(line == 0xFF)
        return;

    // Get pos curs pos for the right page 
    biosfn_get_cursor_pos(page,&dummy,&cursor);

    if(vga_modes[line].class == TEXT) {
        // Get the dimensions
        nbcols = read_word(BIOSMEM_NB_COLS);
        nbrows = read_byte(BIOSMEM_NB_ROWS)+1;

        // Calculate the address knowing nbcols nbrows and page num
        address = SCREEN_MEM_START(nbcols,nbrows,page);
        write_word(BIOSMEM_CURRENT_START,address);

        // Start address
        address = SCREEN_IO_START(nbcols,nbrows,page);
    } else {
        address = page * (*(uint16_t *)&video_param_table[line_to_vpti[line]].slength_l);
    }

    // CRTC regs 0x0c and 0x0d
    crtc_addr = read_word(BIOSMEM_CRTC_ADDRESS);
    outb(0x0c,crtc_addr);
    outb((address & 0xff00 >> 8),crtc_addr+1);
    outb(0x0d,crtc_addr);
    outb(address&0x00ff,crtc_addr+1);

    // And change the BIOS page
    write_byte(BIOSMEM_CURRENT_PAGE,page);

#ifdef DEBUG
    printf("Set active page %02x address %04x\n",page,address);
#endif

    // Display the cursor, now the page is active
    biosfn_set_cursor_pos(page,cursor);
}

void load_dac_palette(uint8_t num) {
  uint8_t (*palette)[3];
  uint16_t i;

  // Set the whole dac always, from 0
  outb(0x00,VGAREG_DAC_WRITE_ADDRESS);

  // From which palette
  switch (num) {
    case 0:
      palette = palette0;
      break;
    case 1:
      palette = palette1;
      break;
    case 2:
      palette = palette2;
      break;
    case 3:
      palette = palette3;
      break;
  }
  // Always 256*3 values
  for (i = 0;i < 0x0100;i++) {
      if(i <= dac_regs[num]) {
          outb(palette[i][0],VGAREG_DAC_DATA);
          outb(palette[i][1],VGAREG_DAC_DATA);
          outb(palette[i][2],VGAREG_DAC_DATA);
      } else {
          outb(0,VGAREG_DAC_DATA);
          outb(0,VGAREG_DAC_DATA);
          outb(0,VGAREG_DAC_DATA);
      }
  }
}

#if 0
static inline void SET_INT_VERCTOR(uint8_t vert,uint16_t seg,uint32_t offset){
    *((uint16_t *)(vert << 2)) = seg;
    *(((uint16_t *)(vert << 2) + 1)) = offset;
}
#endif

void biosfn_set_video_mode(uint8_t mode){
    uint8_t noclearmem = mode & 0x80;
    uint8_t line,mmask,vpti;
    uint16_t twidth,theight1,cheight;
    uint8_t modeset_ctl;//,video_ctl,vga_switches;
    uint16_t crtc_addr;

    mode = mode & 0x7f;

    line = find_vga_entry(mode);
    if(line == 0xff)
        return;

    vpti = line_to_vpti[line];
    twidth = video_param_table[vpti].twidth;
    theight1 = video_param_table[vpti].theightm1;
    cheight = video_param_table[vpti].cheight;

    /* read the bios vga control */
    //video_ctl = read_byte(BIOSMEM_VIDEO_CTL);
    //vga_switches = read_byte(BIOSMEM_SWITCHES);
    modeset_ctl = read_byte(BIOSMEM_MODESET_CTL);

    if((modeset_ctl & 0x08) == 0){
        outb(vga_modes[line].pelmask,VGAREG_PEL_MASK);
        load_dac_palette(vga_modes[line].dacmodel);
        (void)(load_dac_palette);
        if((modeset_ctl & 0x02) == 0x02){
            biosfn_perform_gray_scale_summing(0x00,0x100);
        }
    }

    inb(VGAREG_ACTL_RESET);

    for(uint16_t i = 0;i <= 0x13;i++){
        outb(i,VGAREG_ACTL_ADDRESS);
        outb(video_param_table[vpti].actl_regs[i],VGAREG_ACTL_WRITE_DATA);
    }

    outb(0x14,VGAREG_ACTL_ADDRESS);
    outb(0x00,VGAREG_ACTL_WRITE_DATA);

    outb(0,VGAREG_SEQU_ADDRESS);
    outb(0x03,VGAREG_SEQU_DATA);

    for(uint16_t i = 1;i <= 4;i++) {
        outb(i,VGAREG_SEQU_ADDRESS);
        outb(video_param_table[vpti].sequ_regs[i - 1],VGAREG_SEQU_DATA);
    }

    // Set Grafx Ctl
    for(uint16_t i = 0;i <= 8;i++) {
        outb(i,VGAREG_GRDC_ADDRESS);
        outb(video_param_table[vpti].grdc_regs[i],VGAREG_GRDC_DATA);
    }

    // Set CRTC address VGA or MDA 
    crtc_addr=vga_modes[line].memmodel==MTEXT?VGAREG_MDA_CRTC_ADDRESS:VGAREG_VGA_CRTC_ADDRESS;

    // Disable CRTC write protection
    outw(0x0011,crtc_addr);
    // Set CRTC regs
    for(uint16_t i = 0;i <= 0x18;i++) {
        outb(i,crtc_addr);
        outb(video_param_table[vpti].crtc_regs[i],crtc_addr+1);
    }

    // Set the misc register
    outb(video_param_table[vpti].miscreg,VGAREG_WRITE_MISC_OUTPUT);

    // Enable video
    outb(0x20,VGAREG_ACTL_ADDRESS);
    inb(VGAREG_ACTL_RESET);

    if(noclearmem == 0x00) {
        if(vga_modes[line].class == TEXT) {
            memsetw(vga_modes[line].sstart,0,0x0720,0x4000); // 32k
        } else {
            if(mode < 0x0d) {
                memsetw(vga_modes[line].sstart,0,0x0000,0x4000); // 32k
            } else {
                outb(  0x02 ,VGAREG_SEQU_ADDRESS);
                mmask = inb( VGAREG_SEQU_DATA );
                outb(  0x0f ,VGAREG_SEQU_DATA); // all planes
                memsetw(vga_modes[line].sstart,0,0x0000,0x8000); // 64k
                outb(  mmask ,VGAREG_SEQU_DATA);
            }
        }
    }

    // Set the BIOS mem
    write_byte(BIOSMEM_CURRENT_MODE,mode);
    write_word(BIOSMEM_NB_COLS,twidth);
    write_word(BIOSMEM_PAGE_SIZE,*(uint16_t *)&video_param_table[vpti].slength_l);
    write_word(BIOSMEM_CRTC_ADDRESS,crtc_addr);
    write_byte(BIOSMEM_NB_ROWS,theight1);
    write_word(BIOSMEM_CHAR_HEIGHT,cheight);
    write_byte(BIOSMEM_VIDEO_CTL,(0x60|noclearmem));
    write_byte(BIOSMEM_SWITCHES,0xF9);
    write_byte(BIOSMEM_MODESET_CTL,read_byte(BIOSMEM_MODESET_CTL)&0x7f);

    // FIXME We nearly have the good tables. to be reworked
    write_byte(BIOSMEM_DCC_INDEX,0x08);    // 8 is VGA should be ok for now
#if 0
    write_word(BIOSMEM_VS_POINTER, video_save_pointer_table);
    write_word(BIOSMEM_VS_POINTER+2, 0xc000);
#endif

    // FIXME
    write_byte(BIOSMEM_CURRENT_MSR,0x00); // Unavailable on vanilla vga, but...
    write_byte(BIOSMEM_CURRENT_PAL,0x00); // Unavailable on vanilla vga, but...

    // Set cursor shape
    if(vga_modes[line].class == TEXT) {
        biosfn_set_cursor_shape(0x06,0x07);
    }

    // Set cursor pos for page 0..7
    for(uint16_t i = 0;i < 8;i++)
        biosfn_set_cursor_pos(i,0x0000);

    // Set active page 0
    biosfn_set_active_page(0x00);

    // copy and activate 8x16 font
    //outw();
    outw(0x0003,VGAREG_SEQU_ADDRESS);

#if 0
    SET_INT_VERCTOR(0x1f,0xc000,vgafont8 + 128 * 8);
    switch(cheight){
    case 8:
        SET_INT_VERCTOR(0x43,0xc000,vgafont8);
        break;
    case 14:
        SET_INT_VERCTOR(0x43,0xc000,vgafont14);
        break;
    case 16:
        SET_INT_VERCTOR(0x43,0xc000,vgafont16);
        break;
    }
#endif
}

static void vga_read(Object *thiz){
    ret(thiz->admit,OK);
}

static void vga_write(Object *thiz){
    ret(thiz->admit,OK);
}

static void init(void){
    init_vga_card();
    init_bios_area();
    vbe_init();
    hook(WRITE,vga_write);
    hook(READ,vga_read);
}

int main(void){
    init();
    dorun();
    return 0;
}
