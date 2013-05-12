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
<p>[code lang="objc"]<br />
	CGPoint center;</p>

<p>	// Add a star to the current path<br />
	center = CGPointMake(90.0, 90.0);<br />
	CGContextMoveToPoint(context, center.x, center.y + 60.0);<br />
	for(int i = 1; i &amp;lt; 5; ++i)<br />
	{<br />
		CGFloat x = 60.0 * sinf(i * 4.0 * M_PI / 5.0);<br />
		CGFloat y = 60.0 * cosf(i * 4.0 * M_PI / 5.0);<br />
		CGContextAddLineToPoint(context, center.x + x, center.y + y);<br />
	}<br />
	// And close the subpath.<br />
	CGContextClosePath(context);</p>

<p>	// Now add the hexagon to the current path<br />
	center = CGPointMake(210.0, 90.0);<br />
	CGContextMoveToPoint(context, center.x, center.y + 60.0);<br />
	for(int i = 1; i &amp;lt; 6; ++i)<br />
	{<br />
		CGFloat x = 60.0 * sinf(i * 2.0 * M_PI / 6.0);<br />
		CGFloat y = 60.0 * cosf(i * 2.0 * M_PI / 6.0);<br />
		CGContextAddLineToPoint(context, center.x + x, center.y + y);<br />
	}<br />
	// And close the subpath.<br />
	CGContextClosePath(context);<br />
[/code]
<p><img title="NewImage.png" src="http://phaibin.files.wordpress.com/2011/06/newimage11.png" border="0" alt="NewImage" width="284" height="166" /></p>
<p>半径是60，首先移动到最下面的那个点，然后算出下一个隔一个点的坐标。</p>
<p>角度的取法是，把360度也就是2.0*M_PI，分成5份，于是除以5，每隔一个点乘以i，因为五角星是取隔一个点，所以多乘以2，于是就是</p>
<p><span> </span>i * 4.0 * M_PI / 5.0</p></p>
