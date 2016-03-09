---
title: iOS给View加单个圆角
date: 2013-08-07 10:21
tags:
- ios
- 圆角
---
参考:<http://stackoverflow.com/questions/4847163/round-two-corners-in-uiview>

给view加圆角很简单：
  
    view.cornerRadius = 4;
    view.masksToBounds = YES;

这样4个角都有圆角了，如果想只给某些角加圆角，单单这么写是不行的。

在上面这个解答中作者给了两个方案，第一个感觉太复杂了，我也没有认真看。第二个解决方法就巧妙，而且代码也很少，所以我使用第二种方法。

这个方法的原理就是加入一个mask layer，先给这个mask layer加4个圆角，然后通过调整mask layer的frame来使某些角不应用圆角。比如把mask layer的高度调高一点，然后下面的两个角就不会有圆角了。

    // set the radius
    CGFloat radius = 50.0;
    // set the mask frame, and increase the height by the 
    // corner radius to hide bottom corners
    CGRect maskFrame = self.view.bounds;
    maskFrame.size.height += radius;
    // create the mask layer
    CALayer *maskLayer = [CALayer layer];
    maskLayer.cornerRadius = radius;
    maskLayer.backgroundColor = [UIColor blackColor].CGColor;
    maskLayer.frame = maskFrame;

    // set the mask
    self.view.layer.mask = maskLayer;
