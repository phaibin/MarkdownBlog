---
layout: post
title: IE8 中 session 管理的变化(转)
date: 2009-05-08 17:55
categories:
- 生活
tags: []
published: true
comments: true
---
<p><p>IE7中，同一个窗口(IE 进程）共享一个session。 </p>
<p>IE8中，所有打开的IE窗口（IE 进程）共享一个session。除非，用户通过菜单 <span style="font-family:Calibri, sans-serif;color:#1f497d;font-size:11pt;">File &gt; New session&nbsp;</span>&nbsp;打开新窗口，或者使用命令行参数 iexplore.exe -nomerge 来打开IE。&nbsp; 另外，当所有IE窗口被关闭后，session 结束。</p></p>
