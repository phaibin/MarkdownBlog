---
layout: post
title: iPad上UITableView不能圆角的问题
date: 2012-05-30 18:42
categories:
- iphone
tags: []
published: true
comments: true
---
今天碰到了一个很奇怪的问题，这个问题产生的原因很难用一句话描述，在UITableView用grouped样式并且加了索引之后，右边的圆角都变成方角了，而左边的正常。如下图：

![ipad_tableview](http://phaibin.tk/wp-content/uploads/2012/05/ipad_tableview.png)

这个问题在iphone上面没有，只有ipad显示才不正确。

首先尝试在willDisplayCell这个delegate方法里面改变cell的宽度，但是点击之后发现cell的宽度变了，正常显示宽度还是不变。

然后打印出cell的各个subview观察，发现cell里面的textLabel很宽，几乎和cell一样，而高度也和cell一样。于是猜想是不是textLabel太长了，伸出了cell的范围。

在`cellForRowAtIndexPath`这个delegate里面加上一句：

    cell.textLabel.backgroundColor = [UIColor clearColor];

于是显示就正常了。
