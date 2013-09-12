---
layout: post
title: iPhone读写.plist文件的例子
date: 2011-07-07 00:50
categories:
- iphone
tags: []
published: true
comments: true
---
写操作：

    NSString *name=[txt1 text];
    NSNumber *phoneNumber=[[NSNumber alloc] initWithInt:[[txt2 text] intValue]];
    NSNumber *age=[[NSNumber alloc] initWithInt:[[txt3 text] intValue]];
    NSMutableArray *array=[[NSMutableArray alloc]init];
    [array  addObject:name];
    [array  addObject:phoneNumber];
    [array  addObject:age];
    NSArray *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject];
    NSString *filename=[path stringByAppendingPathComponent:@"personal.plist"];
    [array writeToFile:filename atomically:YES];
    [array release];

读操作：

    NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject];
    NSString *filename=[path stringByAppendingPathComponent:@"personal.plist"];
    NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:filename];
    txt1.text=[array objectAtIndex:0];
    txt2.text=[[NSString alloc] initWithFormat:@"%d",[[array objectAtIndex:1] intValue]];
    txt3.text=[[NSString alloc] initWithFormat:@"%d",[[array objectAtIndex:2] intValue]];
    [array release];
