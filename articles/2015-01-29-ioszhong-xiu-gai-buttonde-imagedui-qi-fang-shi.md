---
title: iOS中修改Button的image对齐方式
date: 2015-01-29 13:36
---
iOS里面给一个button设置图片有两个方法：setImage和setBackgroundImage。setImage图片会以原始尺寸居中显示，setBackgroundImage图片会拉伸到跟button一样大小。我想实现的是图片以aspect fill模式显示，即拉伸到整个button，但是不改变比例。

搜索了一下，在stackoverflow上面很多人提供了这样的答案：

    [[button imageView] setContentMode: UIViewContentModeScaleAspectFill];

这行代码在某些情况下起作用，另外一些却不行。这些特殊情况就是当图片的尺寸比button的尺寸小的时候，图片只能居中显示，并没有拉伸。

完整的解决方法是这样的：

    [[button imageView] setContentMode: UIViewContentModeScaleAspectFill];
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentFill;
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;

后面两句神奇的代码写了这么久iOS代码还是第一次碰到，而且还是自2.0就加入的方法。看来自己的基本功还差很多。