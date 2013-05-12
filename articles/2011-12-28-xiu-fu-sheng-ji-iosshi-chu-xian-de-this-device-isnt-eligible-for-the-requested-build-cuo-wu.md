---
layout: post
title: 修复升级iOS时出现的“This device isn’t eligible for the requested build”错误
date: 2011-12-28 22:56
categories:
- iphone
tags: []
published: true
comments: true
---
找到hosts里面的：

    74.208.151.171 gs.apple.com
    
把这行删掉或者注释掉。真搞不清这行是什么工具加上去的。
