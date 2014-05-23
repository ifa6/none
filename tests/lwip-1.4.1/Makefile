#
#	样板Makefile文件,集体项目根据实际情况进行简单修改即可
#	Author : lzy
.PHONY:all clean
#当前目录
INCLUDE_DIR := src/include src/include/ipv4
MODULE_NAME := $(notdir $(shell pwd))
MODULE		:= lib$(MODULE_NAME).a
BUILD		:= LIBRARY
SRC_FILES	:= $(shell find src/ -name "*.c")
CFLAGS 		:= -Wno-char-subscripts #-Wno-error=char-subscripts 

ifeq ($(ROOT_DIR),"")
$(error Undefined project root directory, you should run the 'source tools/setenv.sh' in the project root directory.)
else
include $(ROOT_DIR)/tools/Makefile.rule
endif
