---
title: SMB通信协议
categories: 技术流
tags:
  - Samba
abbrlink: 67e1ad8
date: 2022-05-21 15:27:06
---

> Samba是在Linux和UNIX系统上实现SMB协议的一个免费软件，由服务器及客户端程序构成。SMB（Server Messages Block，信息服务块）是一种在局域网上共享文件和打印机的一种通信协议，它为局域网内的不同计算机之间提供文件及打印机等资源的共享服务。SMB协议是客户机/服务器型协议，客户机通过该协议可以访问服务器上的共享文件系统、打印机及其他资源。

<!-- more -->

- samba

```bash
2.安装 samba
sudo apt-get install samba
3. 创建共享文件夹
mkdir 777 /home/share
4. 修改共享文件夹权限
chmod 777 /home/share
5. 编辑smb.conf
vim /etc/samba/smb.conf (先检查vim是否安装，如果没有安装先安装sudo apt-get install vim)
在文档的最后加入
[share]
path=/home/share
available=yes
browseable=yes
public=yes
writable=yes //这条只表明客户端可以创建文件并且能修改,但是却不能修改服务端创建出来的文件.

6.重启samba服务
service smbd restart
7. 访问
windows中，win+r 输入\ip
或在工作组计算机中找到ubuntu主机即可访问
ubuntu中，connect to server smb://ip/即可访问



原因是客户端创建出来的文件所属user是nobdoy, group是nogroup, 而服务端的user/group是kris/kris.
两个不同用户和不同组不能相互修改.

网上资料一般提供的方法都是直接将共享目录下的所有文件权限修改:
# chmod -R 777 /home/kris

可是如果使用git,这种情况下用git status去查看会是一片红啊!
而且如果服务端再新增文件呢,又要去改权限...

其实smb.conf提供了另外一个配置叫force user, 它表示客户端默认创建的文件所属用户,
只要和服务端设置成一样,那么就直接可以创建和修改所有文件了.

最终添加的配置如下:
[kris]
comment="Kris's Home"
path=/home/kris
available = yes
browseable = yes
public = yes
writable = yes
create mask = 0644    //创建文件属性
force user = kris    //和服务端用户一样
```

