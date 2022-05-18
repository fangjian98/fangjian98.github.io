---
title: 常用的Git命令
categories: Git
tags: Git
abbrlink: 5c7291e7
date: 2021-05-20 22:26:04
---

> 这里将列出常用的Git命令，包括初始化仓库、配置、增删、提交、分支、标签、状态信息、远程同步、撤销等其他。

<!-- more -->

## Git 常用命令

**Git配置**

```bash
$ git config --global user.email "xxx@xx.com"

$ git config user.name
fangjian98

# 生成ssh key
Admin@PS2020KDZVZTZQ MINGW64 ~/learngit (master)
$ ssh-keygen -t rsa -C "xxx@xx.com"
Generating public/private rsa key pair.
Enter file in which to save the key (/c/Users/Admin/.ssh/id_rsa):
Created directory '/c/Users/Admin/.ssh'.
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in /c/Users/Admin/.ssh/id_rsa
Your public key has been saved in /c/Users/Admin/.ssh/id_rsa.pub
The key fingerprint is:
SHA256:mc855CP9q3vjn17hFWn37pbuYmjqZ4OL8CbrNgjK2GU 2360870585@qq.com
The key's randomart image is:
+---[RSA 3072]----+
|                 |
|                .|
|               +.|
|         o    . +|
|        S .    .o|
| .  E    * .  ..o|
|+..o..  . X .  .+|
|o... +o..o Xoo =.|
|    oo=o.+O=*=B+.|
+----[SHA256]-----+

# 查看ssh key
$ cat ~/.ssh/id_rsa.pub
```
**Git项目常用命令**

```bash
$ pwd
/c/Users/Admin/learngit

$ git init
$ git add readme.txt
$ git commit -m "write a readme file"
[master (root-commit) 5a5268c] wrote a readme file
 1 file changed, 2 insertions(+)
 create mode 100644 readme.txt
$ git push origin master
 
$ git branch
$ git status.
$ git diff readme.txt
$ git log
$ git log --pretty=oneline
$ git reset --hard HEAD^
$ cat readme.txt
$ git checkout -- readme.txt
$ git rm test.txt
$ git pull
$ rm test.txt

# Github提交远程仓库
Admin@PS2020KDZVZTZQ MINGW64 ~/learngit (master)
$ git remote add origin git@github.com:fangjian98/learngit.git

Admin@PS2020KDZVZTZQ MINGW64 ~/learngit (master)
$ git push -u origin master 

# 查看帮助
$ git help

# git log常用参数：after之后的记录，before之前的记录
git log --oneline --all --grep="status" --author="fangjian" --after="2019-01-01" --before="2020-01-01"

# grep 忽略大小写
grep -i   
```

**其他知识**

```bash
# Git三种状态
committed
staged
modified

# GIt文件机制：.git目录下
·HEAD	文件存放根节点的信息（目录结构是树形结构）
·refs	目录存储当前版本控制目录下的各种引用：heads（不同根）、remotes（远程版本库）、stash（Git栈）、tags（标签）
·logs	目录根据不同的引用存储了日志信息

# 常见命令
git init
gir clone
git status
git log

git add
git commit
git rm

git push origin master
git fetch
git merge
git pull = git fetch + git merge

git reset --hard HEAD		还原至上一个提交
git checkout HEAD <path>	从HEAD中签出并且恢复成未修改的样子

git revert HEAD			撤销旧的提交
git commit --amend		修改刚才的这个提交

reset：是要reset到指定commit位置的状态
	git reset -mixed
	git reset -hard
revert：file rollback并且自动产生一个roll back的commit
	git revert HEAD
	git revert HEAD^
	git revert <commit>

git diff <path>
git diff --cached <path>
git diff HEAD <path>
```

## Git 常用命令详解

### 仓库

```
# 在当前目录新建一个Git代码库
$ git init

# 新建一个目录，将其初始化为Git代码库
$ git init [project-name]

# 下载一个项目和它的整个代码历史
$ git clone [url]
```

### 配置

```
# 显示当前的Git配置
$ git config --list

# 编辑Git配置文件
$ git config -e [--global]

# 设置提交代码时的用户信息
$ git config [--global] user.name "[name]"
$ git config [--global] user.email "[email address]"
```

### 增加/删除文件

```
# 添加指定文件到暂存区
$ git add [file1] [file2] ...

# 添加指定目录到暂存区，包括子目录
$ git add [dir]

# 添加当前目录的所有文件到暂存区
$ git add .

# 添加每个变化前，都会要求确认
# 对于同一个文件的多处变化，可以实现分次提交
$ git add -p

# 删除工作区文件，并且将这次删除放入暂存区
$ git rm [file1] [file2] ...

# 停止追踪指定文件，但该文件会保留在工作区
$ git rm --cached [file]

# 改名文件，并且将这个改名放入暂存区
$ git mv [file-original] [file-renamed]
```

### 代码提交

