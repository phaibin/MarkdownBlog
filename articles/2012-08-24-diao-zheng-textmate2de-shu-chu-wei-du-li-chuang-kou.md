---
layout: post
title: 调整TextMate2的输出为独立窗口
date: 2012-08-24 11:07
categories:
- Python
tags:
- textmate
published: true
comments: true
---
TextMate2里运行结果默认在代码窗口下面，不是一个独立的窗口，如果要改回TextMate1的风格，可以运行下列命令：

    defaults write com.macromates.TextMate.preview htmlOutputPlacement window

参考TextMate的wiki：<http://wiki.macromates.com/FAQ/TextMate2ExpertPreferences>

另外有用的调整还有：

    defaults write com.macromates.TextMate.preview disableTabBarCollapsing -bool YES
    
用来设置当只有一个tab的时候也显示tabbar。
