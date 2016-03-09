---
layout: post
title: 用lipo命令合并静态库
date: 2013-02-01 13:46
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
参考：<http://blog.csdn.net/arthurchenjs/article/details/6044616>

    lipo –create Release-iphoneos/libiphone.a Debig-iphonesimulator/libiphone.a –output libiphone.a
这样生成的库可以在编译的时候自动识别。

    lipo -info libiphone.a
可以查看这个库编译的平台
