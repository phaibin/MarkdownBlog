---
layout: post
title: irb设置提示符
date: 2013-03-07 18:02
categories:
- RoR
tags: []
published: true
comments: true
---
参考：<http://soft.chinabyte.com/os/469/12533469.shtml>

默认的irb的提示符是白色的，没有颜色就没法分清几次运行的结果，所以研究一下怎么改变提示符的颜色。
方法是在home建立一个文件.irbrc，加入：

	IRB.conf[:PROMPT][:CUSTOM] = {
	  :PROMPT_I => “\033[01;31m>>\033[00m ",
	  :PROMPT_S => "%l>> ",
	  :PROMPT_C => ".. ",
	  :PROMPT_N => ".. ",
	  :RETURN => "=> %s\n"
	}
	IRB.conf[:PROMPT_MODE] = :CUSTOM
	IRB.conf[:AUTO_INDENT] = true

关键就是这一行: PROMPT_I。在这里面加入颜色的代码。

顺便说一下颜色代码的写法：

颜色代码的格式为：[\e[F;Bm]。F为前景色，范围30~37，B为背景色，范围40~47。颜色表：

	前景背景 颜色
	------------------------
	30 40 黑色
	31 41 红色
	32 42 绿色
	33 43 黄色
	34 44 蓝色
	35 45 紫红色
	36 46 青蓝色
	37 47 白色
F或者B的前面还可以加一个控制代码，也用;分割。

	代码 意义
	-------------------------
	0 OFF
	1 高亮显示
	4 underline
	5 闪烁
	7 反白显示
	8 不可见
后面的[\e[0m]表示关闭颜色，如果不关闭后面的东西都是一个颜色。

另外在.irbrc文件中前后的[]不需要加，原因我也不清楚。
