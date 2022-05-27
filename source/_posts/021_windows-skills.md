---
title: Windows使用技巧集合
categories: Windows
tags:
  - Windows
  - Edge
abbrlink: 2b5594fd
date: 2021-05-31 13:10:57
---

> Windows系列操作系统是如今个人电脑上使用最为广泛的操作系统，但很多人使用的方式依旧局限在只会鼠标点击的状态中，正确使用Windows也十分重要，一些经验与技巧，希望有帮助。

<!-- more -->

### Windows使用技巧

```bash
复制网页禁止复制的文档：360文档 百度文库
检查--设置--preference--Debugger--打开Disable JavaScript


下载网页中视频：
检查--network--media--F5刷新 -- 右键open in new table--新窗口下载


恶意软件删除工具：cmd--mrt--快速扫描--自动清理有恶意弹出的软件


wndows桌面优化：
1.设置-个性化-开始-打开（显示更多磁贴、使用全屏开始屏幕） 按win键打开应用列表

dell设置
Fn+T切换极速模式和安静模式

此电脑桌面
桌面右键--个性化--主题--下拉 桌面图标显示 -- 选择此电脑 回收站 控制面板

# 百度搜索技巧：加双引号 屏蔽广告
intitle:python filetype:pdf

# 浏览器快捷键
ctrl+shift+T 打开上次关闭的窗口
ctrl+T 新建标签页
ctrl+1 跳转到第一个标签页
ctrl+9 跳转到到最后一个标签页

# windows关机命令
shutdown -r 关机并重启
shutdown -s 关机
```

### Windows常见快捷键

> Win + D：显示桌面
>
> Win + E：打开资源管理器
>
> Win + F：搜索文件或文件夹
>
> Win + PrtSc：键自动截屏并保存
>
> Win + Home：最小化所有窗口，除了当前激活窗口
>
> Win + M：最小化所有窗口
>
> Win + ↑：最大化窗口
>
> Win + ↓：最小化窗口
>
> Win+R : 打开命令行
>
> Win+G：录屏
>
> Win+Shift+S：截屏
>
> Win+H：语音识别框
>
> Win+。: 表情符号

### 浏览器技巧

- Edge浏览器扩展按钮不显示解决方案 
  1.首选我们打开Edge浏览器，在浏览器右上方可以看到一个由三个点组成的“设置及其它”图标，使用鼠标点击该图标。
  2.点击之后会在下方弹出Edge浏览器的菜单窗口，在窗口中找到并点击“设置”这一项。
  3.这时会打开Edge浏览器的设置页面中，在页面左侧的导航菜单中点击切换到“外观”设置页面中。
  4.在外观设置中找到“选择要在工具栏上显示的按钮”这一栏，在其中找到“扩展按钮”，点击其右侧的开关将其开启就可以了。

- 插件默认路径

  1.Edge浏览器：C:\Users\UserName\AppData\Local\Microsoft\Edge\User Data\Default\Extensions

  2.Google浏览器：C:\Users\UserName\AppData\Local\Google\Chrome\User Data\Default\Extensions

### Windows10激活

```bash
# cmd命令激活windows
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr/skms kms.03k.org
slmgr/ato

# Win10密钥
专业版：W269N-WFGWX-YVC9B-4J6C9-T83GX
企业版：NPPR9-FWDCX-D2C8J-H872K-2YT43
家庭版：TX9XD-98N7V-6WMQ6-BX7FG-H8Q99

# 查询激活命令
运行：slmgr.vbs -dlv 命令可以查询到Windows的激活信息，包括：激活ID、安装ID、激活截止日期等；
运行：slmgr.vbs -dli 命令可以查询到操作系统版本、部分产品密钥、许可证状态等；
运行：slmgr.vbs -xpr 命令可以查询Windows是否永久激活；
运行：Winver 命令可以查询系统内核版本，以及注册用户。


# WINDOWS_LTSC_2021下载
文件名：Windows 10 Enterprise LTSC 2021 (x64) - DVD (Chinese-Simplified)
ED2K下载链接：
ed2k://|file|SW_DVD9_WIN_ENT_LTSC_2021_64BIT_ChnSimp_MLF_X22-84402.ISO|5044211712|1555B7DCA052B5958EE68DB58A42408D|/

# 镜像下载mdsn：
https://next.itellyou.cn/
```

