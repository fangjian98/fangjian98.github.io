---
title: AOSP常用命令
categories: AOSP
tags:
  - AOSP
abbrlink: b42edc12
date: 2021-05-29 20:45:58
---

> 手机厂商或者智能模块厂商都是基于Android系统源码基础上进行二次开发，即AOSP(Android Open Source Project)，开发人员涉及Framework、APP、底层驱动以及通信BP侧等，这就需要我们了解Android系统的架构设计、编译、刷机验证等知识。

<!-- more -->

### AOSP编译命令

```bash
# 源码全编译
cd LA.UM.7.6/
git branch -a
git checkout -b SLM758W_meig_custom origin/SLM758W_meig_custom
source build/envsetup.sh
lunch #选择编译项
42
# lunch msm8953_64-userdebug
make -j8 2>&1 | tee build.log #加上编译log

# 删除编译结果目录
rm -rf out/

# 单模块编译
在整体编译时部分依赖测试不会进行编译，所以使用使用mmm时会提示依赖出错，此时应该用mmma进行编译
mm 构建模块在当前文件夹，不构建依赖
mmm 构建模块指定路径，不构建依赖
mma 构建模块在当前文件夹并构建依赖
mmma 构建模块在当前文件夹并构建依赖

# 单模块编译make:module name可查看对于模块下的Android.mk或Android.bp
make <module name>
make SystemUI

其他编译命令：
# 编译bootloader
make aboot	             
# 编译kernel
make bootimage
# 编译system
make systemimage
# 编译userdata
make userdataimage
# 编译recovery
make recoveryimage
# mmm编译指定目录的模块，如编译联系人
mmm packages/apps/Contacts

# 常见的编译错误有：
1.编译环境配置不正常；
2.编译的代码有语法或逻辑错误；
3.编译过程中服务器中断。
# 对应解决方法：
1.配置对应编译环境；
2.根据error提示修改代码；
3.重新连接服务器重新编译或者继续编译，若想清除之前编译的信息则使用指令：make clean
```
### 修改验证方式

1. 修改APK应用

```bash
在packages中的应用如果修改后都可以单独编译。先执行 
$ source build/envsetup.sh #初始化
$ mmm packages/providers/ContactsProvider/
# 用mm/mmm来编译生成的.apk并不会打包到system.img中，需要我们手动通过make snod把system文件夹打包为system.img
#可以使用make snod将模块打包到system.img中，也可以使用 adb install *.apk安装
$ make snod #可重新打包android系统镜像文件system.img

注：通过mmm packages/providers/ContactsProvider/ 编译后的apk在 out/target/product/generic/system/app 
这时候通过 adb install out/target/product/generic/system/app/xxx.apk 安装你刚修改过的apk就可以在模拟器上看到你修改的效果了。
```
2. 修改framework

```bash
如果在Contacts.java中修改了，必须重新编译下framework。先执行 
$ source build/envsetup.sh #初始化
#网上有的说要执行 make update-api，实际上直接make PRODUCT-sdk-sdk就可以将修改后的framework编译到sdk中。 
#编译framework后，那些修改了的应用可以不用再单独编译了。4～6分钟
$ make PRODUCT-sdk-sdk #重新生成SDK 10~20分钟
```

### 高通烧录工具QFIL

1.编译结果目录：\\192.168.0.227\home1\fangjian\LA.UM.7.6\out\target\product\msm8953_64
2.将其目录下的非文件夹文件拷贝到原始镜像的文件夹中 \SLM758W\android9\SLM758E\V24
3.使用QFil进行烧录 选择xml

### Linux&Git命令

```bash
# 创建目录
mkdir 7.0

# 列出文件
ls

# 返回上一级目录
# `.`是当前目录 `..`是上一级目录 `/`是根目录
cd ..

# 查看容量
df -h

# 查看运行内存
free -h

# 查看所有使用人情况
top

# device目录下的状态
git status device/
# 修改的文件的不同
git diff  device/qcom/msm8937_32/system.prop
# 在根目录下生成patch
git diff  device/qcom/msm8937_32/system.prop > patch
# 查看20行提交信息
git log --oneline -20
# 按q退出
```

### 验证ADB命令

```bash
# 查看连接设备
adb devices

# 进入命令行模式
adb shell

# 重启
adb reboot

# 生成运行的log的命令
adb logcat -b all > test.log

#查看当前界面的应用包名
adb shell dumpsys activity | grep Resume

# 从设备导出文件到当前目录下
adb pull /sdcard/Pictures/xx.png ./

# 安装手机应用命令
adb install C:\Users\Admin\Desktop\MusicTests.apk
adb install -r
adb install -t

# 获取属性值
adb shell getprop persist.sys.strict_op_enable
# 设置属性值
adb shell setprop persist.sys.strict_op_enable true

# 关闭SELinux
adb shell setenforce 0
# 打开SELinux
adb shell setenforce 1
# 查询SELinux的运行模式
# 0： 切换成 permissive（宽容模式）
# 1： 切换成 enforcing（强制模式）
adb shell getenforce

# 验证：编译好应用，push后重启即可
adb root 
adb remount
adb push out/target/product/generic/system/app/xxx.apk /system/app/
adb reboot

# 不重启 push frameworks操作
C:\Users\Admin>adb shell
msm8937_32:/ # stop
msm8937_32:/ # start

# remount报错：重启后再执行adb root && adb remount
adb disable-verity
adb reboot

# 进入bootloader模式
adb reboot bootloader

# fastboot flash partition filename 指定烧写一个分区
# Fastboot刷system分区
fastboot flash system system.img 
# 查看当前连接的设备
fastboot devices 
# 正常重启启动系统
fastboot reboot 
# 重启启动系统到bootloader阶段
fastboot reboot-bootloader 
# 烧写所有的分区
fastboot flashall 
# 擦除一个分区
fastboot erase partition 

# 查看数据库
adb root 
adb shell
cd data/data/
cd com.android.providers.media/
ls
```

### AOSP编译服务器设置

```bash
# 1.生成你的ssh key，一路回车即可
ssh-keygen -t rsa

# 2.将key注册到代码服务器
cat ~/.ssh/id_rsa.pub

# 3.配置本地ssh策略
vim ~/.ssh/config
#加入下面内容
Host * KexAlgorithms +diffie-hellman-group1-sha1

# 4.拉取代码
git clone ssh://fangjian@192.168.0.240:29418/LA.UM.7.6 && scp -p -P 29418 fangjian@192.168.0.240:hooks/commit-msg LA.UM.7.6/.git/hooks/
```

