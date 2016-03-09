---
layout: post
title: python脚本中正确的Shebang写法
date: 2012-07-09 00:17
categories:
- Python
tags:
- python
published: true
comments: true
---
Shell脚本开头可以加入#!开头的一行用以标明可执行文件的具体路径，如：

    #! /usr/bin/python

\#!后面可以跟一个或多个空白。

这种写法可执行文件的路径是固定的，但是如果安装了多个版本的python，或者多人协同开发就不够灵活了。

另外一种官方推荐的写法是：

    #! /usr/bin/env python

这种写法会根据你的环境变量配置找到正确的python版本。之前我很诧异这种写法是怎么工作的，后来发现原来env是一条命令，运行之后会显示当前的环境配置。而env python则会根据当前的环境配置决断出适当的python位置并且运行。

所以如果项目组的每个人都用这种方式来配置脚本，就不会发生因为每个人环境不同而不能运行的情况了。