### Windows上的语音识别功能

```bash
1.Windows 语音识别命令功能：
控制面板--轻松使用--语音识别--启动语音设别
语音参考卡片
https://support.microsoft.com/zh-cn/windows/windows-%E8%AF%AD%E9%9F%B3%E8%AF%86%E5%88%AB%E5%91%BD%E4%BB%A4-9d25ef36-994d-f367-a81a-a326160128c7
经测试时Windows 语音识别很鸡肋 根本啥也听不懂

2.设置--轻松使用--语音--WIN+H 开始听写--可以实现语音转文字  -- 此功能比较不错

3.OneNote上的office听写语音设别准确度更高
```

### 命令行安装工具Winget

使用 winget 工具可以安装和管理应用程序，winget ，全称windows package manager client，开发人员可以在 Windows 10 计算机上使用 winget 命令行工具来发现、安装、升级、删除和配置应用程序。 此工具是 Windows 程序包管理器服务的客户端接口。Windows常见的包管理器还有Chocolatey、winget、Scoop。

Winget：命令行安装工具 ，WIn10在微软商店安装“应用安装程序”，即可使用winget命令行

```bash
# 搜索
winget search firefox
# 显示具体信息
winget show fiefox
# 安装
winget install firefox

# -e 是指定版本
winget install firefox -e 

# 在winget上找不到软件，可以尝试用source添加软件源manifest
winget source list

# add 添加新来源; list 列出当前源; update 更新当前源;remove 删除当前源;reset 重置源；
```

### 远程桌面Microsoft Remote Desktop

