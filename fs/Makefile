# Makefile for all
#
.PHONY:clear install make

# Directories
i = $r/include
vpath %.h $r/include/

# Programs, flags, etc.
AS = as
CC = gcc
LD = ld

ASFLAGS = --32
CFLAGS = -I $i -m32 -c -std=gnu99 -fno-stack-protector -Wall -nostdinc
LDFLAGS = -m elf_i386 -Ttext 0x300000

OBJS = fs.o super.o
# What to make.
#

fs.o:super.o inode.o block.o
%.o:%.S
	$(CC) $< -o $@ $(CFLAGS)

%.o:%.c
	$(CC) $< -o $@ $(CFLAGS) 

%.o:%.s
	$(AS) $< -o $@ $(ASFLAGS)


clear:
	-rm *.o -rf
