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
<p><p>写操作：</p>
<p>NSString *name=[txt1 text];</p>
<p>NSNumber *phoneNumber=[[NSNumber alloc] initWithInt:[[txt2 text] intValue]];</p>
<p>NSNumber *age=[[NSNumber alloc] initWithInt:[[txt3 text] intValue]];</p>
<p>NSMutableArray *array=[[NSMutableArray alloc]init];</p>
<p>[array  addObject:name];</p>
<p>[array  addObject:phoneNumber];</p>
<p>[array  addObject:age];</p>
<p>NSArray *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject];</p>
<p>NSString *filename=[path stringByAppendingPathComponent:@"personal.plist"];</p>
<p>[array writeToFile:filename atomically:YES];</p>
<p>[array release];</p>
<p> </p>
<p>读操作：</p>
<p>
<p>NSString *docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) lastObject];</p>
<p>NSString *filename=[path stringByAppendingPathComponent:@"personal.plist"];</p>
<p>NSMutableArray *array=[[NSMutableArray alloc] initWithContentsOfFile:filename];</p>
<p>txt1.text=[array objectAtIndex:0];</p>
<p>txt2.text=[[NSString alloc] initWithFormat:@"%d",[[array objectAtIndex:1] intValue]];</p>
<p>txt3.text=[[NSString alloc] initWithFormat:@"%d",[[array objectAtIndex:2] intValue]];</p>
<p>[array release];</p>
</p>
<p> </p></p>
