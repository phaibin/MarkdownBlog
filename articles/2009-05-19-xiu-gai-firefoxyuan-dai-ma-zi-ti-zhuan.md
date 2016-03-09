---
layout: post
title: 修改Firefox源代码字体（转）
date: 2009-05-19 14:42
categories:
- 网页
tags: []
published: true
comments: true
---
打开 X:\Program Files\Firefox\resviewsource.css ，找到 #viewsource {} 字段，修改 font-family 属性即可：

    #viewsource
    {
        font-family: Courier New;
        font-weight: normal;
        color: black;
        white-space: pre;
        font-size: 12px;
    }

ps:为什么不在菜单中做一个设置的接口呢？



