file	:= /home/z/Templates/rootfs/*
rootfs: rootfs.c sha1.c
	@echo	"Builder $@"
	@gcc $^ -g -o $@ -std=c11 -Wall -fdiagnostics-color=always
	@echo 	"rootfs  "
	@-./$@ $(file)
	@echo 	"sha1sum "
	@sha1sum $(file)

clean:
	@-rm -f rootfs
