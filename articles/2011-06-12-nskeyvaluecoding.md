---
layout: post
title: NSKeyValueCoding
date: 2011-06-12 03:50
categories:
- iphone
tags: []
published: true
comments: true
---
NSKeyValueCoding是NSObject上面的一个informal protocol，主要提供了– valueForKey:和– setValue:forKey:两个方法。

但是集合类提供了不同的实现，将valueForKey:发送给数组时，键将作用于数组中的所有元素，返回一个新的数组。
