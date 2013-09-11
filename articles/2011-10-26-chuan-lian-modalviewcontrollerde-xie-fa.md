---
layout: post
title: 串联ModalViewController的写法
date: 2011-10-26 15:34
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
有的时候需要在dismiss第一个ModalViewController之后马上present第二个，今天就碰到了这个问题。但是第二个死活就不出来，搜索了一下原来要这么写才可以：

    [self.navigationController dismissModalViewControllerAnimated:NO]; // dismiss without animation 
    [self.navigationController presentModalViewController:anotherViewController animated:YES];
