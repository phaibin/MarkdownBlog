---
layout: post
title: 给wordpress添加RSS功能
date: 2011-11-19 00:00
categories:
- Wordpress
tags:
- RSS
- Wordpress
published: true
comments: true
---
notepad主题没有rss功能，也就是用safari打开之后地址栏显示不出RSS标志。搜索了半天发现原来是模板的问题，换其他的主题就出来了。加上RSS也很简单，找到主题里的functions.php文件，加上这么一句话就好了：

    // Add default posts and comments RSS feed links to <head>.
    add_theme_support( ‘automatic-feed-links’ );