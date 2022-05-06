---
title: Github的神级操作
date: 2022-05-06 22:48:00
categories: GitHub
tags: Github
---

> GitHub是面向开源及私有软件项目的托管平台，其流行及在开源世界的受欢迎程度自不必多言，但是关于Github的使用你又知道多少呢？这里将介绍下Github的常用快捷键、高级搜索语法和在线查看且运行项目，还有Github的官方文档值得认真读读，可以学到很多有用的点。

<!-- more -->

###  常用快捷键

聚焦于搜索栏：<kbd>S</kbd>

激活文件查找器：<kbd>T</kbd>

跳至代码中的某一行：<kbd>L</kbd>

打开追溯视图：<kbd>B</kbd>

在线VSCode查看：<kbd>。</kbd>

打开命令面板：<kbd>Ctrl</kbd> + <kbd>K</kbd>

查看帮助：<kbd>Shift</kbd> + <kbd>?</kbd>

更多快捷键查看：[Keyboard shortcuts](https://docs.github.com/cn/get-started/using-github/keyboard-shortcuts)

### 关于搜索

高级搜索面板：[Advanced search](https://github.com/search/advanced)

常用搜索语法：


| 搜索条件 - 找开发者 | 备注                                                  |
| ------------------- | ----------------------------------------------------- |
| location:           | location:china，匹配用户填写的地址在china             |
| language            | language:javascript，匹配开发语音为javascript的开发者 |
| followers:          | followers:>=1000，匹配超过1000关注者的开发者          |
| in:fullname         | jack in:fullname，匹配用户名实名为jack的开发者        |

| 搜索条件 - 找项目 | 备注                                        |
| ----------------- | ------------------------------------------- |
| Awesome+关键字    | 神奇的关键字awesome，帮助找到优秀的工具列表 |
| stars:            | stars:>=500                                 |
| language:         | language:javascript                         |
| forks:            | forks:>=500                                 |

| 搜索条件 - 找开发者 | 备注                  |
| ------------------- | --------------------- |
| in:name xxx         | 项目名包含xxx         |
| in:description xxx  | 项目描述包含xxx       |
| in:readme xxx       | 项目介绍文档里含有xxx |

更多搜索相关：[About searching on GitHub](https://docs.github.com/cn/search-github/getting-started-with-searching-on-github/about-searching-on-github)

### 在线运行Github项目

再Github项目仓库前加上：`gitpod.io/#/`即可在线打开项目，并且支持在线运行该项目，相当于拥有一台可操作的远程服务器。

```bash
# 例如原仓库
https://github.com/ant-design/ant-design-pro
# 添加前缀
https://gitpod.io/#/github.com/ant-design/ant-design-pro
# 即可在线查看项目和运行
```

关于[Gitpod](https://www.gitpod.io)，这是一个与GitHub紧密集成的云IDE，Gitpod为开发人员的GitHub项目提供了一次性的，可随时编程的开发环境。

