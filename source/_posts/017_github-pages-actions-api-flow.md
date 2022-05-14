---
title: Github的重要功能Pages、Actions、REST API以及GitHub Flow
categories: Github
tags:
  - Github
  - Github Pages
  - Github Actions
  - GitHub Flow
  - REST API
abbrlink: 604f0261
date: 2021-05-27 17:29:04
---

> 这里将介绍Github的四个重要功能：Github Pages、Github Actions、REST API以及GitHub Flow。

<!-- more -->

## Github Pages

Github Pages的优点

- 使用零成本: github pages 集成在 github 中, 直接和代码管理绑定在一起, 随着代码更新自动重新部署, 使用非常方便.
- 免费: 免费提供 username.github.io 的域名, 免费的静态网站服务器.
- 无数量限制: github pages 没有使用的数量限制, 每一个 github repository 都可以部署为一个静态网站.

Github提供了Pages功能, 分别是user pages和project pages, 区别如下:

|                 | User Page                                          | Project Page                                   |
| --------------- | -------------------------------------------------- | ---------------------------------------------- |
| 是否多个        | 一个帐号只有一个                                   | 可以有多个, 每个repo都可以有对应的Project page |
| repo and branch | repo名必须为`<username>.github.io`, 页面在master上 | repo名随意, 页面必须在分支`gh-pages`下         |
| URL             | `http(s)://<username>.github.io`                   | `http(s)://<username>.github.io/<projectname>` |

常见的使用Github Pages搭建个人博客的方式：`hexo`与`jekyll`

`Github Pages`其实等于`jekyll engine` + `static web server,` 方法1其实是利用`jekyll`搭建`blog`, 这两个功能都用到了.

`Hexo` + `Github pages`搭建blog其实就是只利用了github pages的`static web server`功能, hexo基于node.js, hexo在本机将用户的blog翻译成静态页面, 然后将这些静态页面上传到`github`上, 由`github pages`的`static web server`部署这些静态页面.

他们的主要区别是:

- `md`到`html`的转换时机不同, `hexo`在本机完成, jekyll是由github pages完成
- 提交到github库里的文件不同, hexo是提交转换后的静态页面, jekyll是提交转换前的md文件

> [1] https://blog.csdn.net/baidu_25464429/article/details/80805237
> [2] https://www.jianshu.com/p/7c013faaaba1
> [3] Github Pages：https://docs.github.com/cn/pages

## Github Actions

manual.yml

```yaml
# This is a basic workflow that is manually triggered

name: Manual workflow

# Controls when the action will run. Workflow runs when manually triggered using the UI
# or API.
on:
  workflow_dispatch:
    # Inputs the workflow accepts.
    inputs:
      name:
        # Friendly description to be shown in the UI instead of 'name'
        description: 'Person to greet'
        # Default value if no value is explicitly provided
        default: 'World'
        # Input has to be provided for the workflow to run
        required: true

# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "greet"
  greet:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest

    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
    # Runs a single command using the runners shell
    - name: Send greeting
      run: echo "Hello ${{ github.event.inputs.name }}"
```

> [1] Github Action：https://docs.github.com/cn/actions

## Github REST API

要创建集成、检索数据和自动化工作流程，请使用 GitHub REST API 构建。

https://docs.github.com/cn/rest

## GitHub Flow

GitHub flow，顾名思义，就是 GitHub 所推崇的 Workflow。千万不要理解成 GitHub 上才能用的 Workflow。

其官网的描述为：

> GitHub flow is a lightweight, branch-based workflow that supports teams and projects where deployments are made regularly.

从中我们可以得出的信息是 —— *这段描述完全就是废话* GitHub flow 具有很高的通用性。

为了更便于了解 GitHub flow 的内容，我们从流程图入手：

GitHub 流是一个轻量级的、基于分支的工作流。GitHub 流程对所有人有用，而不仅仅是开发人员。例如，在 GitHub，我们将 GitHub 流用于我们的站点策略、文档和路线图。

![img](https://pic3.zhimg.com/80/v2-bafaef976e8842a50403d61912239b52_720w.jpg)

其中的主要流程为：

- 新建分支（Create a branch）；
- 提交修改（Add commits）；
- 创建PR（Open a Pull Request）；
- 代码评审（Discuss and review your code）；
- 部署（Deploy）；
- 合并（Merge）；

细心的同学可能很快会发现，GitHub flow 最大的亮点在于部署（Deploy）发生在 合并（Merge）之前，这就是 GitHub flow 的核心，非阻塞式集成 ——在产生任何副作用之前得知当前修改的所有集成效果，达到真正的持续集成。

常见的分支策略有以下三种：GitFlow、GitHubFlow以及GitLabFlow。

- GitFlow通常包含五种类型的分支：Master分支、Develop分支、Feature分支、Release分支以及Hotfix分支。

- GitHubFlow通常只有一个Master分支是固定的，而且GitHubFlow中的Master分支通常是受保护的，只有特定权限的人才可以向Master分支合入代码。
- 相比于GitHubFlow，GitLabFlow增加了对预生产环境和生产环境的管理，即Master分支对应为开发环境的分支，预生产和生产环境由其他分支（如Pre-Production、Production）进行管理。

> [1] http://t.zoukankan.com/huaweiyun-p-15014479.html
> [2] https://zhuanlan.zhihu.com/p/81396787
