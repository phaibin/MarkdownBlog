---
layout: post
title: View从一边翻转的效果
date: 2013-03-04 18:44
categories:
- iphone
tags: []
published: true
comments: true
---
做了一个View从一边翻转的demo，代码在<https://github.com/phaibin/PaperFlipDemo>。
效果是这样的：

![](https://raw.github.com/phaibin/PaperFlipDemo/master/PaperFlipDemo/screenshot.png)

有几点需要注意的：

1. view的背景是张图片，在向里翻的时候会消失掉。解决的办法就是设置imageview的zPosition：

		self.bgImageView.layer.zPosition = -400;
2. 动画结束之后会恢复原状。只把animation的removedOnCompletion属性设为NO是不够的，还需要把fillMode设为kCAFillModeForwards。
