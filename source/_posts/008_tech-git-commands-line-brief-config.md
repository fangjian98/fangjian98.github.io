---
title: Git命令简写的配置
abbrlink: 8b0e152
date: 2021-05-17 10:29:48
categories: Git
tags: Git
---

> 在使用Git工具时，有些命令比较常用，为了加快输入速度，可以自定义一些简写配置，能提高我们提交代码的效率。

<!-- more -->

- 编辑Git配置文件且显示配置文件路径

```
git config --global -e
```

- 配置文件` ~/.gitconfig`

```bash
[user]
  name = xxxxx
  email = xxxx@mail.com
[core]
  editor = vim
[alias]
    a = add
    co = checkout
    cm = commit
    st = status
    pl = pull
    ps = push
    df = diff
    lg = log
    cp = cherry-pick
    ca = commit --amend
    br = branch
    mg = merge
    dt = difftool
    mt = mergetool
    lo = log --oneline
    lg = log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cd) %C(bold blue)<%an>%Creset' --abbrev-commit
```

-  查看Git配置

```bash
git config --global -l
```

