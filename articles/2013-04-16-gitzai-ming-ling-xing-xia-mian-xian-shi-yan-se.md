---
layout: post
title: "Git在命令行下面显示颜色"
date: 2013-04-16 21:59
comments: true
categories: 
---
原文：<http://nathanhoad.net/how-to-colours-in-git>

打开~/.gitconfig文件，加入：

	[color]
	  ui = auto
	[color "branch"]
	  current = yellow reverse
	  local = yellow
	  remote = green
	[color "diff"]
	  meta = yellow bold
	  frag = magenta bold
	  old = red bold
	  new = green bold
	[color "status"]
	  added = yellow
	  changed = green
	  untracked = cyan
	  