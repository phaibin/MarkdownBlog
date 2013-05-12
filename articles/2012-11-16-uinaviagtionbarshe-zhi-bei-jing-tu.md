---
layout: post
title: UINaviagtionBar设置背景图
date: 2012-11-16 13:23
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
代码：  
    @implementation UINavigationBar (CustomImage)

    - (UIImage*)barBackground { 
      return[UIImage imageNamed:@"bg_header.png"];
    }
    - (void)didMoveToSuperview { 
      //iOS5 only 
      if ([self respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]) { 
        [self setBackgroundImage:[self barBackground] forBarMetrics:UIBarMetricsDefault]; 
      }
    }
    //this doesn't work on iOS5 but is needed for iOS4 and earlier
    - (void)drawRect:(CGRect)rect { 
      //draw image 
      [[self barBackground] drawInRect:rect];
    }

    @end
对于iOS4之前的版本需要覆盖drawRect方法，iOS5之后增加了`setBackgroundImage:forBarMetrics:`方法。所以需要判断是否支持这个方法。
 
