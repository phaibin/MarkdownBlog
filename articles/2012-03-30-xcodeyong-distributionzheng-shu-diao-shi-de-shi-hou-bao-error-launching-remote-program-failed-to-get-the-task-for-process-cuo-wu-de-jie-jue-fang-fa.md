---
layout: post
title: 'XCode用Distribution证书调试的时候报“Error launching remote program: failed to get the task for process”错误的解决方法'
date: 2012-03-30 15:30
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
加入Entitlements.plist文件，加入一个字段“get-task-allow”，设为YES，在Targets->build Settings->Code Signing Entitlements确保选中你加入的Entitlements.plist文件。

4.2以上的版本没有加入Entitlements.plist文件的选项了，在target下面直接有一个Entitlements节，勾选之后就会生成一个.entitlements文件，操作同样。

官方的解释是这样的：

> get-task-allow, when signed into an application, allows other processes (like the debugger) to attach to your app. Distribution profiles require that this value be turned off, while development profiles require this value to be turned on (otherwise Xcode would never be able to launch and attach to your app).
