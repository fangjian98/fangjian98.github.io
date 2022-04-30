---
title: Ubuntu常用包管理命令
categories: Linux
tags:
  - linux
  - apt
abbrlink: 64245
date: 2020-08-28 23:04:56 
---

> Ubuntu常用包管理命令

<!-- more -->

## Linux

```bash
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
```
