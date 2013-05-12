---
layout: post
title: iphone Link button
date: 2012-05-21 22:42
categories:
- iphone
tags: []
published: true
comments: true
---
代码：
    # UIUnderlinedButton.h
     
    @interface UIUnderlinedButton : UIButton

    + (UIUnderlinedButton*) underlinedButton;

    @end

    # UIUnderlinedButton.m
     
    @implementation UIUnderlinedButton
     
    + (UIUnderlinedButton*) underlinedButton {
      UIUnderlinedButton* button = [[UIUnderlinedButton alloc] init];
      return [button autorelease];
    }

    - (void) drawRect:(CGRect)rect {
      CGRect textRect = self.titleLabel.frame;
      // need to put the line at top of descenders (negative value)
      CGFloat descender = self.titleLabel.font.descender;
      CGContextRef contextRef = UIGraphicsGetCurrentContext();
      // set to same colour as text
      CGContextSetStrokeColorWithColor(contextRef, self.titleLabel.textColor.CGColor);
      CGContextMoveToPoint(contextRef, textRect.origin.x, textRect.origin.y + textRect.size.height + descender);
      CGContextAddLineToPoint(contextRef, textRect.origin.x + textRect.size.width, textRect.origin.y + textRect.size.height + descender);
      CGContextClosePath(contextRef);
      CGContextDrawPath(contextRef, kCGPathStroke);
    }
