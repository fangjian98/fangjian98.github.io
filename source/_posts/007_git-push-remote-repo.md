---
title: Git初始化配置
abbrlink: 66ea434c
date: 2021-05-16 23:57:43
categories: Git
tags: Git
---

> 我们推荐创建的Git仓库都包含一个`README`、`LICENSE`和`.gitignore`，这里将学习创建本地分支、远程仓库推送和修改远程仓库Url。

<!-- more -->


### 创建新仓库

```
echo "# gitblog" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:fangjian98/gitblog.git
git push -u origin main
```

### 推送本地仓库

```
git remote add origin git@github.com:fangjian98/gitblog.git
git branch -M main
git push -u origin main
```

### 更新本地仓库 Remote Url

```bash
git remote -v
git remote remove origin
git remote add origin https://gitcode.net/xxxx.git

# 或者是使用 SSH 地址
git remote add origin git@gitcode.net:xxxx.git
```

### 添加子模块

```bash
# 删除仓库索引
# 如果是文件
git rm --cached reference/esp-qcloud
# 如果是文件夹
git rm -r --cached reference/esp-qcloud
# 如果执行以上命令后提示：[error: 如下文件其暂存的内容和工作区及 HEAD 中的都不一样：] ，`-f`强制删除
git rm -r -f --cached reference/esp-qcloud

# 添加仓库索引
# 创建子模块并添加 url 地址
git submodule add <url> project
# 例如：
git submodule add https://gitee.com/JavonPeng/project.git reference/esp-qcloud
# 或者使用 ssh 地址
git submodule add git@gitee.com:JavonPeng/project.git reference/esp-qcloud

添加成功后会生成.gitmodules文件，即添加子模块
```

### 查看仓库配置信息

```bash
PS D:\CodeSpace\openAI> cat .\.git\config
[core]
        repositoryformatversion = 0
        filemode = false
        bare = false
        logallrefupdates = true
        symlinks = false
        ignorecase = true
[remote "origin"]
        url = git@github.com:fangjian98/openAI.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
        remote = origin
        merge = refs/heads/main
[branch "dev"]
        remote = origin
        merge = refs/heads/dev
```

### 配置远程仓库

```bash
# 拉去指定远程仓库分支到本地
git pull <remote> <branch>

# 配置远程仓库分支
git branch --set-upstream-to=origin/<branch> dev

# 查看.git/config 对应分支
[branch "dev"]
        remote = origin
        merge = refs/heads/dev
```
