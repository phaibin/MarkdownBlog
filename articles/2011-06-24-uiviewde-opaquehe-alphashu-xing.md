---
layout: post
title: UIView的opaque和alpha属性
date: 2011-06-24 01:54
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>opaque如果设为YES，图形系统会把view当成完全不透明，允许图形系统优化绘图操作，提高性能。如果设为NO，图形系统把view和其他内容一起混合。默认值是YES。</p>
<p>一个opaque的view期望应该在自己的范围内用全部opaque的内容填充，也就是说，内容应该全部有一个1.0的alpha值。如果view是不透明的，并且范围没有被完全填充，或者包含透明或半透明的内容，那么结果是不可预知的。如果view是透明或者半透明的，你总是应该把opaque设为NO。</p>
<p>alpha表示view的透明性，范围从0.0到1.0，这个值只影响当前的view，不会影响内部包含的subview。(错，会影响，全部的subview都变透明了)</p></p>
