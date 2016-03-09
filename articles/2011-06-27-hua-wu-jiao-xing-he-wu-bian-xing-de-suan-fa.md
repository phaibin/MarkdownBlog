---
layout: post
title: 画五角星和五边形的算法
date: 2011-06-27 07:33
categories:
- iphone
tags: []
published: true
comments: true
---
	CGPoint center;

	// Add a star to the current path
	center = CGPointMake(90.0, 90.0);
	CGContextMoveToPoint(context, center.x, center.y + 60.0);
	for(int i = 1; i &lt; 5; ++i)
	{
	CGFloat x = 60.0 * sinf(i * 4.0 * M_PI / 5.0);
	CGFloat y = 60.0 * cosf(i * 4.0 * M_PI / 5.0);
	CGContextAddLineToPoint(context, center.x + x, center.y + y);
	}
	// And close the subpath.
	CGContextClosePath(context);

	// Now add the hexagon to the current path
	center = CGPointMake(210.0, 90.0);
	CGContextMoveToPoint(context, center.x, center.y + 60.0);
	for(int i = 1; i &lt; 6; ++i)
	{
	CGFloat x = 60.0 * sinf(i * 2.0 * M_PI / 6.0);
	CGFloat y = 60.0 * cosf(i * 2.0 * M_PI / 6.0);
	CGContextAddLineToPoint(context, center.x + x, center.y + y);
	}
	// And close the subpath.
	CGContextClosePath(context);

![pentagram](/images/articles/pentagram.png)

半径是60，首先移动到最下面的那个点，然后算出下一个隔一个点的坐标。

角度的取法是，把360度也就是2.0*M_PI，分成5份，于是除以5，每隔一个点乘以i，因为五角星是取隔一个点，所以多乘以2，于是就是

i * 4.0 * M_PI / 5.0
