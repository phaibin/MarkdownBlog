---
layout: post
title: 界面底端出现一条空白，20pixel的问题
date: 2011-12-29 13:47
categories:
- iphone
tags: []
published: true
comments: true
---
今天碰到一个相当奇怪的问题，设置好了view的大小，可是总是跑到屏幕的顶端，也就是跑到了status bar的下面。所以屏幕的最下面就出现了一个白条，刚好是status bar的大小。

我现在的环境是xcode4.2.1+iOS5。通过替换代码和环境，试验了无数的组合，包括用改用iOS4的模拟器，用xcode4.1建立项目，把rootViewController改为addSubview。最后终于搞明白了根本原因：

- 用rootViewController不会有这样的问题（rootViewController会自动调整view的大小）
- 用xcode4.2建立项目和xcode4.1的区别是，xcode4.1是用xib建立的rootViewController，而xcode4.2直接省略了MainWindow.xib，改用了initWithNibName:bundle:方法。用xib加入ViewController的时候可以设置这么一个属性："Resize View From NIB"，于是会自动调整view的大小充满整个屏幕。而这个属性又是默认设置的，所以用xcode并且用xib建立ViewController的话根本不会碰到这个问题。而initWithNibName:bundle:方法则不会帮你做这些事情，你只能自己调整。

可惜"Resize View From NIB"并不是ViewController的一个属性，估计原理还是直接设置view的frame，所以修复方法也很简单，加入这么一句：

    [self.viewController.view setFrame:[[UIScreen mainScreen] applicationFrame]];

参考链接：

<http://stackoverflow.com/questions/2247647/offset-on-uiwindow-addsubview>

<http://blog.csdn.net/shark0001/article/details/6580084>

PS：最诡异的事情是这么基础的问题居然到今天才暴露出来
 
