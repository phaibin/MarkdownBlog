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
diskpart

list disk

select disk 0

list partition

select partition 6

active (inactive设为非活动)
