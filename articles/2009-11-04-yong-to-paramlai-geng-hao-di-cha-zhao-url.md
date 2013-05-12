---
layout: post
title: 用to_param来更好地查找URL
date: 2009-11-04 11:37
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>原文：<a title="http://www.seoonrails.com/to_param-for-better-looking-urls" href="http://www.seoonrails.com/to_param-for-better-looking-urls">http://www.seoonrails.com/to_param-for-better-looking-urls</a></p>  <p>好的URL不仅易于SEO（搜索引擎优化），而且易于人们阅读。默认Rails的URL类似于这样：</p>  <p>&#160;&#160; /controller/action/1</p>  <p>Rails也可以支持这样的URL：</p>  <p>&#160;&#160; /controller/action/1-my-article</p>  <p>这可以通过为你的模型实现to_param方法来达到。</p>  <p>下面的代码把一个ID为22，title为“Nice URLs”的文章表示为“22-Nice-URLs”：</p>  <p>&#160;&#160; class Article &lt; ActiveRecord::Base   <br />&#160;&#160;&#160;&#160;&#160; def to_param    <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; “#{id}-#{title}”    <br />&#160;&#160;&#160;&#160;&#160; end    <br />&#160;&#160; end</p></p>
