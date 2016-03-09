---
layout: post
title: Textmate通过RVM设置ruby版本
date: 2013-01-10 15:42
categories:
- RoR
tags: []
published: true
comments: true
---
原文：<http://www.doself.com/?post=96>

1. 首先找到rvm-auto-ruby的位置，打开终端执行

        which rvm-auto-ruby

    我的返回：`/usr/local/rvm/bin/rvm-auto-ruby`

2. 给Textmate设置增加一个变量，名为`TM_RUBY`，值为`/usr/local/rvm/bin/rvm-auto-ruby`
