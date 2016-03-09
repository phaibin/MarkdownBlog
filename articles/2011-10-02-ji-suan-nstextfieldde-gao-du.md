---
layout: post
title: 计算NSTextField的高度
date: 2011-10-02 08:56
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
为了让NSTextField在固定宽度下根据内容自适应高度，需要计算在指定宽度下字符串或者NSTextField的高度，找了很多方法，计算出来的高度都不是很精确。包括这篇文章所指定的方法：

<http://www.sheepsystems.com/sourceCode/sourceStringGeometrics.html>

最后根据这个帖子终于找到了最精确的计算方法：

<http://www.cocoabuilder.com/archive/cocoa/65081-nstextfield-sizing-to-fit.html>

方法为：

    NSTextField *textField = [[NSTextField alloc] initWithFrame:CGRectMake(0, 0, width, 1000)]; 
    textField.font = [NSFont boldSystemFontOfSize:13]; 
    textField.stringValue = s; 
    NSSize size = [textField.cell cellSizeForBounds:textField.frame]; 
    [textField release]; return size.height; 

也就是先建立一个NSTextField，用这个TextField来计算高度。虽然效率不高，暂时也只能先这么用了。