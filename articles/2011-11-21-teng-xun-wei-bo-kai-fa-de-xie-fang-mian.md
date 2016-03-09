---
layout: post
title: 腾讯微博开发的一些方面
date: 2011-11-21 16:56
categories:
- Cocoa
tags:
- cocoa
- 腾讯微博
published: true
comments: true
---
按照官方文档，微博的类型有：

type:微博类型 1-原创发表、2-转载、3-私信 4-回复 5-空回 6-提及 7-评论

原创就是自己发的，转载就是点微博下面的转播，评论就是点微博下面的评论，回复其实是对话，私信就是私信。

空回和提及还没发现是怎么产生出来的。

![txweibo_2](http://phaibin.tk/wp-content/uploads/2011/11/txweibo_2.png)

![txweibo_1](http://phaibin.tk/wp-content/uploads/2011/11/txweibo_1.png)

转播、评论和对话会显示在“提到我的”页面，不过只有转播和对话显示在我的主页，评论不会显示。
