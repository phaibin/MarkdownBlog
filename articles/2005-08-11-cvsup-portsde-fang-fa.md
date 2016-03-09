---
layout: post
title: CVSup ports的方法
date: 2005-08-11 00:39
categories:
- FreeBSD
tags: []
published: true
comments: true
---
1. 用sysinstall安装 net/cvsup package
2. 拷贝 /usr/share/examples/cvsup/ports-supfile 到一个新的目录, 如 /root 或你的主目录
3. 编辑 ports-supfile, 修改 *default host=CHANGE_THIS.FreeBSD.org 为cvsup3.FreeBSDChina.org
4. 运行 cvsup -g -L 2 /root/ports-supfile

      -g告诉 CVSup 不要使用 GUI。如果您 没在运行 X11 这个是自动的，否则您必须指定它。
      
      -L 2 告诉 CVSup 输出所有正在升级的文件的细节。 有三个等级可以选择，从 -L 0 到 -L 2。默认是 0，意味着除了错误消息 什么都不输出。