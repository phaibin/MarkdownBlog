---
layout: post
title: UIImage扩展
date: 2011-08-31 01:27
categories:
- iphone
tags:
- iphone
- UIImage
published: true
comments: true
---
<p>[code lang="objc"]<br />
//<br />
//  UIImage-Extensions.h<br />
//<br />
//  Created by Hardy Macia on 7/1/09.<br />
//  Copyright 2009 Catamount Software. All rights reserved.<br />
//<br />
#import &amp;lt;Foundation/Foundation.h&amp;gt;</p>

<p>@interface UIImage (CS_Extensions)<br />
- (UIImage *)imageAtRect:(CGRect)rect;<br />
- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize;<br />
- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize;<br />
- (UIImage *)imageByScalingToSize:(CGSize)targetSize;<br />
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;<br />
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;</p>

<p>@end;</p>

<p>//<br />
//  UIImage-Extensions.m<br />
//<br />
//  Created by Hardy Macia on 7/1/09.<br />
//  Copyright 2009 Catamount Software. All rights reserved.<br />
//</p>

<p>#import &amp;quot;UIImage-Extensions.h&amp;quot;</p>

<p>CGFloat DegreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};<br />
CGFloat RadiansToDegrees(CGFloat radians) {return radians * 180/M_PI;};</p>

<p>@implementation UIImage (CS_Extensions)</p>

<p>-(UIImage *)imageAtRect:(CGRect)rect<br />
{
   <br />
   CGImageRef imageRef = CGImageCreateWithImageInRect([self CGImage], rect);<br />
   UIImage* subImage = [UIImage imageWithCGImage: imageRef];<br />
   CGImageRelease(imageRef);<br />
   <br />
   return subImage;<br />
   <br />
}</p>

<p>- (UIImage *)imageByScalingProportionallyToMinimumSize:(CGSize)targetSize {<br />
   <br />
   UIImage *sourceImage = self;<br />
   UIImage *newImage = nil;<br />
   <br />
   CGSize imageSize = sourceImage.size;<br />
   CGFloat width = imageSize.width;<br />
   CGFloat height = imageSize.height;<br />
   <br />
   CGFloat targetWidth = targetSize.width;<br />
   CGFloat targetHeight = targetSize.height;<br />
   <br />
   CGFloat scaleFactor = 0.0;<br />
   CGFloat scaledWidth = targetWidth;<br />
   CGFloat scaledHeight = targetHeight;<br />
   <br />
   CGPoint thumbnailPoint = CGPointMake(0.0,0.0);<br />
   <br />
   if (CGSizeEqualToSize(imageSize, targetSize) == NO) {<br />
      <br />
      CGFloat widthFactor = targetWidth / width;<br />
      CGFloat heightFactor = targetHeight / height;<br />
      <br />
      if (widthFactor &amp;gt; heightFactor) <br />
         scaleFactor = widthFactor;<br />
      else<br />
         scaleFactor = heightFactor;<br />
      <br />
      scaledWidth  = width * scaleFactor;<br />
      scaledHeight = height * scaleFactor;<br />
      <br />
      // center the image<br />
      <br />
      if (widthFactor &amp;gt; heightFactor) {<br />
         thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; <br />
      } else if (widthFactor &amp;lt; heightFactor) {<br />
         thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;<br />
      }<br />
   }<br />
   <br />
   <br />
   // this is actually the interesting part:<br />
   <br />
   UIGraphicsBeginImageContext(targetSize);<br />
   <br />
   CGRect thumbnailRect = CGRectZero;<br />
   thumbnailRect.origin = thumbnailPoint;<br />
   thumbnailRect.size.width  = scaledWidth;<br />
   thumbnailRect.size.height = scaledHeight;<br />
   <br />
   [sourceImage drawInRect:thumbnailRect];<br />
   <br />
   newImage = UIGraphicsGetImageFromCurrentImageContext();<br />
   UIGraphicsEndImageContext();<br />
   <br />
   if(newImage == nil) NSLog(@&amp;quot;could not scale image&amp;quot;);<br />
   <br />
   <br />
   return newImage ;<br />
}</p>

