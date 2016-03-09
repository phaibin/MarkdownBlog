---
layout: post
title: Mac命令行设置代理
date: 2012-02-01 22:23
categories:
- Mac
tags: []
published: true
comments: true
---
悲剧的公司网络，要设置代理才可以上网，而且封锁了很多网站。今天走命令行下安装homebrew，总是报无法访问主机，还以为是curl的问题，研究了半天，突然想起来要设置代理才可以上网，命令行下面肯定也需要设置。google了一下原来方法是这样的：

编辑.bash_profile，加入：

    export http_proxy=127.0.0.1:8000
    export ftp_proxy=127.0.0.1:8000

这样就可以了。然后命令行下面也可以访问网络了。
