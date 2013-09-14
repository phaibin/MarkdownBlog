---
layout: post
title: 体会NSString的copy属性
date: 2011-05-25 04:35
categories:
- iphone
tags: []
published: true
comments: true
---
规范上NSString做属性都是写成copy的，理论上应该是复制了字符串而不是单纯的增加引用计数，其实问题只会出现在把NSMutableString赋值给NSString的时候。

    @interface Demo : NSObject
    {
    NSString  *retainString;
    NSString *copyString;
    }
     
    @property (nonatomic, retain)NSString *retainString;
    @property (nonatomic, copy)NSString *copyString;
     
    @end
     
    @implementation Demo
     
    @synthesize retainString;
    @synthesize copyString;
     
    -(void)dealloc
    {
    [retainString release];
    [copyString release];
    [super dealloc];
    }
     
    @end
     
    Demo *o  = [[Demo  alloc] init];
    NSMutableString *s1 = [[NSMutableString  alloc] initWithCapacity:100];
    [s1 setString"fuckyou"];
    o.retainString =  s1;
    o.copyString  = s1;
    NSLog(@"retain  string  is %@",  o.retainString);
    NSLog(@"copy string is  %@", o.copyString);
    [s1 setString"fuckme"];
    NSLog(@"retain string  is %@", o.retainString);
    NSLog(@"copy string is %@", o.copyString);
 
这样就可以看出，当使用retain方式的时候，NSMutableString的内容变化时，语义上应该不可变的NSString也变化了，而用copy则是始终保持赋值时的内容。