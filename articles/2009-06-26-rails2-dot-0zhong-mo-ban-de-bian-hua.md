---
layout: post
title: Rails2.0中模版的变化
date: 2009-06-26 17:29
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>在读《AWDR》第三版的时候看到视图模版的扩展名居然变成.html.erb了，真是很奇怪，原来的名字rhtml挺好听的啊。不过如果没有加入模版，出错的信息是没有找到.erb文件，虽然这两种命名都好使。最恐怖的是如果我加入三种不同扩展名的模版：.erb、.rhtml、.html.erb，优先级居然是.html.erb&gt;.rhtml&gt;.erb。</p></p>
