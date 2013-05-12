---
layout: post
title: 和CFStringRef相关的CFSTR与和NSString相关的@
date: 2011-06-28 00:15
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>原文：http://hi.baidu.com/cshacker/blog/item/9f918f77f64a8203b051b9ea.html</p>
<p>CoreFoundation里面的CFStringRef和NSString*是可以直接转换的，两种也都有一个相似的用来直接赋常量的操作。例如：</p>
<p>CFStringRef a = CFSTR("a");<br />NSString *b = @"b";</p>
<p>CFSTR是一个宏，这个宏的定义可能是CFStringMakeConstantString，也可能是__builtin___CFStringMakeConstantString。如果是CFStringMakeConstantString，看看CFStringMakeConstantString的实现就会明白，CFSTR("a")是存放在一个全局字典里面的，下次用到CFSTR("a")的时候先查字典里面有没有，如果有就是用存在的，如果没有则分配一个，并且放到字典里面。</p>
<p>所以这里有两个需要注意的，一：CFSTR分配出来的字符串对象是不能自己释放的，如果你释放了下次在使用就会使用到一个野对象；二：多线程使用可能会出问题，因为全局的字典是没有锁的。</p>
<p>而NSString的@有些不一样，应该和__builtin___CFStringMakeConstantString有些类似，允许你多线程使用，同样也不需要你自己去release，可以理解为b是一个autorelease的对象，系统会自己自动收回b。如果想长时间持有b那就retain，但不要忘了release。</p></p>
