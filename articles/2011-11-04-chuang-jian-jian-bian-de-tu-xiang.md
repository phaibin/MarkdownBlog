---
layout: post
title: 创建渐变的图像
date: 2011-11-04 03:43
categories:
- iphone
tags:
- cocoa2D
- iphone
published: true
comments: true
---
代码：

		// create a 2 bit CGImage containing a gradient that will be used for masking the 
		// main view content to create the 'fade' of the reflection.  The CGImageCreateWithMask
		// function will stretch the bitmap image as required, so we can create a 1 pixel wide
		// gradient
		CGImageRef gradientMaskImage=AEViewCreateGradientImage(1,height);

		// Create an image by masking the bitmap of the mainView content with the gradient view
		// then release the  pre-masked content bitmap and the gradient bitmap
		CGImageRef reflectionImage=CGImageCreateWithMask(mainViewContentBitmapContext,gradientMaskImage);
		CGImageRelease(mainViewContentBitmapContext);
		CGImageRelease(gradientMaskImage);

		CGImageRef AEViewCreateGradientImage (int pixelsWide,
											  int pixelsHigh)
		{
			CGImageRef theCGImage = NULL;
		    CGContextRef gradientBitmapContext = NULL;
		    CGColorSpaceRef colorSpace;
			CGGradientRef grayScaleGradient;
			CGPoint gradientStartPoint, gradientEndPoint;
			
			// Our gradient is always black-white and the mask
			// must be in the gray colorspace
		    colorSpace = CGColorSpaceCreateDeviceGray();
			
			// create the bitmap context
		    gradientBitmapContext = CGBitmapContextCreate (NULL, pixelsWide, pixelsHigh,
														   8, 0, colorSpace, kCGImageAlphaNone);
			
			if (gradientBitmapContext != NULL) {
				// define the start and end grayscale values (with the alpha, even though
				// our bitmap context doesn't support alpha the gradient requires it)
				CGFloat colors[] = {0.0, 1.0,1.0, 1.0,};
				
				// create the CGGradient and then release the gray color space
				grayScaleGradient = CGGradientCreateWithColorComponents(colorSpace, colors, NULL, 2);
				
				// create the start and end points for the gradient vector (straight down)
				gradientStartPoint = CGPointZero;
				gradientEndPoint = CGPointMake(0,pixelsHigh);
				
				// draw the gradient into the gray bitmap context
				CGContextDrawLinearGradient (gradientBitmapContext, grayScaleGradient, gradientStartPoint, gradientEndPoint, kCGGradientDrawsAfterEndLocation);
				
				// clean up the gradient
				CGGradientRelease(grayScaleGradient);
				
				// convert the context into a CGImageRef and release the
				// context
				theCGImage=CGBitmapContextCreateImage(gradientBitmapContext);
				CGContextRelease(gradientBitmapContext);
				
			}
			
			// clean up the colorspace
			CGColorSpaceRelease(colorSpace);
			
			// return the imageref containing the gradient
		    return theCGImage;
		}