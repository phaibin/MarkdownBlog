---
layout: post
title: Objective-C + Cocoa on the Command Line
date: 2011-10-29 02:32
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
原文：<http://atastypixel.com/blog/objective-c-cocoa-on-the-command-line/

有个人写了两个脚本，可以直接在命令行下面运行cocoa或者是C的语句，这样测试一个小的函数什么的就方便多了。

源码在这里：[GitHub project](https://github.com/michaeltyson/Commandline-Cocoa)。安装方法是："make it executable (chmod +x runcocoa.sh), and move it to /usr/local/bin/runcocoa."

因为我装了XCode4.2和ios5.0，跟我的环境有点出入，所以我做了一点小修改，代码在这里：<https://github.com/phaibin/Commandline-Cocoa>

使用方法：

    runcocoa ‘NSDateFormatter *formatter = [[[NSDateFormatter alloc] init] autorelease]; [formatter setDateFormat:@"d MMM, h:mm a"]; NSLog(@”%@”, [formatter stringFromDate:[NSDate date]]);’

或者：

    runcocoa -ios ‘UIGraphicsBeginImageContext(CGSizeMake(100,100)); CGContextRef ctx = UIGraphicsGetCurrentContext(); CGContextSetFillColorWithColor(ctx,[[UIColor whiteColor] CGColor]); CGContextBeginPath(ctx); CGContextMoveToPoint(ctx, 50, 0); CGContextAddArc(ctx, 50, 50, 50, M_PI/2.0, M_PI/2.0 + (2*M_PI), 0); CGContextFillPath(ctx); UIImage *icon = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://atastypixel.com/favicon.ico"]]]; [icon drawAtPoint:CGPointMake((100-[icon size].width)/2.0,(100-[icon size].height)/2.0)]; UIImage *i = UIGraphicsGetImageFromCurrentImageContext(); UIGraphicsEndImageContext(); [UIImagePNGRepresentation(i) writeToFile:@"output.png" atomically:NO];’; open output.png;

还可以include其他的库，具体见原项目的说明。

在Textmate中写完代码，然后按option+command+R，输入命令runcocoa，可以直接显示出结果。前提是在Textmate的path变量中加入了/usr/local/bin。

唯一美中不足的运行速度不快，毕竟要做很多工作。
