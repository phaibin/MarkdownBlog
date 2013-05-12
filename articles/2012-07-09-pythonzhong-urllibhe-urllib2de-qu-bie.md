---
layout: post
title: python中urllib和urllib2的区别
date: 2012-07-09 14:47
categories:
- Python
tags:
- python
- urllib2
published: true
comments: true
---
原文：<http://www.hacksparrow.com/python-difference-between-urllib-and-urllib2.html>

- urllib2可以接受一个Request对象来设置URL headers，而urllib只接受URL，也就是你不能设置user agent。
- urllib提供了urlencode方法来生成查询字符串，urllib2没有这个方法，这就是urllib2和urllib经常一起使用的原因之一。

httplib2比httplib或者urllib和urllib2都更好用。
