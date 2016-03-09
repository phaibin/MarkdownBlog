---
layout: post
title: MKMapView自定义pin位置对齐
date: 2013-02-22 09:25
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
原文：<http://blog.csdn.net/favormm/article/details/6191109>

用MKAnnotationView自定义pin的时候，默认使用图片的中心点来表示pin的位置，这样有可能就会显示不正确。MKAnnotationView有个属性可以调整pin的位置：

    // By default, the center of annotation view is placed over the coordinate of the annotation.
    // centerOffset is the offset in pixels from the center of the annotion view.
    @property (nonatomic) CGPoint centerOffset;

正的值使annotation view向右下移动。

还有一个calloutOffset属性，用来移动callout。
