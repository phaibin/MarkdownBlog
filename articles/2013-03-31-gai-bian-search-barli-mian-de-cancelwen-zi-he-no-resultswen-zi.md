---
layout: post
title: 改变search bar里面的cancel文字和no results文字
date: 2013-03-31 10:30
categories:
- iphone
tags:
- iphone
- searchbar
published: true
comments: true
---
如果不需要国际化的话把这两个文字改为中文很方便，之前都是在控件中遍历，其实完全没那么麻烦。只需要在info.plist文件中加入一条：

    Localization native development region

值为cn或者China。这样修改之后还需要在项目中把国际化的设置删掉，并且en.lproj这样的目录也要删掉。
还有很多跟区域有关的控件也会产生变化，比如Edit、Delete按钮。
