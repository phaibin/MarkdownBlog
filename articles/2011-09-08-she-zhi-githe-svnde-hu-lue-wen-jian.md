---
layout: post
title: 设置Git和SVN的忽略文件
date: 2011-09-08 10:41
categories:
- iphone
tags:
- git
- svn
published: true
comments: true
---
Git：

新建~/.gitignore文件，加入：

.DS_Store  
xcuserdata

然后执行：

git config --global core.excludesfile ~/.gitignore

SVN：

编辑~/.subversion/config，取消global-ignores的注释，加入自己的内容
