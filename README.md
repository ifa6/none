[源码]: https://github.com/LuoZhongYao/none
[none]: https://github.com/LuoZhongYao/none
[GITHUB]: https://github.com/LuoZhongYao/none
[lzy]: mail:LuoZhongYao@gmail.com

<h2 id="overview">概述</h2>
![None新特性预览](http://r.photo.store.qq.com/psb?/2f055629-26d1-450a-b719-0c9a5862abb4/8f5clD6S9VIPUSTIu8Oa52PZh58NjPIIgMlTow0Hi6A!/o/dMaLGsdKEAAA&bo=oAWEA6AFhAMCACQ!&t=5&rf=viewer_311)

<h3 id='prepare'>准备</h3>

```bash
sudo apt-get install bochs
```
Fedora下面安装

```bash
sudo yum install bochs
```

通过git获取none
```bash
git clone https://github.com/TaiChiForLuoZhongYao/none.git
```

<h3 id='run'>运行</h3>
`c.img` `ramdisk.img`是已经编译好的的启动镜像(虚拟AT硬盘)和ramdisk镜像,直接可以在bochs下运行.安装好bochs后使用如下命令即可运行
```bash -q
bochs
```

<h2 id="compile">编译none</h2>
```bash
git clone https://github.com/LuoZhongYao/none.git # 下载源码
cd none                 # 进入none源码目录
source tools/setenv.sh  # 设置root_dir环境变量
make                    # 编译生成out/bin/none,及demo/目录下的演示,测试程序,生成的二进制文件在out/bin/目录下
sudo make go            # 将out/bin/non拷贝到a.img的/目录下,将out/bin/下面的程序,拷贝到ramdisk.img的/bin/目录下,并启动bochs运行
```
<h3 id="bochs">虚拟机</h3>

[none][]因为使用了AT硬盘,而这种硬盘已经绝种了,所以必须使用虚拟机运行,(将来会实现ramdisk,这样就可以在物理机上运行),而只有`bochs`的虚拟硬盘是*FAST模式*,可以直接挂载Linux下进行操作,十分简单,所以理想的运行环境是`bochs`.
bochs需要特殊编译.可参考本人的另一篇文章[编译支持VESA3的bochs](http://www.cnblogs.com/-lzy/p/3486142.html)
<h3 id="pc">物理机</h3>

如果安装的是linux系统,运行[none][]很简单.将out/bin/none和ramdisk.img拷贝到/boot/目录下,如果是grub 2.0,编辑/boot/grub2/grub.cfg,在末尾加入

```bash
menuentry 'none OS' {
    load_video
    insmod part_msdos
    insmod minix2
    search --file /none --set root
    multiboot /none
    module    /ramdisk.img
}
```
重新开机,在grub2启动菜单选择none OS即可运行none.


<h3 id="about-this">关于这份文档</h3>

这份文档使用`markdown`编写,编译工具是`pandoc`,文档的源码可通过[](https://naiz.biz/none/user-manual.md)下载.

