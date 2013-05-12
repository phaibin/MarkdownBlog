---
layout: post
title: 修改TextMate中Python库的路径
date: 2012-07-09 10:58
categories:
- Python
tags:
- python
- textmate
published: true
comments: true
---
TextMate的项目基本就是记录文件的组合，没有很多多余的设置，所以要在项目文件中记录项目特有的环境变量是不可能了。这是它区别于一个真实的IDE的地方。

同事的python项目是用PyDev建的，里面包含了src和test两个目录，分别对应源码和测试的脚本。PyDev中可以自己配置好loading path，TextMate中如果运行test中的代码就不能自动loading src中的代码。没有办法，只好在TextMate的环境变量中加入一个PYTHONPATH，值为`./src:../src`

这样总算是不会出错了，而且也不至于太丑。