```
# 提交暂存区到仓库区
$ git commit -m [message]

# 提交暂存区的指定文件到仓库区
$ git commit [file1] [file2] ... -m [message]

# 提交工作区自上次commit之后的变化，直接到仓库区
$ git commit -a

# 提交时显示所有diff信息
$ git commit -v

# 使用一次新的commit，替代上一次提交
# 如果代码没有任何新变化，则用来改写上一次commit的提交信息
$ git commit --amend -m [message]

# 重做上一次commit，并包括指定文件的新变化
$ git commit --amend [file1] [file2] ...
```

### 分支

```
# 列出所有本地分支
$ git branch

# 列出所有远程分支
$ git branch -r

# 列出所有本地分支和远程分支
$ git branch -a

# 新建一个分支，但依然停留在当前分支
$ git branch [branch-name]

# 新建一个分支，并切换到该分支
$ git checkout -b [branch]

# 新建一个分支，指向指定commit
$ git branch [branch] [commit]

# 新建一个分支，与指定的远程分支建立追踪关系
$ git branch --track [branch] [remote-branch]

# 切换到指定分支，并更新工作区
$ git checkout [branch-name]

# 切换到上一个分支
$ git checkout -

# 建立追踪关系，在现有分支与指定的远程分支之间
$ git branch --set-upstream [branch] [remote-branch]

# 合并指定分支到当前分支
$ git merge [branch]

# 选择一个commit，合并进当前分支
$ git cherry-pick [commit]

# 删除分支
$ git branch -d [branch-name]

# 删除远程分支
$ git push origin --delete [branch-name]
$ git branch -dr [remote/branch]
```

### 标签

```
# 列出所有tag
$ git tag

# 新建一个tag在当前commit
$ git tag [tag]

# 新建一个tag在指定commit
$ git tag [tag] [commit]

# 删除本地tag
$ git tag -d [tag]

# 删除远程tag
$ git push origin :refs/tags/[tagName]

# 查看tag信息
$ git show [tag]

# 提交指定tag
$ git push [remote] [tag]

# 提交所有tag
$ git push [remote] --tags

# 新建一个分支，指向某个tag
$ git checkout -b [branch] [tag]
```

### 查看信息 

```
# 显示有变更的文件
$ git status

# 显示当前分支的版本历史
$ git log

# 显示commit历史，以及每次commit发生变更的文件
$ git log --stat

# 搜索提交历史，根据关键词
$ git log -S [keyword]

# 显示某个commit之后的所有变动，每个commit占据一行
$ git log [tag] HEAD --pretty=format:%s

# 显示某个commit之后的所有变动，其"提交说明"必须符合搜索条件
$ git log [tag] HEAD --grep feature

# 显示某个文件的版本历史，包括文件改名
$ git log --follow [file]
$ git whatchanged [file]

# 显示指定文件相关的每一次diff
$ git log -p [file]

# 显示过去5次提交
$ git log -5 --pretty --oneline

# 显示所有提交过的用户，按提交次数排序
$ git shortlog -sn

# 显示指定文件是什么人在什么时间修改过
$ git blame [file]

# 显示暂存区和工作区的差异
$ git diff

# 显示暂存区和上一个commit的差异
$ git diff --cached [file]

# 显示工作区与当前分支最新commit之间的差异
$ git diff HEAD

# 显示两次提交之间的差异
$ git diff [first-branch]...[second-branch]

# 显示今天你写了多少行代码
$ git diff --shortstat "@{0 day ago}"

# 显示某次提交的元数据和内容变化
$ git show [commit]

# 显示某次提交发生变化的文件
$ git show --name-only [commit]

# 显示某次提交时，某个文件的内容
$ git show [commit]:[filename]

# 显示当前分支的最近几次提交
$ git reflog
```

### 远程同步

```
# 下载远程仓库的所有变动
$ git fetch [remote]

# 显示所有远程仓库
$ git remote -v

# 显示某个远程仓库的信息
$ git remote show [remote]

# 增加一个新的远程仓库，并命名
$ git remote add [shortname] [url]

# 取回远程仓库的变化，并与本地分支合并
$ git pull [remote] [branch]

# 上传本地指定分支到远程仓库
$ git push [remote] [branch]

# 强行推送当前分支到远程仓库，即使有冲突
$ git push [remote] --force

# 推送所有分支到远程仓库
$ git push [remote] --all
```

### 撤销

```
# 恢复暂存区的指定文件到工作区
$ git checkout [file]

# 恢复某个commit的指定文件到暂存区和工作区
$ git checkout [commit] [file]

# 恢复暂存区的所有文件到工作区
$ git checkout .

# 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
$ git reset [file]

# 重置暂存区与工作区，与上一次commit保持一致
$ git reset --hard

# 重置当前分支的指针为指定commit，同时重置暂存区，但工作区不变
$ git reset [commit]

# 重置当前分支的HEAD为指定commit，同时重置暂存区和工作区，与指定commit一致
$ git reset --hard [commit]

# 重置当前HEAD为指定commit，但保持暂存区和工作区不变
$ git reset --keep [commit]

# 新建一个commit，用来撤销指定commit
# 后者的所有变化都将被前者抵消，并且应用到当前分支
$ git revert [commit]

暂时将未提交的变化移除，稍后再移入
$ git stash
$ git stash pop
```

### 其他

```
# 生成一个可供发布的压缩包
$ git archive
```



