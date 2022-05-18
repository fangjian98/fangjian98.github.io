---
title: Git的基本使用
categories: Git
tags:
  - Git
  - rebase
abbrlink: 163a8691
date: 2021-05-28 20:29:35
---

> Git的基本使用是需要掌握的基本概念和命令，以及掌握一些高级用法，如git rebase、git stash等。

<!-- more -->

### Git的基本使用

1.	第一次使用git需要使用命令 `git config --global user.name <name>` 、`git config --global user.email <email>` 配置好git的用户名和邮箱
2.	在本地测试仓库，不需要配置ssh公钥，但是在诸如码云或者其他远程服务器上进行仓库关联需要使用ssh公钥进行关联。使用命令`ssh-keygen -t rsa <emial> `可以在本地生成一个ssh公钥，之后登陆码云后将秘钥黏贴进去，即可在本地与远程仓库之间建立连接
3.	生成本地仓库，首先在需要生成仓库的位置右键点击git bash here ，输入git init 即可在当前目录下生成一个.git文件夹，这就是本地仓库的位置啦
4.	我们可以输入命令 touch readme.txt 来在当前目录下生成一个文件，以这个文件为例，测试git的拉取和上传功能。输入命令git status，即可查看当前没有上传至暂存处的修改或者新建的文件，这时就需要我们进行后续的一套操作。
5.	输入命令`git add . `即可将这些文件存放至暂存区，这个区域是不可见得，所以不用区找，我们可以再次输入`git status `查看当前的文件的状态。可以发现这些文件都存进暂存区了。
6.	输入命令`git commit -m <注释> `这是把当前在暂存区的文件或者操作完成的文件（比如git rm后的文件）全部提交到git本地仓库中去，这就完成了文件的提交。再次查看git status 可以发现这些文件都消失了，说明文件都提交上去了。
7.	这里可以使用`git reset`进行版本的回溯，输入`git log` 查看commit 的版本号，再次输入，git reset --hard <版本号> 可以回滚到之前的提交版本。
8.	到了这里本地仓库的操作都完成了，接下来是进行与远程仓库之间的关联和文件的上传了。输入命令 `git remote add origin <关联的远程仓库的地址>:<ssh仓库的路径> `这就和远程仓库进行关联了，有时候这里会弹出错误 （remote origin already exists）这表明已经与其它远程仓库进行关联了，输入命令`git remote rm origin `将当前关联的远程仓库删除即可。
9.	下面进行远程仓库的文件的拉取，这一步是必要的，因为如果与远程仓库的文件不同步，可能会发生冲突，因此建议这里在push前都要pull一下，避免冲突。输入命令`git pull --rebase origin master`(这里的pull其实包含 fetch 和merge两个操作，即fetch解决冲突问题，merge就是将文件合并），最后就可以愉快地进行代码地上传了，输入命令`git push -u origin master`(输入-u，在下一次使用push时可以直接git push，不用敲 origin master了），转到码云刷新仓库即可看到刚刚上传的文件已经显示在仓库中了。

### Git 分支

Git分支可以理解为一个链表，插入新的分支，就是在链表的一个节点上插入新的链表，而分支的合并分情况讨论，如果主支没有修改，而插入的分支进行了修改，那么在合并的时候就将指针也就是master指向了最新的一次commit节点。而如果主支修改的同时，插入的分支也修改了，那么在合并的时候就需要解决冲突，可能两个修改的分支会并存，这时候可以用git log查看commit的日志。
注意：在初始化一个git仓库后，首先需要在仓库中存入一个任意的文件，如果直接创建分支，那么默认分支，也就是master会消失，取而代之的是默认分支变为主支。

- 分支的创建，输入命令git branch <分支名>
- 分支的切换，输入命令git checkout <分支名>
- 分支的创建和切换，分支的创建并且切换到该分支，git checkout -b <分支名>
- 查看当前的所有分支，输入命令git branch
- 行显示日志，输入命令git log --decorate --oneline
- 图像化显示日志，输入命令 git log --decorate --oneline -graph -all
- 本地分支合并 git merge <分支名>

### Git diff

- 比较当前工作区未提交内容与最后一次commit内容的不同之处git diff
- 比较暂存区(已经add，但是未commit的内容) 和最后一次commit的区别git diff --catched / git diff --staged
- 显示工作目录，新创建但未add的文件，和暂存区已经add但未commit的文件，与最后一次commit的区别git diff HEAD
- 比较两个分支上的最后commit 的区别git diff <branch1> <branch2>
- 比较两个分支log有什么区别git log <branch1>...<branch2>
- 比上面更清楚的知道区别git log --left-right <branch>...<branch2>

### Git stash

Git stash 主要功能就是，将当前的工作区保存，之后再使用git status查看可以发现当前工作区变干净了。想要恢复时，使用git checkout 切换分支，再使用git stash pop恢复即可。
注意：多次使用git stash后，可以使用git stash list查看保存的列表，使用git stash apply恢复，或者使用git stash drop删除。

### Git rebase

Git rebase 主要使用在分支合并的操作上，因此从远程下拉代码、本地分支合并并提交都会用到rebase命令。

1. 我们可以使用rebase合并多个commit为一个commit，这样在log中就能更加清爽整洁，使用命令 git rebase -i [开始版本号] [结束版本号] /或者 git rebase -i HEAD~[一个区间数字]，之后使用如下命令进行操作即可。

- pick：保留该commit（缩写:p）
- reword：保留该commit，但我需要修改该commit的注释（缩写:r）
- edit：保留该commit, 但我要停下来修改该提交(不仅仅修改注释)（缩写:e）
- squash：将该commit和前一个commit合并（缩写:s）
- fixup：将该commit和前一个commit合并，但我不要保留该提交的注释信息（缩写:f）
- exec：执行shell命令（缩写:x）
- drop：我要丢弃该commit（缩写:d）

2. 此外我们可以使用rebase可以将commit黏贴到另外一个分支上，使用命令 git rebase [开始版本号] [结束版本号] --onto [分支名]。
