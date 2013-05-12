---
layout: post
title: google Map经纬度坐标取得方法
date: 2011-11-18 06:16
categories:
- 疑难杂症
tags:
- google
published: true
comments: true
---
首先打开Google地图，在上面寻找一个地址，然后上下左右移动地图，让这个地址正好处于地图的正中心位置，当您想寻找坐标位置已经处于地图的中心位置的时候，拷贝并粘贴以下代码到你的浏览器地址栏:

    javascript:void(prompt('',gApplication.getMap().getCenter())); 
    
这时，你将得到一个弹出式的坐标，这个坐标就是你需要找的经度和纬度


