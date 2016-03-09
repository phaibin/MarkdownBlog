---
layout: post
title: Xcode4.5删除老的模拟器
date: 2012-09-26 11:37
categories:
- iphone
tags:
- xcode
published: true
comments: true
---
首先进入
`/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs`
找到要删除的模拟器版本删除。

然后进入
`~/Library/Caches/com.apple.dt.Xcode/Downloads`
找到下载的模拟器dmg文件删除。

如果不删除dmg文件，下次启动Xcode会提示你重新安装。
