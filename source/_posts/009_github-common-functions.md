---
title: Github的常用功能
categories: Github
tags:
  - Github
  - Github Pages
  - Github Actions
  - Issue
  - Pull Request
abbrlink: f715120c
date: 2021-05-18 23:15:04
---

> Github 包含的功能点很多，你知道他们的作用是什么吗？改如何去使用这些功能呢？这里将列出常用的功能点，并描述其功能和什么时候去使用以及如何使用，当然你也可以查看Github的官方文档来了解和学习这些。

<!-- more -->

## 常用功能

- Issue

> Issue的作用在于对开源项目提Bug者需求来不断完善开源社区，这对问题追踪是很重要的，可以对现有代码讨论和交流，也可以交流如何使用，还可以作为项目管理的规划Todo List，提交cmmit关联issue id等。Issue 在整个GitHub，谁都可以提问issue，谁都可以对issue问题进行回答。
>
> 1.Issue的Label功能：自己的仓库或者作者给权限的仓库才有右边这些选项，点进去选择相应label即可
>
> 2.Issue Title的格式规范：[Issue Type] Issue brife description
>
> 3.Issue 内容模板(可自定义)：<1>该问题是怎么引起的 <2>重现步骤 <3>报错信息
>
> 4.Issue 可以有额外的属性:
>
> Labels，标签。包括 enhancement、bug、invalid 等，表示 Issue 的类型，解决的方式。除了自带的以外，也可以去自定义。
>
> Milestone，里程碑。作为 Issue 的一个集合，通常用来表示项目的一个阶段，比如 demo、release 等，保护达成这些阶段需要解决的问题。有时候，也会与版本计划重合，比如 v1.0、v2.0 等。Issue 不能设置截止时间，但是 Milestone 可以。
>
> Assignees，责任人。指定这个 Issue 由谁负责来解决。
>
> 充分利用这些功能，让每一个 commit 的意义更加明确，可以起到了良好的过程管理作用，使得这个 Git 库的项目进度更加显然。而且，这也是项目后期，写文档的绝佳素材。其实，GitHub 的 issue ，就是一个轻量级协作系统。它的 comment 支持 GitHub Flavored Markdown，可以进行内容丰富的交流。Git 本身就是分布式的代码版本控制软件，是为了程序员的协作而设计的。而 issue 的 Assignee 功能，就是这个在线协作系统的核心，足以让一群线上的开发者，一起完成一个软件项目。
>
> 5.使用 GitHub Issues 来写博客：[yihong0618/gitblog](https://github.com/yihong0618/gitblog)

- Github commit关联Issue的小技巧

> 如果一个处于Open状态的Issue已经处理完毕，只要在该提交中以下列任意一种格式描述提交信息，但PR通过后对应的Issue就会被Close，示例：`git commit -m "message title, fix #1"`。一个commit message 可同时关联多个任务，示例：`fix #1 #2` ，不同issue_id之间需要空格隔开。
>
>关键词：fix、fixes、fixed、close、closes、closed、resolve、resolves、resolved
>
>借助issue进行问题的提出，将问题内容反馈给研发人员，研发人员根据issue内容进行针对性的修复，并将修复后的结果反馈给测试人员，该过程属于一个迭代过程，待测试人员确认无误后，可关闭issue。

- Pull Requset

> Pull Request简写为PR，中文译为拉取请求，是为github开源项目提交自己的代码。
>
>第一次参与开源贡献代码流程参考：[firstcontributions/first-contributions](https://github.com/firstcontributions/first-contributions/blob/master/translations/README.chs.md)
>
>1. Fork代码仓库
>2. Clone代码仓库
>3. 新建分支，修改代码，再Commit修改，Push到Github
>4. 提出Pull Request你的修改供项目拥有者审阅Review，待conform merge即可合入修改

- Fork

> 复制克隆，相当于复制某个开源项目成为自己的一个同名仓库

- Stars

> 收藏，打开对应的项目主页，点击右上角star按钮即可收藏，在Your stars中查看个人收藏

- Github Wiki
- Github Release

> GitHub Releases是向用户提供软件的方式，您可以创建包软件的发行版，以及发行说明和二进制文件链接，以供其他人使用。
>
> 1.Release发布步骤：
>
> tag：v1.0.0
>
> release title：ExploreGithub v1.0.0
>
> describe this release：
>
> ```
> ## Features
> 
> - Add an integration library to support decoding AVIF ([`3fd8e77`](https://github.com/bumptech/glide/commit/3fd8e777e2be6a3fedc5f5c5f688970a212a285f), [`f5e78ed`]
> 
> ## Bugs
> 
> - Fix memory leak caused by unusual activity/fragment lifecycle interactions ([`8bebf71`](https://github.com/bumptech/glide/commit/8bebf71e80c2cd1f260d919e6b0697436da6e302))
> ```
>
> 2.Release参考：
>
> https://github.com/meefik/linuxdeploy
>
> https://github.com/bumptech/glide

- Github Discussions
- Github Pages
- Github Actions
- Github REST API
- License
- 关于仓库的gh-pages分支
- 如何提Issue
- 如何贡献Pull Request

## 隐藏技巧

1. username同名仓库：

   该仓库的`README.md`将直接显示再主页，可以作为自己的个人介绍详情页，有多种美化方式。

2. username.github.io仓库：

   该仓库直接生成专属你的网站，地址为`username.github.io`

3. Github Emoji

> 官方Emoji
>https://github.com/ikatyang/emoji-cheat-sheet/blob/master/README.md
>
>其他Emoji
>https://emoji.muan.co/
>https://gitmoji.dev/

4. Github图标

   Github主页图标：https://github.com/anuraghazra/github-readme-stats

   Github主页访问数：https://visitor-badge.laobi.icu/

   Github项目图标：https://shields.io/

5. Github在线编辑器

   github项目界面 按下<kbd>。</kbd> 即可进去vscode编辑界面

   github.com/user/repo在github后加`1s`，回车即可进入vscode编辑界面

   Vscode在线：https://vscode.dev/

6. Github Contributions 3D模型下载：[Here](https://skyline.github.com/)

7. Github Markdown 语法：[Here](https://docs.github.com/cn/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

示例：添加todo

```bash
- [x] this is a todo
- [ ] this is a todo
```

- [x] this is a todo
- [ ] this is a todo

8. Github引用图片和文件方式

下面是一些使用相对链接显示图像的示例。

| 上下文                               | 相对链接                                                     |
| :----------------------------------- | :----------------------------------------------------------- |
| 在同一个分支上的 `.md` 文件中        | `/assets/images/electrocat.png`                              |
| 在另一个分支的 `.md` 文件中          | `/../main/assets/images/electrocat.png`                      |
| 在仓库的议题、拉取请求和评论中       | `../blob/main/assets/images/electrocat.png`                  |
| 在另一个仓库的 `.md` 文件中          | `/../../../../github/docs/blob/main/assets/images/electrocat.png` |
| 在另一个仓库的议题、拉取请求和评论中 | `../../../github/docs/blob/main/assets/images/electrocat.png?raw=true` |

```bash
引用文件链接
https://github.com/alibaba/fastjson/blob/master/license.txt
```

