---
layout: post
title: Creating alpha masks from text on the iPhone and Mac
date: 2011-07-10 07:14
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>原文：<a href="http://cocoawithlove.com/2009/09/creating-alpha-masks-from-text-on.html">http://cocoawithlove.com/2009/09/creating-alpha-masks-from-text-on.html</a></p>
<p>效果</p>
<p><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/07/newimage11.jpg" border="0" alt="NewImage.jpg" width="240" height="361" /></p>
<p>代码：</p>
<p>
<p>- (void)drawRect:(CGRect)rect</p>
<p>{</p>
<p><span> </span>CGContextRef context = UIGraphicsGetCurrentContext();</p>
<p> </p>
<p><span> </span>// Draw a dark gray background</p>
<p><span> </span>[[UIColor darkGrayColor] setFill];</p>
<p><span> </span>CGContextFillRect(context, rect);</p>
<p> </p>
<p><span> </span>// Draw the text upside-down</p>
<p><span> </span>CGContextSaveGState(context);</p>
<p><span> </span>CGContextTranslateCTM(context, 0, rect.size.height);</p>
<p><span> </span>CGContextScaleCTM(context, 1.0, -1.0);</p>
<p><span> </span>[[UIColor whiteColor] setFill];</p>
<p><span> </span>[text drawInRect:rect withFont:[UIFont fontWithName:@"HelveticaNeue-Bold" size:124]];</p>
<p><span> </span>CGContextRestoreGState(context);</p>
<p> </p>
<p><span> </span>// Create an image mask from what we've drawn so far</p>
<p><span> </span>CGImageRef alphaMask = CGBitmapContextCreateImage(context);</p>
<p> </p>
<p><span> </span>// Draw a white background (overwriting the previous work)</p>
<p><span> </span>[[UIColor whiteColor] setFill];</p>
<p><span> </span>CGContextFillRect(context, rect);</p>
<p> </p>
<p>// Draw the image, clipped by the mask</p>
<p><span> </span>CGContextSaveGState(context);</p>
<p><span> </span>CGContextClipToMask(context, rect, alphaMask);</p>
<p> </p>
<p><span> </span>[[UIImage imageNamed:@"shuttle.jpg"] drawInRect:rect];</p>
<p><span> </span>CGContextRestoreGState(context);</p>
<p><span> </span>CGImageRelease(alphaMask);</p>
<p>}</p>
<p>原理是先把文字绘制到灰度图上，然后根据context创建一个mask image，调用CGContextClipToMask使image作为mask，然后绘制图片，这时候mask中白色的部分会完全显示，黑色的部分不显示。</p>
</p></p>
