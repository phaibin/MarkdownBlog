---
layout: post
title: 在预览中打开Unix Manual
date: 2011-08-25 10:29
categories:
- Mac
tags: []
published: true
comments: true
---
原文：<http://www.macworld.com/article/54155/2006/12/manpages.html>

在命令行中运行man可以输出某个命令的手册，但是查找起来不方便，可以通过一个小技巧把man的输出用preview来显示：

在.profile中加入下面的语句：

    pman()
    {
    man -t "${1}" | open -f -a /Applications/Preview.app/
    }

然后重新打开shell，运行pman ls，就会显示在预览中了。

原理是：man的-t参数会把输出格式化为PostScript，open的-f参数接收man的输出，-a指定用Preview来打开。预览程序可以实时地把PostScript转换为pdf。打开的pdf位于内存中，你可以保存到别的位置。
