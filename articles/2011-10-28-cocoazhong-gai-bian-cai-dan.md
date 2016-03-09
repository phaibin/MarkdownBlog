---
layout: post
title: Cocoa中改变菜单
date: 2011-10-28 11:06
categories:
- Cocoa
tags:
- cocoa
- 菜单
published: true
comments: true
---
实现NSWindowDelegate的方法：

    - (void)windowDidBecomeKey:(NSNotification *)notification

然后调用NSApplication的`- (void)setMainMenu:(NSMenu *)aMenu`方法
