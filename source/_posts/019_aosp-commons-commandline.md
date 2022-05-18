---
title: AOSP常用命令
categories: AOSP
tags:
  - AOSP
abbrlink: b42edc12
date: 2021-05-29 20:45:58
---

> 

<!-- more -->



# AOSP命令

```bash
mkdir 7.0
ls
cd 7.0
输入源码地址按下回车开始获取源码，获取完成后输入命令ls查看源码文件夹

cd LA.UM.5.6
source  build/envsetup.sh

lunch msm8953_64-user
lunch msm8953_64-userdebug

make -j8
make –j8 2>&1|tee 1.log

其他编译命令：
make aboot	             	--	编译bootloader；
make bootimage		--	编译kernel；
make systemimage		--	编译system；
make userdataimage	--	编译userdata；
make recoveryimage		--	编译recovery；
mmm packages/apps/Contacts	--	mmm编译指定目录的模块，如编译联系人；


常见的编译错误有：
1.编译环境配置不正常；
2.编译的代码有语法或逻辑错误；
3.编译过程中服务器中断。
对应解决方法：
1.配置对应编译环境；
2.根据error提示修改代码；
3.重新连接服务器重新编译或者继续编译，若想清除之前编译的信息则使用指令：make clean

清单一：编译Android系统
 $ source build/envsetup.sh 
 $ lunch full-eng 
 $ make -j8 


cd
cd LA.UM.7.6/
git branch -a
git  checkout -b MC501_custom origin/MC501_custom
source build/
source build/envsetup.sh
lunch
42
（top命令查看所有使用人）
make -j8 2>&1 | tee build.log
 make -j16 2>&1 | tee log.txt
rm -rf out/ && make -j16 2>&1 | tee build.log
rm -rf out/ && make -j8 2>&1 | tee build.log



## device目录下的状态
git status device/
## 修改的文件的不同
git diff  device/qcom/msm8937_32/system.prop
## 在根目录下生成patch
git diff  device/qcom/msm8937_32/system.prop > patch



\\192.168.0.227
home1/fangjian/

ls

git branch -a
origin/master
rm -rf out/


查看数据库
adb root 
adb shell
cd data/data/
cd com.android.providers.media/
ls
cd databases
ls

返回上一层
cd ..

git log --oneline -20
按q退出

//查看容量
df -h


单模块编译
source build/
lunch

mmm frameworks/base/package/SystemUI

make SystemUI

adb push ../SystemUI  /system/priv-app/




C:\Users\Admin>adb shell
* daemon not running; starting now at tcp:5037
* daemon started successfully
msm8937_32:/ $ exit


adb安装
C:\Users\Admin>adb root
restarting adbd as root

C:\Users\Admin>adb remount
remount succeeded

C:\Users\Admin>adb push \\192.168.0.227\home1\fangjian\LA.UM.5.6\out\target\product\msm8937_32\system\priv-app\SystemUI /system/priv-app/
\\192.168.0.227\home1\fangjian\LA.UM.5.6\out\target\produc...les pushed, 0 skipped. 7.3 MB/s (24039210 bytes in 3.157s)

C:\Users\Admin>adb push \\192.168.0.227\home1\fangjian\LA.UM.5.6\out\target\product\msm8937_32\system\framework\framework-res.apk /system/framework/
\\192.168.0.227\home1\fangjian\LA.UM.5.6\out\target\produc...ile pushed, 0 skipped. 8.7 MB/s (34416617 bytes in 3.780s)

C:\Users\Admin>adb reboot




C:\Users\Admin>adb push \\192.168.0.227\home1\fangjian\LA.UM.5.6\out\target\product\msm8937_32\system\priv-app\PackageInstaller /system/priv-app/
\\192.168.0.227\home1\fangjian\LA.UM.5.6\out\target\produc...les pushed, 0 skipped. 5.1 MB/s (10269498 bytes in 1.913s)

C:\Users\Admin>
C:\Users\Admin>adb shell
msm8937_32:/ $ getprop persist.sys.strict_op_enable
true
msm8937_32:/ $ getprop persist.vendor.strict_op_enable
true

打log
C:\Users\Admin>adb shell
msm8937_32:/ # logcat | grep GrantPermissionsActivity

不重启 push frameworks
C:\Users\Admin>adb shell
msm8937_32:/ # stop
msm8937_32:/ # start

msm8937_32:/ # logcat | grep return



```





