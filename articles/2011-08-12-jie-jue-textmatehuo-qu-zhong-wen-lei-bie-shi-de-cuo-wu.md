---
layout: post
title: 解决Textmate获取中文类别时的错误
date: 2011-08-12 09:24
categories:
- Python
tags: []
published: true
comments: true
---
打开Bundle编辑器，找到Category命令，把下面这句：
> res = %x{ iconv <<'APPLESCRIPT' -f utf-8 -t mac|osascript 2>/dev/null

改为：
> res = %x{ iconv <<'APPLESCRIPT' -f utf-8 -t utf-8|osascript 2>/dev/null
