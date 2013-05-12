---
layout: post
title: 打开XCode的NSZombieEnabled选项
date: 2011-05-24 06:40
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>NSZombieEnabled是一个开关，打开之后可以在你试图访问一个释放的对象的时候显示一条警告，有助于调试代码。</p>
<p>方法是在app的执行变量里面加上：NSZombieEnabled: YES。</p></p>
