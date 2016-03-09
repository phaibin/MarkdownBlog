---
layout: post
title: 查找所有的.svn目录并删除
date: 2012-04-05 14:15
categories:
- Mac
tags:
- mac
published: true
comments: true
---
在命令行下面运行：

    cd /some/of/your/folders/
    rm -rf `find . -type d -name .svn`
