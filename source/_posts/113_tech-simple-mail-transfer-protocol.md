---
title: 关于电子邮件协议
categories: 技术流
tags:
  - POP3/SMTP
  - IMAP/SMTP
abbrlink: 1f82cbab
date: 2022-05-09 16:51:52
---

> 电子邮件是一种用电子手段提供信息交换的通信方式，是互联网应用最广的服务。通过网络的电子邮件系统，用户可以以非常低廉的价格（不管发送到哪里，都只需负担网费）、非常快速的方式（几秒钟之内可以发送到世界上任何指定的目的地），与世界上任何一个角落的网络用户联系。

<!-- more -->

在企业中一般都会有自己的定制化的企业邮箱， 使用的邮箱功能模块可按需求定制，例如邮箱后缀用公司名字的，想多个地区分别管理的，跨团队沟通群发邮件、想要一个独立登录入口页面、想要全球收发，企业邮箱里的功能都能满足，其灵活性的配置，让员工高效协同办公。

在使用企业邮箱配置客户端的时候，这就会涉及到邮件服务器和端口的填写，如下使用是Foxmail邮箱客户端配置邮件服务器的参数，如果使用Outlook也可以参考使用这个参数的配置。另外QQ邮箱也可以开通OP3/IMAP/SMTP服务。

![邮件服务器的配置](https://gitcode.net/weixin_44008788/images/-/raw/master/hexo/mail_protocol.png)

### 关于邮件协议

- IMAP/SMTP服务

- POP3/SMTP服务

> 电子邮件协议有SMTP、POP3、IMAP4，它们都隶属于TCP/IP协议簇，默认状态下，分别通过TCP端口25、110和143建立连接。

### 什么是POP3、SMTP及IMAP

- **POP3**

POP3是Post Office Protocol 3的简称，即邮局协议的第3个版本,它规定怎样将个人计算机连接到Internet的邮件服务器和下载电子邮件的电子协议。它是因特网电子邮件的第一个离线协议标准，**POP3允许用户从服务器上把邮件存储到本地主机（即自己的计算机）上,同时删除保存在邮件服务器上的邮件**，而POP3服务器则是遵循POP3协议的接收邮件服务器，用来接收电子邮件的。

- **SMTP**

SMTP的全称是“Simple Mail Transfer Protocol”，即简单邮件传输协议。它是一组用于从源地址到目的地址传输邮件的规范，通过它来控制邮件的中转方式。SMTP 协议属于 TCP/IP 协议簇，它帮助每台计算机在发送或中转信件时找到下一个目的地。
SMTP 服务器就是遵循 SMTP 协议的发送邮件服务器。SMTP 认证，简单地说就是要求必须在提供了账户名和密码之后才可以登录 SMTP 服务器，这就使得那些垃圾邮件的散播者无可乘之机。增加 SMTP 认证的目的是为了使用户避免受到垃圾邮件的侵扰。

- **IMAP**

IMAP全称是Internet Mail Access Protocol，即交互式邮件存取协议，它是跟POP3类似邮件访问标准协议之一。不同的是，开启了IMAP后，您在电子邮件客户端收取的邮件仍然保留 在服务器上，同时在客户端上的操作都会反馈到服务器上，如：删除邮件，标记已读等，服务器上的邮件也会做相应的动作。所以无论从浏览器登录邮箱或者客户端 软件登录邮箱，看到的邮件以及状态都是一致的。

### IMAP和POP3有什么区别?

**POP3**协议允许电子邮件客户端下载服务器上的邮件，但是在客户端的操作（如移动邮件、标记已读等），不会反馈到服务器上，比如通过客户端收取了邮箱中的3封邮件并移动到其他文件夹，邮箱服务器上的这些邮件是没有同时被移动的 。

而**IMAP**提供webmail 与电子邮件客户端之间的双向通信，客户端的操作都会反馈到服务器上，对邮件进行的操作，服务器上的邮件也会做相应的动作。

同时，**IMAP**像**POP3**那样提供了方便的邮件下载服务，让用户能进行离线阅读。**IMAP**提供的摘要浏览功能可以让你在阅读完所有的邮件到达时间、主题、发件人、大小等信息后才作出是否下载的决定。此外，**IMAP** 更好地支持了从多个不同设备中随时访问新邮件。

![IMAP与POP3的区别](https://gitcode.net/weixin_44008788/images/-/raw/master/hexo/mail_protocol_table.jpg)

总之，**IMAP** 整体上为用户带来更为便捷和可靠的体验。**POP3** 更易丢失邮件或多次下载相同的邮件，但 **IMAP** 通过邮件客户端与webmail 之间的双向同步功能很好地避免了这些问题。