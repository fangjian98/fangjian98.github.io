---
title: Github To Blog
categories: Github
tags:
  - Github
  - Hexo
  - Node.js
abbrlink: 84ebc250
date: 2020-08-27 11:39:21
---

# 通过Github搭建个人博客blog

- github
- node.js
- hexo

<!-- more -->

## node.js安装

- 下载地址

[https://nodejs.org/en/download/](https://nodejs.org/en/download/)

- 测试

```bash
# 安装成功测试cmd
node -v
npm -v
```



## hexo安装与配置

```bsah
# cmd切换到blog文件夹下，输入安装hexo命令
npm install hexo -g

# 安装成功测试
hexo -v

# hexo初始化
hexo init

# 安装必要的组件
npm isntall

# 开启服务器
hexo g

# 显示本地博客地址，复制位置到浏览器打开后显示
hexo s

# 如果无法显示网页,说明端口可能被占用,更改端口便可
hexo server -p 4001
```

## git安装

- 下载地址

[https://git-scm.com/downloads](https://git-scm.com/downloads)

- 配置

```bash
# 生成rsa命令
cd ~/.ssh
ssh-keygen -t rsa -C "test@hotmail.com"

# 添加密钥到ssh-agent
eval "$(ssh-agent -s)"
# 添加生成的SSH key到ssh-agent
ssh-add ~/.ssh/id_rsa

# 将id_rsa.pub文件里的内容复制到add SSH keys

# 测试是否成功
ssh -T git@github.com
```

再blog文件夹中找到_config.yml文件，修改repo值(末尾)

```xml
deploy:
  type: git
  repo: git@github.com:test/test.github.io.git
  branch: master
```



## 创建新博客

- 流程


```bash
# 创建博客
hexo new "blog name"
# 博客生成
hexo g
# 博客部署
hexo d

# 博客生成+部署
hexo d -g
```

- 博客编辑器typora

[https://www.typora.io/](https://www.typora.io/)

- 博客图片上传问题

```bash
# 修改_config.yml里的psot_asset_folder:设置为true

# cmd执行
npm install hexo-asset-image --save
(或npm install https://github.com/CodeFalling/hexo-asset-image --save)

# 使用hexo new "blog name"新建博客时，_posts目录下会出现同名*.md和文件夹，图片放在此文件夹中
![](本地图片测试/logo.jpg) 
```



## 博客个性化设置




### 下载hexo主题（自选主题模板）

[https://hexo.io/themes/](https://hexo.io/themes/)

![theme](/images/assets/theme.jpg)

### 下载next主题

```bsah
git clone https://github.com/iissnan/hexo-theme-next themes/next
```

### 修改./blog/_config.yml

- 主题选择

```xml
# Extensions
## Plugins: https://hexo.io/plugins/
## Themes: https://hexo.io/themes/
theme: next
```

- 网页信息

```xml
# Site
title: Just_Paranoid
subtitle: 特立独行
description: ''
keywords: ''
author: fangjian98
language: zh-CN
timezone: ''
```

### 修改./blog/themes/next/_config.yml

- 选择主题样式
  Muse - 默认 Scheme，这是 NexT 最初的版本，黑白主调，大量留白
  Mist - Muse 的紧凑版本，整洁有序的单栏外观
  Pisces - 双栏 Scheme，小家碧玉似的清新
  Gemini - 左侧网站信息及目录，块+片段结构布局

```xml
# ---------------------------------------------------------------
# Scheme Settings
# ---------------------------------------------------------------

# Schemes
#scheme: Muse
#scheme: Mist
#scheme: Pisces
scheme: Gemini
```

- 网站图标

```xml
# ---------------------------------------------------------------
# Site Information Settings
# See: https://theme-next.org/docs/getting-started/
# ---------------------------------------------------------------

favicon:
  small: /images/favicon-16x16-next.png
  medium: /images/favicon-32x32-next.png
  apple_touch_icon: /images/apple-touch-icon-next.png
  safari_pinned_tab: /images/logo.svg
  #android_manifest: /images/manifest.json
  #ms_browserconfig: /images/browserconfig.xml
```

ico图标下载：[https://icons8.com/icons](https://icons8.com/icons),

ico图标制作：[http://www.bitbug.net/](http://www.bitbug.net/)

- 主页显示摘要

```bash
# Automatically excerpt description in homepage as preamble text.
excerpt_description: true

# Read more button
# If true, the read more button will be displayed in excerpt section.
read_more_btn: true
```

在文章中添加该标志，本文在首页的预览就会显示到这个段落为止。

```bsah
<!-- more -->
```

- 头像

```bsah
# Sidebar Avatar
avatar:
  # Replace the default image and set the url here.
  url: #/images/avatar.gif
  # If true, the avatar will be dispalyed in circle.
  rounded: false
  # If true, the avatar will be rotated with the cursor.
  rotated: false
```

- 社交链接

```bsah
# Social Links
# Usage: `Key: permalink || icon`
# Key is the link label showing to end users.
# Value before `||` delimiter is the target permalink, value after `||` delimiter is the name of Font Awesome icon.
social:
  #GitHub: https://github.com/yourname || fab fa-github
  #E-Mail: mailto:yourname@gmail.com || fa fa-envelope
  #Weibo: https://weibo.com/yourname || fab fa-weibo
  #Google: https://plus.google.com/yourname || fab fa-google
  #Twitter: https://twitter.com/yourname || fab fa-twitter
  #FB Page: https://www.facebook.com/yourname || fab fa-facebook
  #StackOverflow: https://stackoverflow.com/yourname || fab fa-stack-overflow
  #YouTube: https://youtube.com/yourname || fab fa-youtube
  #Instagram: https://instagram.com/yourname || fab fa-instagram
  #Skype: skype:yourname?call|chat || fab fa-skype
```

- 创建菜单

```
hexo new page "categories"
hexo new page "tags"
hexo new page "about"
```

```bsah
# ---------------------------------------------------------------
# Menu Settings
# ---------------------------------------------------------------

# Usage: `Key: /link/ || icon`
# Key is the name of menu item. If the translation for this item is available, the translated text will be loaded, otherwise the Key name will be used. Key is case-senstive.
# Value before `||` delimiter is the target link, value after `||` delimiter is the name of Font Awesome icon.
# When running the site in a subdirectory (e.g. yoursite.com/blog), remove the leading slash from link value (/archives -> archives).
# External url should start with http:// or https://
menu:
  home: / || fa fa-home
  about: /about/ || fa fa-user
  #tags: /tags/ || fa fa-tags
  #categories: /categories/ || fa fa-th
  archives: /archives/ || fa fa-archive
  #schedule: /schedule/ || fa fa-calendar
  #sitemap: /sitemap.xml || fa fa-sitemap
  #commonweal: /404/ || fa fa-heartbeat

# Enable / Disable menu icons / item badges.
menu_settings:
  icons: true
  badges: false
```

- 修改完主题后需要重新部署

```bash
hexo clean
hexo d -g
```

- 增加本地搜索

```bash
# 安装hexo-generator-searchdb，在站点的根目录下执行以下命令
npm install hexo-generator-searchdb --save
```

```bash
# 根目录_config.yml

# 配置站点搜索信息
search:
 path: search.xml
 field: post
 format: html
 limit: 10000
```

```bsah
# 修改themes/next/_config.yml

local_search:
 enable: true
```

- 显示浏览进度

```bash
back2top:
  enable: true
  # Back to top in sidebar.
  sidebar: false
  # Scroll percent label in b2t button.
  scrollpercent: true
```

- RSS

```bash
# 安装hexo-generator-feed
npm install hexo-generator-feed --save
```

```bash
# 添加_config.yml

# feed
# Dependencies: https://github.com/hexojs/hexo-generator-feed
feed:
  type: atom
  path: atom.xml
  limit: 20
  hub:
  content:
```

- 不开启不蒜子博客访问量统计

```bash
# Show Views / Visitors of the website / page with busuanzi.
# Get more information on http://ibruce.info/2015/04/04/busuanzi
busuanzi_count:
  enable: true
  total_visitors: true
  total_visitors_icon: fa fa-user
  total_views: true
  total_views_icon: fa fa-eye
  post_views: true
  post_views_icon: fa fa-eye
```

- 修改博文链接地址`/posts/xxxxx.html`

```bsah
npm install hexo-abbrlink --save

# 根目录下的 _config.yml 文件
permalink: posts/:abbrlink.html
abbrlink:
  alg: crc32  # 算法：crc16(default) and crc32
  rep: hex    # 进制：dec(default) and hex
```

- 首页title优化`网站名称-网站描述`

更改`index.swig`文件`your-hexo-site\themes\next\layout`

```xml
{% block title %} {{ config.title }} {% endblock %}
# 改成
{% block title %} {{ config.title }} - {{ theme.description }} {% endblock %}
```