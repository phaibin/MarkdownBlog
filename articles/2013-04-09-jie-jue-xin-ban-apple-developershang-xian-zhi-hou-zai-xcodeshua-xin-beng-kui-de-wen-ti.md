---
layout: post
title: 解决新版apple developer上线之后在XCode刷新崩溃的问题
date: 2013-04-09 18:40
categories:
- iphone
tags: []
published: true
comments: true
---
Remove this file:

	~/Library/Developer/Xcode/connect1.apple.com 4.6.1.db
  
before running Xcode 4.6.1.
