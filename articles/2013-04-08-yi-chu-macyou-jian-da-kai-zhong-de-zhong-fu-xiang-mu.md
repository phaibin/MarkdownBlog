---
layout: post
title: 移除Mac右键打开中的重复项目
date: 2013-04-08 22:30
categories:
- Mac
tags:
- mac
published: true
comments: true
---
在命令行中执行下面的命令：

    /System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user

然后重启Finder：

    killall Finder
