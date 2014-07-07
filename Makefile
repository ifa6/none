# Makefile for install.
# Install ask root.
#
.PHONY:go all clean 

# Directories.
# root directories
OUT_DIR  := objs
d 		:= a.img
ifeq ("$(RAMDISK)",1)
h 		:= ramdisk.img
else
h		:= n.hd
endif
s 		:= $(OUT_DIR)/bin/none 
boot    := $(OUT_DIR)/mnt/boot
hw		:= $(OUT_DIR)/mnt/hw

FSDIR 		:= fs
LIBDIR 		:= libs
KERNELDIR 	:= kernel
DEMODIR 	:= demo
MMDIR 		:= mm
DEVICEDIR	:= device
SUBDIRS 	:= \
	$(LIBDIR)\
	$(FSDIR)\
	$(MMDIR)\
	$(DEVICEDIR)\
	$(KERNELDIR)\
	$(DEMODIR) \

MAKE = make
RM = rm
$(shell mkdir -p $(boot) $(hw))


all :
	@for dir in  $(SUBDIRS);do\
		$(MAKE) -s -C $$dir $$@ || exit 1;\
	done

host:
	@cp $s $h /boot/

install: $s
	@-mount -o loop -t ext2 $d $(boot)
	@-mount $h $(hw)
	@chmod a+w $(hw) $(boot)
	@-cp $(OUT_DIR)/bin/* $(hw)
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
	@-rm -rf -- objs/
	@-rm -f -- *.out *.src tags *.swap
	@for dir in $(SUBDIRS);do\
		$(MAKE) -s -C $$dir $@ || exit 1;\
	done
