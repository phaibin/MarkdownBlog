---
layout: post
title: 改变当前页面从别的页面回退时的名字
date: 2011-11-03 05:41
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
这个问题不太好解释。当一个ViewController被push到NavigationController的时候，下一个页面的左上角一般显示这个ViewController的title。这个问题就是改变这个回退按钮的文字。其实这个文字不是在第二个页面改，而是在第一个页面里面改。代码为：

    UIBarButtonItem *temporaryBarButtonItem=[[UIBarButtonItem alloc] init]; 
    temporaryBarButtonItem.title=@"Back"; 
    self.navigationItem.backBarButtonItem = temporaryBarButtonItem; 
    [temporaryBarButtonItem release];
