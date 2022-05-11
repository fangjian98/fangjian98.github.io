---
title: Android Jetpack系列库简介
categories: Android
tags:
  - Android
  - Jetpack
abbrlink: 23f0b0f3
date: 2022-05-11 19:24:50
---

> JetPack是Google推出的一些库的集合，是Android基础支持库SDK以外的部分，包含了组件、工具、架构方案等，最核心的出发点就是帮助开发者快速构建出稳定、高性能、测试友好同时向后兼容的APP。

<!-- more -->

### 什么是Jetpack
2018年谷歌I/O 发布了一系列辅助Android开发者的实用工具，合称Jetpack，以帮助开发者构建出色的 Android 应用。大体上，JetPack是Google推出的一些库的集合，是Android基础支持库SDK以外的部分，包含了组件、工具、架构方案等，开发者可以自主按需选择接入具体的哪个库。

- Goole IO 2017：Google 开始推出Architecture Component, ORM库Room, 用户生命周期管理的ViewModel/ListData。

- Goole IO 2018：将Support lib 更名为androidx，Google将许多正确的方案集中起来，以高效的开发Android APP。

以上种种，现在统称为JetPack.其最核心的出发点就是帮助开发者快速构建出稳定、高性能、测试友好同时向后兼容的APP。

使用Jetpack的优势：

- 加快开发速度
- 消除样板代码
- 编译功能强大的优质应用

### Jetpack的组成

Android Jetpack 组件覆盖以下 4 个方面：Foundation （基础组件）、Architecture（架构组件）、Behavior（行为组件）、UI（界面组件）。

![Android Jetpack](/images/assets/jetpack.png)


1. 基础组件

AppCompat：使得支持较低的 Android 版本。从以前继承 Activity 到现在继承 AppCompatActivity 就是属于这一部分
Android KTX：Kotlin 的扩展支持库
Multidex：多 dex 文件支持
Test：测试支持库

2. 架构组件

Data Binding：MVVM 的一种实践
Lifecycles：管理你的 Activity 和 Fragment 生命周期
LiveData：通过观察者模式感知数据变化，类比 RxJava
Navigation：处理 Fragment 导航相关逻辑
Paging：分页数据加载方案
Room：官方 ORM 库
ViewModel：通过数据驱动 V 视图发生改变
WorkManager：管理后台任务

3. 行为组件

DownloadManager：管理下载任务
Media App：多媒体播放和一些向后兼容的API。主要包含 MediaPlayer 和 ExoPlayer
Notifications：提供向后兼容的通知 API，支持 Wear 和 Auto
Permissions：权限管理，这个应该都接触过。用于检查和请求应用权限
Settings：Preference 相关 API。基本每个应用都会用到
Share Action：提供分享操作。这块在国内使用的不多，都是自己封装或者采用第三方方案
Slices：可以让应用通过外部（其他 APP）显示 APP 界面（通过设备自带的搜索，语音助手等）

4. 界面组件

Animations and Transitions：动画，界面转场等
Auto：针对车辆的标准化界面和模式
Emoji：表情符号相关
Fragment：基础概念
Layout：基础概念
Palette-Colors：调色板
TV：Android TV 开发相关
Wear：可穿戴设备（目前主要是手表）开发相关

### 相关参考

https://blog.csdn.net/qq_34519487/article/details/103963912

http://www.xiangxueketang.cn/enjoy/removal/article_6?sdclkid=AL2G15oN1526A6D6bo&bd_vid=7921788666531507771
