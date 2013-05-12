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
<p>NSView - UIView<br />
NSButton - UIButton<br />
NSTextField - UITextField<br />
NSRect - CGRect<br />
NSSize - CGSize<br />
NSZeroRect - CGRectZero</p>

<p>CGColorCreateGenericRGB -UIColor colorWithRed:green:blue:alpha:<br />
NSValueBinding -n/a bindings with view objects not supported<br />
NSMenuItem -n/a (menus not supported<br />
NSGraphicsContext -CGContext<br />
NSLeftArrowFunctionKey -n/a (iOS does not have a keyboard)</p>

<p>NSCompositeSourceOver - kCGBlendModeNormal (which is the default blend mode in a CGContext)</p>