[Microsoft Remote Desktop](https://docs.microsoft.com/zh-cn/windows-server/remote/remote-desktop-services/clients/remote-desktop-allow-access)可以使用远程桌面通过Microsoft 远程桌面客户端（适用于 Windows、iOS、macOS 和 Android）从远程设备连接并控制你的电脑。 当你允许远程连接到你的电脑时，可以使用其他设备连接到你的电脑并访问所有应用、文件和网络资源，就像坐在办公桌前一样。

可以使用远程桌面连接到 Windows 10 专业版和企业版、Windows 8.1 和 8 企业版和专业版、Windows 7 专业版、企业版和旗舰版以及比 Windows Server 2008 更高的 Windows Server 版本。 不能连接到运行家庭版的计算机（如 Windows 10 家庭版）。

### 系统管理优化工具 Dism++

Dism++ 是一款 Windows 系统管理优化工具，它解决了我们安装、维护系统的一大痛点问题——自定义设置和优化。相当于一个 “一站式” 管理优化工具集。

它把用户使用、调整频率较高的选项集合到一起，让我们可以使用它快速地完成电脑的自定义设置和优化，而不需要一层层地打开在不同位置的设置选项逐个调整，极大地方便了我们的操作。

官网：[www.chuyu.me](https://www.chuyu.me/zh-Hans/)

### 数据恢复工具

1. WinHex

winhex 是一个专门用来对付各种日常紧急情况的工具。它可以用来检查和修复各种文件、恢复删除文件、硬盘损坏造成的数据丢失等。同时它还可以让你看到其他程序隐藏起来的文件和数据。总体来说是一款非常不错的 16 进制编辑器。

2. Windows File Recovery

微软之前发布过一款免费的数据恢复软件：叫做Windows File Recovery，唯一且最大的缺陷是仅支持命令行，也就是只有懂命令的用户才能正常使用，这让我们大部分普通用户使用相当困难，很多用户望而止步。 今天给大家推荐一款免费好用的Windows文件恢复软件——WinFR界面版，它是为Windows File Recovery（微软官方命令行工具）专门开发的图形界面工具，支持从多种存储设备中恢复媒体文件、办公文件、压缩文件等，包括JPEG、 PDF、DOCX、MP3、EXCEL、ZIP等。

WinFR界面版
https://www.iplaysoft.com/winfr-gui.html

WinFR命令行
https://www.iplaysoft.com/windows-file-recovery.html

### Kotlin插件下载慢

Android Studio升级后，Kotlin插件往往也要升级。但是经常出现下载Kotlin插件卡住，超时的情况。

解决方法：

打开 [Jetbrains Kotlin下载界面](https://plugins.jetbrains.com/plugin/6954-kotlin/versions) ，找到对应的Kotlin插件版本号，由于从这个地址下载也特别慢（10kb/s左右），所以可以借助迅雷下载（500kb/s左右）。先在网页界面使用F12，打开开发者调试界面，点击下载按钮，控制台的NetWork标签页会加载出下载地址，然后拷贝到迅雷，新建下载任务。

下载好zip格式的插件包后，在AndroidStudio的插件列表，添加本地插件`install plugin form disk`即可。

### Android Studio配置Auto Import

1. 在粘贴的时候添加导入

Insert imports on paste:  Always

2. 添加清楚的导入，就是不带*的导入

Add unambiguous imports on the fly

3. 优化导入，会去掉没用到的包

Optimize imports on the fly

### IntelliJ IDEA创建项目

IntelliJ IDEA 如何创建一个普通的java项目，及创建java文件并运行。

1. 创建java项目：
   1.打开IDEA 软件，点击界面上的Creaye New Project 或file -- new -- project
   2.出现以下界面，选中Java，然后选择jdk，最后点击Next，进行下一步（我的是jdk1.8）
   3.这里是选择生成项目时是否创建java文件，勾选上Java Hello World后会生成一个默认的Hello world文件，
   点击Next进行下一步，也可以都不勾选
   4.给项目命名，默认是untiled，自己填个名字吧，最后点击finish
   5.项目创建完成

2. 创建java文件：
   1.点击src -- new -- package，创建一个文件包，并给包命名：com.example.demo
   2.在包下面创建java类文件，点击包名 -- New -- Java Class，给类文件命名
   3.运行java文件，点击Run -- Run.;
   4.输出结果

### Pycharm默认源

```bash
默认：https://pypi.python.org/simple
清华: https://pypi.tuna.tsinghua.edu.cn/simple
豆瓣: http://pypi.douban.com/simple/
阿里: http://mirrors.aliyun.com/pypi/simple/
推荐清华源

使用pip的时候在后面加上-i参数，指定pip的下载源
pip install numpy -i https://pypi.tuna.tsinghua.edu.cn/simple
```

### 关于Conda

Conda的作用：在python开发中，我们希望每个应用有一个独立的python环境，因为不同应用可能使用的软件库的版本不一样，因此Conda虚拟环境即可以为一个应用创建一套隔离的python运行环境。

使用python的包管理器conda即可轻松创建虚拟环境

```bash
# 查看python安装路径
C:\Users\fangj>where python
C:\Program Files (x86)\Python36-32\python.exe
C:\Users\fangj\Miniconda3\python.exe
C:\Users\fangj\AppData\Local\Microsoft\WindowsApps\python.exe

# python 下载第三方库路径
\Lib\site-packages

# conda常用命令
conda create --name env-name
conda activate env-name
conda deactivate
conda env remove --name env-name
conda env list

# 创建虚拟环境：tf2 虚拟环境名字  python=3.6指定python版本 -y确认
conda create -n tf2 python=3.6 -y

# 查看conda环境
C:\Users\fangj>conda env list
# conda environments:
#
base                  *  C:\Users\fangj\Miniconda3

# 激活性能环境
conda activate tf2

# 退出虚拟环境
conda deactivate 

# 删除虚拟环境
conda remove -n tf2 --all

# 搜索opencv包
conda search opencv -c conda-forge

# 显示添加的源
conda config --show channels
```

### MinGW 编译器

MinGW的全称是：Minimalist GNU on Windows 。它实际上是将经典的开源 C语言 编译器 GCC 移植到了 Windows 平台下，并且包含了 Win32API ，因此可以将源代码编译为可在 Windows 中运行的可执行程序。而且还可以使用一些 Windows 不具备的，Linux平台下的开发工具。一句话来概括：MinGW 就是 GCC 的 Windows 版本 。
MinGW-w64 与 MinGW 的区别在于 MinGW 只能编译生成32位可执行程序，而 MinGW-w64 则可以编译生成 64位 或 32位 可执行程序。正因为如此，MinGW 现已被 MinGW-w64 所取代，且 MinGW 也早已停止了更新，内置的 GCC 停滞在了 4.8.1 版本，而 MinGW-w64 内置的 GCC 则更新到了 8.1.0 版本。（2020/12/15）

1. 下载

mingw64下载：https://www.mingw-w64.org/downloads/

eg:x86_64-7.3.0-release-posix-seh-rt_v5-rev0.7z

sourceforge下载：https://sourceforge.net/projects/mingw-w64/files/mingw-w64/mingw-w64-release/

2. 添加环境变量

之前安装的的 MinGW-w64 的 bin 文件夹地址，复制到新增的Path空白变量位置里，即可完成 MinGW-w64 的配置

3. 验证安装

`win+r`，输入cmd进入命令行，输入`gcc -v`并按回车键（Enter），将会显示 MinGW-w64 的组件列表。

### 关于VSCode

1. VSCode底部状态栏颜色问题

   当你打开文件夹时，它是蓝色的。当你没有打开其他文件时，它是紫色的。修改主题色和这个没有关系。

2. 超详细的VsCode创建SpringBoot项目(图文并茂)

   https://blog.csdn.net/zyd573803837/article/details/109263219

### Github Copilot的使用

[Copilot](https://copilot.github.com/)是由 Github 提供的AI编码辅助工具，它可以在编码过程中提供基于 AI 学习的编码建议。在很多情况下，只需要有注释或者函数名称，Copilot就可以实例完整的代码。

目前 Copilot 还没有全量开放，需要申请开通权限。访问它的官方网站[copilot.github.com](https://copilot.github.com/)，点击“Sign up“按钮即可申请开通。当获得开通权限后，就可以在 Github 上使用 Copilot。

正常使用时，当 Copilot 给出建议时，会在光标位置的后方出现建议的代码，并灰色字显示。如果不希望使用提示，则继续输入代码即可，如果希望使用提示的代码，按下 Tab 键即可。

![使用截图](https://tutorials.maiyatang.co/attachments/vscode/copilot-usage-and-shortcut/04.completion.png)

在 VSCode 中，Copilot 有一个图标，需要确认状态是打开的。当它的样子与其它图标类似，没有背景颜色时，表示是开启的，此时当你编辑代码文件的时候，Copilot会自动提示代码建议。当它有背景颜色（红色、深黄色等）时，表示是关闭的。如果要切换状态只要点击它，然后选择全局（Globally）即可。

![状态图标](https://tutorials.maiyatang.co/attachments/vscode/copilot-usage-and-shortcut/05.icon.png)



Copilot 也提供了一些快捷键，可以很方便地使用。

- 接受建议：`Tab`
- 拒绝建议：`Esc`
- 打开Copilot：`Ctrl + Enter` （会打开一个单独的面板，展示10个建议）
- 下一条建议：`Alt/Option + ]`
- 上一条建议：`Alt/Option + [`
- 触发行内Copilot：`Alt/Option + \` （Coplit还没有给出建议或者建议被拒绝了，希望手工触发它提供建议）

### Windows探索

- Ubuntu虚拟机设置网络：网络适配器 - 网络连接 - 选择 NAT模式：用于共享主机IP

- 免费申请office E5开发者订阅，附无限续期+私人网盘教程

​		https://zhuanlan.zhihu.com/p/105438817?utm_source=qq

- WOL（Wake On LAN - 局域网唤醒）外网唤醒 配置教程 远程开机

  https://blog.csdn.net/qq_19764639/article/details/82817719

- Gitee免费图床搭建以及PicGo的使用

  https://blog.csdn.net/cl939974883/article/details/109469396

  https://sspai.com/post/65716

  [PicGo](https://github.com/Molunerfinn/PicGo/releases)

