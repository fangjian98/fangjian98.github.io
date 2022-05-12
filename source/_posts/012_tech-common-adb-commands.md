---
title: 常用的adb命令
abbrlink: 3610a686
date: 2021-05-21 22:51:03
categories: Android
tags: adb
---

> ADB，即 Android Debug Bridge，它是 Android 开发/测试人员不可替代的强大工具，也是 Android 设备玩家的好玩具。安卓调试桥 (Android Debug Bridge, adb)，是一种可以用来操作手机设备或模拟器的命令行工具。它存在于 [sdk/platform-tools](https://developer.android.google.cn/studio/releases/platform-tools) 目录下。

<!-- more -->

## Adb常用命令

- 截图命令

```bash
adb shell /system/bin/screencap -p /sdcard/screenshot.png
```

- 将截图复制到电脑盘中
  
```bash
adb pull /sdcard/screenshot.png D:\download
```

- 使用adb命令开始录屏

```bash
adb shell screenrecord /sdcard/filename.mp4
```

- 启动和关闭ADB服务

```bash
adb start-server
adb kill-server
```

- 强制停止apk

```bash
adb shell am force-stop com.sohu.sohuvideo
```

- 强制停止apk，并清除数据

```bash
adb shell pm clear com.sohu.sohuvideo
```

- 静默安装

```bash
adb shell pm install -r filePath
adb install **.apk
```

- 列出安装的apk包

```bash
adb shell pm list packsges
```

- 根据包名查找apk路径

```bash
adb shell pm path packages.name
```

- 根据包名卸载apk

```bash
adb shell pm uninstall packages.name
```

- 启动apk

```bash
adb shell am start -n ｛包(package)名｝/｛包名｝.{活动(activity)名称}
```

- 通过 IP 地址无线连接到设备

```bash
# 使用 USB 线将设备连接到主机，设置目标设备以监听端口 5555 上的 TCP/IP 连接。
adb tcpip 5555
# 拔掉连接目标设备的 USB 线，通过 IP 地址连接到设备
adb connect device_ip_address:5555
# 查看连接设备
adb devices
```

- Android源码开发常用

```bash
adb shell

# 查看存储
df -h
# 查看运行内存
free -h

# 进入root模式
adb root
adb remount
adb reboot

# 解锁
adb disable-verity

# 进入boot模式
adb reboot bootloader
fastboot devices
fastboot reboot
```

## 官方文档

[https://developer.android.google.cn/studio/command-line/adb](https://developer.android.google.cn/studio/command-line/adb)
