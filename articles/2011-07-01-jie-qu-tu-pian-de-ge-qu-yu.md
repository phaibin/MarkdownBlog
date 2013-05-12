---
layout: post
title: 截取图片的一个区域
date: 2011-07-01 01:17
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>如果是截取矩形的区域：</p>
<p>CGImage有函数可以截取一张图片的其中一个区域： CGImageCreateWithImageInRect(originImage, rectWanted);</p>
<p>截取圆形或者不规则形状的方法：</p>
<p style="margin: 0; padding: 0 0 10px;"><img style="margin: 0; padding: 0;" src="http://iPhoneDeveloperTips.com/wp-content/uploads/2008/12/maskingstoryboard1.png" border="0" alt="maskingstoryboard.png" width="480" height="150" /></p>
<p style="margin: 0; padding: 0 0 10px;">Creating the mask above is really simple using CoreGraphics on the iPhone. The following is a function that takes two images and uses one to mask the other.</p>
[code lang="objc"]<br />
- (UIImage*) maskImage:(UIImage *)image withMask:(UIImage *)maskImage {</p>

<p>	CGImageRef maskRef = maskImage.CGImage;</p>

<p>	CGImageRef mask = CGImageMaskCreate(CGImageGetWidth(maskRef),<br />
		CGImageGetHeight(maskRef),<br />
		CGImageGetBitsPerComponent(maskRef),<br />
		CGImageGetBitsPerPixel(maskRef),<br />
		CGImageGetBytesPerRow(maskRef),<br />
		CGImageGetDataProvider(maskRef), NULL, false);</p>

<p>	CGImageRef masked = CGImageCreateWithMask([image CGImage], mask);<br />
	return [UIImage imageWithCGImage:masked];</p>

<p>}<br />
[/code]
<p><strong>NOTE:</strong> The mask image cannot have ANY transparency. Instead, transparent areas must be white or some value between black and white. The more towards black a pixel is the less transparent it becomes.</p>
<p style="margin: 0; padding: 0 0 10px;">也就是用灰度图做遮罩，黑色的部分完全显示，白色的部分不显示，灰色的部分为半透明。</p></p>
