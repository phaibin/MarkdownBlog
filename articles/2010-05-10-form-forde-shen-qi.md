---
layout: post
title: form_for的神奇
date: 2010-05-10 11:34
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>new和eedit的模板几乎一模一样，表单的形式都是很简单的：   <br />&#160;&#160;&#160;&#160; &lt;% form_for(@contact) do |f| %&gt;    <br />可是一个POST动作，一个PUT动作，结果就是一个导向到create方法，一个导向到update方法。查看源文件可以看到edit的模板生成的代码多了一个隐藏控件：    <br />&#160;&#160;&#160;&#160; &lt;input name=&quot;_method&quot; type=&quot;hidden&quot; value=&quot;put&quot; /&gt;    <br />这其中Rails一定有什么隐藏的处理。google之后发现了这一篇文章：    <br />&#160;&#160;&#160;&#160; <a title="http://www.javaeye.com/problems/19749" href="http://www.javaeye.com/problems/19749">http://www.javaeye.com/problems/19749</a>    <br />原来有人跟我有完全一样的疑惑，区别是人家查看了源代码，而我懒，没有看:)。    <br />原来form_for在生成代码的时候会判断是新建还是更新，如果是更新则会加上PUT method。看来Rails为我们处理了太多太多的细节，让我们可以更加傻瓜地应用框架。</p></p>
