---
title: 关于图床
categories: 技术流
tags:
  - Image Hosting Service
  - Github
  - PicGO
abbrlink: 91cd0b89
date: 2022-05-12 16:41:26
---

> 图床一般是指储存图片的服务器，有国内和国外之分。国外的图床由于有空间距离等因素决定访问速度很慢影响图片显示速度。国内也分为单线空间、多线空间和cdn加速三种。

<!-- more -->

### 图床意义

图床就是专门用来存放图片，同时允许你把图片对外连接的网上空间，不少图床都是免费的。图床相当于在网络上存储图片的地方，可以节约本地资源，图片可以多次引用。我最早接触的图床是[sm.ms](https://sm.ms/)，后来需要登录才可以使用了，其实CSDN写文章插入图片也可以使用作为图床使用。

### 使用托管平台图床

#### 1.Github

Github作为图床可以使用，但是速度太慢，可以使用 [jsDeliver](https://www.jsdelivr.com/) 加速。

Github原生格式：(目前无法直接访问，需要科学上网)

```
https://raw.githubusercontent.com/{UserName}/{Repo}/{Branch}/{Images Path}
```

示例：

```
https://raw.githubusercontent.com/fangjian98/fangjian98.github.io/hexo/source/images/avatar.jpg
```

jsDeliver加速格式参考:

```
https://cdn.jsdelivr.net/gh/{UserName}/{Repo}@{Branch}/{Images Path}
```

示例：

```
https://cdn.jsdelivr.net/gh/fangjian98/fangjian98.github.io@hexo/source/images/avatar.jpg
```

#### 2.Gitee

Gitee相当于是Github的中国版，国内访问速度很快。

Gitee格式参考：

```
https://gitee.com/{UserName}/{Repo}/raw/{Branch}/{Images Path}
```

示例：

```
https://gitee.com/fangjian98/imagespace/raw/master/img19.jpg
```

#### 3.GitCode

Gitcode原来叫CodeChina，好像是CSDN出品的项目托管平台，速度也很快。我目前正在使用的就是GitCode图床。

GitCode格式参考：

```
https://gitcode.net/{UserName}/{Repi}/-/raw/{Branch}/{Images Path}
```

 示例：

```
https://gitcode.net/weixin_44008788/images/-/raw/master/gitcode.png
```

![GitCode](https://gitcode.net/weixin_44008788/images/-/raw/master/gitcode.png)

### 图床管理工具

该类工具可以可视化的直接复制图片链接，不必要在纠结在格式链接上了。

- **PicGO** -  一个用于快速上传图片并获取图片 URL 链接的工具，需要下载客户端

发行版下载：[Molunerfinn/PicGo/releases](https://github.com/Molunerfinn/PicGo/releases/)

开源地址：[Molunerfinn/PicGo](https://github.com/Molunerfinn/PicGo)

- **PicX** - 是一款基于 GitHub API & jsDelivr 开发的具有 CDN 加速功能的图床工具，在线操作即可，无需下载和安装

在线地址：[picx.xpoet.cn](https://picx.xpoet.cn/)

开源地址：[XPoet/picx](https://github.com/XPoet/picx)

