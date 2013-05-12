---
layout: post
title: Wordpress中限制图片宽度
date: 2011-10-28 09:24
categories:
- Wordpress
tags:
- Wordpress
published: true
comments: true
---
解决的方法有二：

1. 每次上传宽度超过500px的图片都指定宽度为500px，高度不设定。浏览器会自动保持比例。

2. 在style.css中加上如下代码

        /* Image MaxWidth Setting */
        img {
        max-width: 500px;
        width: expression(this.width > 500 ? 500 : this.width);
        height: auto;
        }


    其中两种不同的宽度设置是为了兼容浏览器，高度auto是为了保持比例。

