---
layout: post
title: CLLocation的几个重要属性
date: 2011-06-26 23:42
categories:
- iphone
tags: []
published: true
comments: true
---
- coordinate.latitude：纬度
- coordinate.longitude：经度
- HorizontalAccuracy：水平方向的精确度，为负值表示你不能依赖coordinate
- altitude：海拔高度
- verticalAccuracy：海拔方面的精确度，为负值表示无法确定有效的海拔
- timestamp：确定位置的时间
- CLLocation还有一个有用的实例方法，用来确定两个CLLocation对象之间的距离：

      CLLocationDistance distance = [fromLocation distanceFromLocation:toLocation];
