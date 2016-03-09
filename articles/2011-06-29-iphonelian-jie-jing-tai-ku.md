---
layout: post
title: iphone连接静态库
date: 2011-06-29 03:35
categories:
- iphone
tags: []
published: true
comments: true
---
1. 建立一个Cocoa Touch Static Library项目，写自己的库代码
2. 把静态库项目文件拖到调用的项目里面
3. 在Target右边选择Build Phases标签
4. 在Link Binary With library里面选择库的编译文件(.a)
5. 在项目配置里面搜索“Header Search Paths"，加入静态库项目的位置
6. 编译。