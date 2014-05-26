# Makefile for install.
# Install ask root.
#
.PHONY:go all clean 

# Directories.
# root directories
ROOT_DIR := $(PWD)
d 		:= a.img
ifeq ("$(RAMDISK)",1)
h 		:= ramdisk.img
else
h		:= n.hd
endif
s 		:= bin/none

boot    := mnt/boot
hw		:= mnt/hw

FSDIR 		:= fs
COMMONDIR 	:= c
KERNELDIR 	:= kernel
TESTSDIR 	:= tests
MMDIR 		:= mm
DEVICEDIR	:= device
SUBDIRS 	:= \
	$(COMMONDIR)\
	$(FSDIR)\
	$(MMDIR)\
	$(DEVICEDIR)\
	$(KERNELDIR)\
	$(TESTSDIR) \

MAKE = make
RM = rm
$(shell mkdir -p $(boot) $(hw))


all :
	@for dir in  $(SUBDIRS);do\
		$(MAKE)  -s -C $$dir $$@ || exit 1;\
	done

host:
	@cp $s $h /boot/

install: $s
	@-mount -o loop -t ext2 $d $(boot)
	@-mount $h $(hw)
	@chmod a+w $(hw) $(boot)
	@-cp bin/* $(hw)
	@sleep 1

uninstall:
	@-umount $(boot)
	@-umount $(hw)

go: install uninstall
	@mount -o loop -t ext2 $d $(boot)
	@-cp $s $(boot)
	@sleep 1
	@-umount $(boot)
	@bochs

clean:
	@-rm -rf -- bin/
	@-rm -rf -- lib/
	@-rm -rf -- objs/
	@-rm -f -- *.out *.src tags *.swap
	@for dir in $(SUBDIRS);do\
		$(MAKE) -s -C $$dir $@ || exit 1;\
	done