<p>- (UIImage *)imageByScalingProportionallyToSize:(CGSize)targetSize {<br />
   <br />
   UIImage *sourceImage = self;<br />
   UIImage *newImage = nil;<br />
   <br />
   CGSize imageSize = sourceImage.size;<br />
   CGFloat width = imageSize.width;<br />
   CGFloat height = imageSize.height;<br />
   <br />
   CGFloat targetWidth = targetSize.width;<br />
   CGFloat targetHeight = targetSize.height;<br />
   <br />
   CGFloat scaleFactor = 0.0;<br />
   CGFloat scaledWidth = targetWidth;<br />
   CGFloat scaledHeight = targetHeight;<br />
   <br />
   CGPoint thumbnailPoint = CGPointMake(0.0,0.0);<br />
   <br />
   if (CGSizeEqualToSize(imageSize, targetSize) == NO) {<br />
      <br />
      CGFloat widthFactor = targetWidth / width;<br />
      CGFloat heightFactor = targetHeight / height;<br />
      <br />
      if (widthFactor &amp;lt; heightFactor) <br />
         scaleFactor = widthFactor;<br />
      else<br />
         scaleFactor = heightFactor;<br />
      <br />
      scaledWidth  = width * scaleFactor;<br />
      scaledHeight = height * scaleFactor;<br />
      <br />
      // center the image<br />
      <br />
      if (widthFactor &amp;lt; heightFactor) {<br />
         thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5; <br />
      } else if (widthFactor &amp;gt; heightFactor) {<br />
         thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;<br />
      }<br />
   }<br />
   <br />
   <br />
   // this is actually the interesting part:<br />
   <br />
   UIGraphicsBeginImageContext(targetSize);<br />
   <br />
   CGRect thumbnailRect = CGRectZero;<br />
   thumbnailRect.origin = thumbnailPoint;<br />
   thumbnailRect.size.width  = scaledWidth;<br />
   thumbnailRect.size.height = scaledHeight;<br />
   <br />
   [sourceImage drawInRect:thumbnailRect];<br />
   <br />
   newImage = UIGraphicsGetImageFromCurrentImageContext();<br />
   UIGraphicsEndImageContext();<br />
   <br />
   if(newImage == nil) NSLog(@&amp;quot;could not scale image&amp;quot;);<br />
   <br />
   <br />
   return newImage ;<br />
}</p>

<p>- (UIImage *)imageByScalingToSize:(CGSize)targetSize {<br />
   <br />
   UIImage *sourceImage = self;<br />
   UIImage *newImage = nil;<br />
   <br />
   //   CGSize imageSize = sourceImage.size;<br />
   //   CGFloat width = imageSize.width;<br />
   //   CGFloat height = imageSize.height;<br />
   <br />
   CGFloat targetWidth = targetSize.width;<br />
   CGFloat targetHeight = targetSize.height;<br />
   <br />
   //   CGFloat scaleFactor = 0.0;<br />
   CGFloat scaledWidth = targetWidth;<br />
   CGFloat scaledHeight = targetHeight;<br />
   <br />
   CGPoint thumbnailPoint = CGPointMake(0.0,0.0);<br />
   <br />
   // this is actually the interesting part:<br />
   <br />
   UIGraphicsBeginImageContext(targetSize);<br />
   <br />
   CGRect thumbnailRect = CGRectZero;<br />
   thumbnailRect.origin = thumbnailPoint;<br />
   thumbnailRect.size.width  = scaledWidth;<br />
   thumbnailRect.size.height = scaledHeight;<br />
   <br />
   [sourceImage drawInRect:thumbnailRect];<br />
   <br />
   newImage = UIGraphicsGetImageFromCurrentImageContext();<br />
   UIGraphicsEndImageContext();<br />
   <br />
   if(newImage == nil) NSLog(@&amp;quot;could not scale image&amp;quot;);<br />
   <br />
   <br />
   return newImage ;<br />
}</p>

<p>- (UIImage *)imageRotatedByRadians:(CGFloat)radians<br />
{
   return [self imageRotatedByDegrees:RadiansToDegrees(radians)];<br />
}</p>

<p>- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees <br />
{   <br />
   // calculate the size of the rotated view's containing box for our drawing space<br />
   UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];<br />
   CGAffineTransform t = CGAffineTransformMakeRotation(DegreesToRadians(degrees));<br />
   rotatedViewBox.transform = t;<br />
   CGSize rotatedSize = rotatedViewBox.frame.size;<br />
   [rotatedViewBox release];<br />
   <br />
   // Create the bitmap context<br />
   UIGraphicsBeginImageContext(rotatedSize);<br />
   CGContextRef bitmap = UIGraphicsGetCurrentContext();<br />
   <br />
   // Move the origin to the middle of the image so we will rotate and scale around the center.<br />
   CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);<br />
   <br />
   //   // Rotate the image context<br />
   CGContextRotateCTM(bitmap, DegreesToRadians(degrees));<br />
   <br />
   // Now, draw the rotated/scaled image into the context<br />
   CGContextScaleCTM(bitmap, 1.0, -1.0);<br />
   CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);<br />
   <br />
   UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();<br />
   UIGraphicsEndImageContext();<br />
   return newImage;<br />
   <br />
}</p>

<p>@end;<br />
[/code]</p>
