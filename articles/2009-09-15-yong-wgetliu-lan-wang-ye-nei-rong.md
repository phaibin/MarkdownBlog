---
layout: post
title: 用wget浏览网页内容
date: 2009-09-15 18:19
categories:
- RoR
tags: []
published: true
comments: true
---
<p><div>wget -q --header=&quot;Accept: text/html&quot; http://localhost:3000/info/who_bought/2 -O-</div>  <div>-q代表不显示输出</div>  <div>--header可以指定http头   <br />-O代表指定输出位置，-O-表示输出到标准输出</div></p>
