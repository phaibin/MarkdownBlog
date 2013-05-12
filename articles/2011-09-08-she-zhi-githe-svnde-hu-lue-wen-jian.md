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
<p><p>Git：</p>
<p>新建~/.gitignore文件，加入：</p>
<p>.DS_Store<br />xcuserdata</p>
<p>然后执行：</p>
<p>git config --global core.excludesfile ~/.gitignore</p>
<p>SVN：</p>
<p>编辑~/.subversion/config，取消global-ignores的注释，加入自己的内容</p></p>
