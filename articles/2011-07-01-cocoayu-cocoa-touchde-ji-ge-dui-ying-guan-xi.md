---
layout: post
title: Cocoa与Cocoa Touch的几个对应关系
date: 2011-07-01 15:08
categories:
- iphone
tags: []
published: true
comments: true
---
- NSView - UIView
- NSButton - UIButton
- NSTextField - UITextField
- NSRect - CGRect
- NSSize - CGSize
- NSZeroRect - CGRectZero

- CGColorCreateGenericRGB -UIColor colorWithRed:green:blue:alpha:
- NSValueBinding -n/a bindings with view objects not supported
- NSMenuItem -n/a (menus not supported
- NSGraphicsContext -CGContext
- NSLeftArrowFunctionKey -n/a (iOS does not have a keyboard)

- NSCompositeSourceOver - kCGBlendModeNormal (which is the default blend mode in a CGContext)
