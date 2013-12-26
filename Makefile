# Makefile for install.
# Install ask root.
#
.PHONY:go all clean 

# Directories.
# root directories
r = $(PWD)
d = a.img
h = n.hd
s = kernel/none

boot = mnt/boot
hw = mnt/hw

FSDIR = fs
COMMONDIR = c
KERNELDIR = kernel
TESTSDIR = tests/
MMDIR = mm
EXECS = $(basename $(shell ls tests/*.c)) #shell test date ascii rascal ls cat vim
SUBDIRS = \
		  $(COMMONDIR)\
		  $(FSDIR)\
		  $(MMDIR)\
		  $(KERNELDIR)\
		  $(TESTSDIR) \

MAKE = make
RM = rm

all clean:
	@if [ "$@" == "clean" ];then\
		rm -f lib/*;\
		rm -f *.out *.src tags *.swap;\
	elif [ ! -d lib/ ];then \
		mkdir lib/; \
	fi
	@for dir in  $(SUBDIRS);do\
		$(MAKE) -s -C $$dir r=$r $@ || exit 1;\
	done

debug:
	@objdump -d $r/kernel/none > t.src

tar: $s
	@mount -o loop -t ext2 $d $(boot)
	@mount $h $(hw)
	@chmod a+w $(hw) $(boot)
	@cp $(EXECS) $(hw)
	@sleep 1

stop:
	@umount $(boot)
	@umount $(hw)

go: tar stop
	@mount -o loop -t ext2 $d $(boot)
	@cp $s $(boot)
	@sleep 1
	@umount $(boot)
	@bochs
