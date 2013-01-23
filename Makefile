# Makefile for install.
# Install ask root.
.PHONY:go all clear install 

# Directories.
# root directories
r = $(PWD)
d = a.img
m = mnt
s = kernel/none

SUBDIRS = lib  kernel 

MAKE = make
RM = rm

all:
	for dir in  $(SUBDIRS);do\
		$(MAKE) -C $$dir  r=$r || exit 1;\
	done

clear:
	for dir in  $(SUBDIRS);do\
		$(MAKE) -C $$dir clear || exit 1;\
	done

debug:
	objdump -d $r/kernel/none > t.src

install go:
	mount -o loop -t ext2 $d $m
	cp $s $m
	sleep 1
	umount $m
	bochs
