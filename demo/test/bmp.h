#ifndef __BMP_H__
#define __BMP_H__

#pragma pack(1)
typedef struct{
   unsigned short   bfType;
   unsigned int     bfSize;
   unsigned short   bfReserved1;
   unsigned short   bfReserved2;
   unsigned int     bfOffset;
}BMPHeader;

typedef struct{
   unsigned int     biSize;
   unsigned int     biWidth;
   unsigned int     biHeight;
   unsigned short   biPlanes;
   unsigned short   biBitCount;
   unsigned int     biCompression;
   unsigned int     biSizeImage;
   unsigned int     biXpolsPerMeter;
   unsigned int     biYpelsPerMeter;
   unsigned int     biClrUsed;
   unsigned int     biClrImportant;
}BMPInfo;

typedef struct{
   unsigned char    blue;
   unsigned char    green;
   unsigned char    red;
   unsigned char    reserved;
}BMPRGB;

typedef struct{
    BMPHeader   header;
    BMPInfo     info;
    BMPRGB      rgb[0];
}BMPPicture;

#pragma pack()


#endif
