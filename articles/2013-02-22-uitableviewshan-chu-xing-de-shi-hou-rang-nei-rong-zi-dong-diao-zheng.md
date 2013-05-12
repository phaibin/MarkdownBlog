---
layout: post
title: UITableView删除行的时候让内容自动调整
date: 2013-02-22 15:27
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
如果是自定义的cell，删除的时候内容不会自动调整，很可能删除按钮就把里面的label盖住了。试验了很多代码都没有效果，后来发现其实一行代码都不需要写，只需要把label的autosizemask设为固定在左右，并且自动调整宽度就好了。
