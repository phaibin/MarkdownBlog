---
layout: post
title: 卸载MacRuby的方法
date: 2012-03-23 23:05
categories:
- Cocoa
tags:
- macruby
published: true
comments: true
---
首先用pkgutil命令找到安装的那个pkg：

    pkgutil --pkgs |grep -i ruby # get all related to ruby

然后找到安装的文件：

    pkgutil --files com.apple.macrubyNightlyBuild.macruby-nightly.pkg
    
然后逐一删掉它们
