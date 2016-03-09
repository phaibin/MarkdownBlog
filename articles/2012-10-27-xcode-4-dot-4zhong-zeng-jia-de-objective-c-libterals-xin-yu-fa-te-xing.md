---
layout: post
title: Xcode 4.4中增加的“Objective-C Libterals"新语法特性
date: 2012-10-27 20:41
categories:
- iphone
tags: []
published: true
comments: true
---
今天用Xcode建项目看到了一行很奇怪的代码：
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
之前从来没有见过@这样的用法，真的是太古怪了。

然后搜索了一下，原来是Xcode 4.4启用新的LLVM 4.0编译器之后，增加的新的Objective-C语法特性。在Xcode 4.4的release notes里面提到：
    LLVM 4.0 Compiler
    Xcode now includes the Apple LLVM Compiler version 4.0, including the following new Objective-C language features: [...]
    - Objective-C literals: create literals for NSArray, NSDictionary, and NSNumber, just the same as the literals for NSString
就是类似NSString用@创建常量的方法，给NSArray、NSDictionary、NSNumber等几个类增加了同样的语法。

使用方法：
    array = [NSArray arrayWithObjects:a, b, c, nil];       =>          array = @[a, b, c];
    dict = [NSDictionary dictionaryWithObjects:@[o1, o2, o3] forKeys:@[k1, k2, k3]];       =>        dict = @{k1: o1, k2 : o2, k3 : o3};
    number = [NSNumber numberWithChar:'x'];         =>        number = @'x';
    number = [NSNumber numberWithInt:12345];         =>        number = @12345;
    [arr objectAtIndex:index]      =>        arr[index]
    [dict objectForKey:key]       =>         dict[key]
其实很多种语言都是这么用的，Objective-C之前的写法才古怪，但是现在写多了反而觉得不习惯了。

参考：<http://stackoverflow.com/questions/9347722/what-are-the-details-of-objective-c-literals-mentioned-in-the-xcode-4-4-releas>

<http://cocoaheads.tumblr.com/post/17757846453/objective-c-literals-for-nsdictionary-nsarray-and>
