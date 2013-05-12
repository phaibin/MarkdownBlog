---
layout: post
title: 项目属性中-all_load选项的意义
date: 2011-09-01 05:53
categories:
- iphone
tags:
- xcode
published: true
comments: true
---
<p><p>最近研究腾讯微博，加入了腾讯微博ios的库，但是运行时库里面所有的category都不能用。对比了库的demo，发现在Other Linker Flags里面多了个参数：-all_load，加上这个参数之后运行就没问题了，原来-all_load连接选项是告诉编译器将所连接的库全部包含，而不是用到才引入。</p></p>
