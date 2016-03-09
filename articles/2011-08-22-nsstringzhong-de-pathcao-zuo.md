---
layout: post
title: NSString中的path操作
date: 2011-08-22 03:38
categories:
- iphone
tags:
- NSString
published: true
comments: true
---
- lastPathComponent：返回path的最后一部分，比如文件或者目录的名字
- pathExtension: 返回path最后一部分的扩展名，比如.txt
- stringByExpandingTildeInPath: 把表示用户主目录的~展开
- stringByDeletingLastPathComponent: 返回path最后一部分之前的部分，就是文件或者目录的完整路径
- stringByDeletingPathExtension：返回path除掉文件扩展名之后的部分
- stringByAppendingPathComponent: 把一个字符串作为path的一部分加进去，自动判断字符串是否包含路径分隔符

获取特殊目录的方便方法：

- NSUserName()：unix-style用户名
- NSFullUserName()：用户全名
- NSHomeDirectory()：用户的home目录
- NSTemporaryDirectory()：temp目录

NSHomeDirectory()在cocoa touch中也可以用，返回的是app的根目录。
