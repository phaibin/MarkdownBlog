---
layout: post
title: 设活动分区的方法
date: 2010-09-09 16:19
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>diskpart</p>
<p>list disk</p>
<p>select disk 0</p>
<p>list partition</p>
<p>select partition 6</p>
<p>active (inactive设为非活动)</p></p>
