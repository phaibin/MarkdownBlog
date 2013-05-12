---
layout: post
title: self.window.rootViewController vs window addSubview
date: 2011-07-08 02:27
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>自从XCode4以后模板自动生成的delegate代码就把</p>
<p>[self.window addSubview:viewController.view];</p>
<p>改为了</p>
<p>self.window.rootViewController = self.viewController;</p>
<p>rootViewController在4.0以后才可以用，在文档里面的解释是：</p>
<p>The root view controller provides the content view of the window. Assigning a view controller to this property (either programmatically or using Interface Builder) installs the view controller’s view as the content view of the window. If the window has an existing view hierarchy, the old views are removed before the new ones are installed.</p>
<p>一般情况下这两种写法效果是一样的，直到今天让我碰到了一件很郁闷的事情。</p>
<p>今天看一篇CALayer的文章，建立了一个例子。先建一个View-based的工程，然后在ViewDidLoad方法里面添加：</p>
<p>self.view.layer.frame = CGRectInset(self.view.layer.frame, 20.0, 20.0);</p>
<p>可是运行之后layer的大小没有变化。然后下载下来示例代码，什么都一样，但是示例没有问题。真是见鬼。</p>
<p>然后我又试着对比delegate文件，突然想起来3和4加subView的方式不一样。换了这一句果然好了。想想原因应该是这样的：</p>
<p>用rootViewController的话会把整个viewController的view作为window的content view，这样viewController就会充满整个window，不能调整大小。</p>
<p>但是用subView只是把viewController的view插入window中，所以可以调整大小。</p></p>
