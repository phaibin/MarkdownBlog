---
layout: post
title: 把本地Git仓库导入Github的方法
date: 2012-09-17 22:49
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
先为Github加一个远程主机

    $ git remote
    origin
    $ git remote add pb git://github.com/paulboone/ticgit.git
    $ git remote -v
    origin git://github.com/schacon/ticgit.git
    pb git://github.com/paulboone/ticgit.git

然后把代码推送到远程主机

    $ git push origin master
