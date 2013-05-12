---
layout: post
title: iphone里UserDefaults保存的位置
date: 2011-11-09 05:45
categories:
- iphone
tags:
- iphone
- UserDefaults
published: true
comments: true
---
原来在iphone里面UserDefaults是保存在一个plist文件中的，这个文件的路径是：

    <UUID for your App>/Library/Preferences/<your App’s bundle ID>.plist
    
不知道在Mac里面是怎么保存的。
