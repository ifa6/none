#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean
# LIBS 
STATIC_LIBARY := c
BUILD		  := BINARYS
ENTRY 		  := 0xc00000
CLEANS		  := $(basename $(wildcard *.c))
ifeq ("$(ROOT_DIR)","")
$(error "Miss ROOT_DIR")
else
include $(ROOT_DIR)/tools/Makefile.rule
endif