```bash
1>编译结果目录：\\192.168.0.227\home1\fangjian\LA.UM.7.6\out\target\product\msm8953_64
2>将其目录下的非文件夹文件拷贝到 待刻录的文件夹中 \\192.168.0.88\每周软件版本\SLM758W\android9\SLM758E\V24
3>使用QFil进行烧录 选择

对比工具：Beyond Compare
\\192.168.0.227\home1\fangjian\LA.UM.7.6目录下：
SLM758E_meig_userdebug.sh
SLM758B_meig_userdebug.sh

代码注释：
//add by fangjian for bug 8506 start
//add by fangjian for bug 8506 end

cd LA.UM.7.6/
git branch -a
git  checkout -b SLM758W_meig_custom origin/SLM758W_meig_custom
source build/envsetup.sh
lunch
42
make -j8 2>&1 | tee build.log

cd LA.UM.7.6/
source build/envsetup.sh
lunch
mmm packages/apps/Music

在整体编译时部分依赖测试不会进行编译，所以使用使用mmm时会提示依赖出错，此时应该用mmma进行编译。
mm 构建模块在当前文件夹，不构建依赖
mmm 构建模块指定路径，不构建依赖
mma 构建模块在当前文件夹并构建依赖
mmma 构建模块在当前文件夹并构建依赖


生成运行的log的命令：
adb logcat> d:\test.log

安装手机应用命令
adb install C:\Users\Admin\Desktop\MusicTests.apk
adb push


更改值
adb root
adb shell getprop persist.sys.strict_op_enable true


adb root 
adb remount
adb push C:\Users\Admin\Desktop\music.apk
adb shell


1、   修改APK应用：在packages中的应用如果修改后都可以单独编译。先执行 
$. build/envsetup.sh #初始化
$mmm packages/providers/ContactsProvider/
##用mm/mmm来编译生成的.apk并不会打包到system.img中，需要我们手动通过make snod把system文件夹打包为system.img
##可以使用make snod将模块打包到system.img中，也可以使用 adb install *.apk安装
   执行make snod 命令，即可重新打包android系统镜像文件system.img。

注：通过mmm packages/providers/ContactsProvider/ 编译后的apk在 out/target/product/generic/system/app 
这时候通过 adb install out/target/product/generic/system/app/xxx.apk 安装你刚修改过的apk就可以在模拟器上看到你修改的效果了。

adb push方式进去：
adb shell mount -o rw,remount -t ext3 /dev/block/mmcblk0p2 /system   挂载并获取写入权限
adb push xxx.apk /system/app

 修改framework：如果在Contacts.java中修改了，必须重新编译下framework。先执行 
$ . build/envsetup.sh #初始化
#网上有的说要执行 make update-api，实际上直接make PRODUCT-sdk-sdk就可以将修改后的framework编译到sdk中。 #编译framework后，那些修改了的应用可以不用再单独编译了。4～6分钟
$ make PRODUCT-sdk-sdk #重新生成SDK 10~20分钟



```





## 编译服务器设置

登录成功后请执行下面步骤，以设置环境

1. 生成你的ssh key

```
ssh-keygen -t rsa
#一路回车
```

1. 将key注册到代码服务器

```
cat ~/.ssh/id_rsa.pub
```

1. 配置本地ssh策略

```
vim ~/.ssh/config
#加入下面内容
Host *
  KexAlgorithms +diffie-hellman-group1-sha1
```

拉取代码

```bahs
git clone ssh://fangjian@192.168.0.240:29418/LA.UM.7.6 && scp -p -P 29418 fangjian@192.168.0.240:hooks/commit-msg LA.UM.7.6/.git/hooks/
```

