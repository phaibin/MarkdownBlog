---
layout: post
title: 让Organizor支持erb文件
date: 2010-11-29 17:13
categories:
- RoR
tags: []
published: true
comments: true
---
用任何一个文本编辑器打开:

/Developer/Library/PrivateFrameworks/DevToolsCore.framework/Versions/A/Resources/Standard file types.pbfilespec

找到:Extensions = (shtml, jsp, rhtml);

修改为:Extensions = (shtml, jsp, rhtml, erb);

保存，重启Xcode。