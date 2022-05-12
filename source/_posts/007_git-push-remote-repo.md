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