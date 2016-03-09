---
layout: post
title: git add . 和 git commit -a的区别
date: 2013-02-28 14:19
categories:
- RoR
tags:
- git
published: true
comments: true
---
参考：<http://stackoverflow.com/questions/3541647/git-add-vs-git-commit-a>
<http://stackoverflow.com/questions/572549/difference-of-git-add-a-and-git-add>

首先git add的3个参数：

	git add -A 		# stages All
	git add . 		# stages new and modified, without deleted
	git add -u 		# stages modified and deleted, without new

`git add -A` 等于 `git add .; git add -U`。

而`git commit -a` 等于 `git add -u; git commit .` ，并不会提交新加的文件。
