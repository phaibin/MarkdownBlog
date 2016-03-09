---
layout: post
title: Ruby代码调试
date: 2010-04-29 09:40
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>先安装ruby-debug，最新的没有windows编译版的，最新的能用的为0.10.0的：</p>  <p>gem install --version=0.10.0</p>  <p>装完之后在代码里加入debugger作为断点，类似JS，然后运行：</p>  <p>rdebug test.rb</p>  <p>就可以在debugger出中断，然后可以运行一些命令查看当时的状态：</p>  <p>h：帮助   <br />l：显示断点附近的代码    <br />n：单步    <br />s：进入函数    <br />c：继续运行    <br />w：查看调用堆栈</p>  <p>还可以用h 命令来查看命令的介绍。</p>  <p>而且rake也可以调试：</p>  <p>rdebug D:Rubybinrake db:migrate</p></p>
