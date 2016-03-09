---
layout: post
title: 反转数组
date: 2011-11-07 07:31
categories:
- iphone
tags:
- iphone
- NSArray
published: true
comments: true
---
数组常有反转的需要，比如替换字符串的时候需要从尾端开始就不会有问题。一个遍历的简便方法是：

    for (id object in [array reverseObjectEnumberator])

要得到反转的数组也不麻烦：

    NSArray* reversedArray = [[startArray reverseObjectEnumerator] allObjects];
 
