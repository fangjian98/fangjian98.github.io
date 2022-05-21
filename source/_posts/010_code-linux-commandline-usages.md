---
title: Linux常用命令
categories: Linux
tags:
  - linux
  - Ubuntu
abbrlink: 64245
date: 2021-05-19 23:04:56 
---

> Ubuntu常用的Linux命令

> 使用Linux系统的时候会经常用到终端命令行来执行想要的操作，尤其是通过远程SSH使用时，没有可视化的界面就只能用命令行了，这就需要我们掌握常用的Linux命令了。

<!-- more -->

## Ubuntu常用命令

```bash
安装vim
sudo apt-get install vim
sudo apt install vim

更新源
sudo apt-get update
更新软件
sudo apt-get upgrade

apt list
列出本地仓库中所有的软件包名

apt list [package]
从本地仓库中查找指定的包名，支持通配符，比如"apt list zlib*“就能列出以zlib开头的所有包名

apt list --installed
列出系统中所有已安装的包名

apt search [key]
与list类似，通过给出的关键字进行搜索，列出所有的包和其描述

apt show [package]
列出指定包的详细情况，包名要填写完整。

apt install [package]
安装指定的包，并同时安装其依赖的其他包。

apt remove [package]
卸载包，但不删除相关配置文件。包名支持通配符

apt autoremove
卸载因安装软件自动安装的依赖，而现在又不需要的依赖包

apt purge [package]
卸载包，同时删除相关配置文件。包名支持通配符

apt clean
删除所有已下载的软件包

apt autoclean
类似clean，但删除的是过期的包（即已不能下载或者是无用的包）

# Linux screen命令用于多重视窗管理程序
screen -ls
显示目前所有的screen作业

screen -r 4458
重新连接screen作业

screen --wipe
清除dead会话命令

# 查看运行内存情况 -h是以GB为单位
free -h

# Linux中buff/cache内存占用过高解决方案
echo 1 > /proc/sys/vm/drop_caches
```

## Linux通用命令

#### ls：文件列出命令

- ls -a 显示所有文件和目录（包括隐藏文件）
- ls -l 显示文件的详细信息
- ls -r 将文件以相反序列列出
- ls -t 将文件以建立时间列出

#### mkdir：创建文件夹命令

- mkdir <文件名> 即可在当前目录下创建一个文件夹

#### rm：删除文件命令

- rm -r * 删除当前目录下得所有文件及目录
- rm <文件名> 删除一个文件

#### cp：复制文件到指定位置

- cp -a 复制目录下的所有内容 eg. cp -a test/ newtest
- cp -d 复制时保留链接
- cp -f 覆盖已存在的文件，不提示
- cp -i 覆盖已存在的文件，提示
- cp -p 复制的文件保留修改时间和访问权限
- cp -r 复制目录下的所有子目录和文件

#### mv：一般用来为文件或者目录改名，或者将目录移动到其他位置

- mv -b 文件目标存在时，会创建一个备份 eg. mv onefile twofile (将onefile改名为twofile）
- mv -i 在覆盖前会询问
- mv -f 覆盖前不会询问
- mv -n 不覆盖任何文件
- mv -u 目标文件不存在才能移动

#### find：在指定目录下查找文件

- find 路径 -<操作> eg. find . -name “*.c” 查找所有后缀为.c的文件
- find . -type f 将当前目录及子目录下的文件全部列出
- find . -ctime -20 将当前目录及子目录下的在最近20天更新过的文件全部列出

#### grep：查找文件内符合条件的字符串

- grep test *file 在当前目录中查找后缀有file的，并且包含test字符串的文件，并且打印出字符串的行
- grep -r update /etc/acpi 以递归的方式查找符合条件的文件。eg.查找指定目录下的包含update的文件，并且打印所在行
- grep -v test *test* 反向查找，查找文件名中包含test的文件中不包含test的行。
- grep -i 不区分大小写

#### cat：输出文件内容

- cat -n 由1开始对所有内容进行行数编号
- cat -b 对空白行不进行编号
- cat -s 将两个空白行合并为一个
- cat -E 在每行结束时显示$
- cat -T 将TAB显示为^|
