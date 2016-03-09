---
layout: post
title: 改变UIButton中title和image的位置
date: 2011-11-10 12:52
categories:
- iphone
tags:
- iphone
- UIButton
published: true
comments: true
---
UIButton可以同时设置title和image，默认图片在文字的左边，然后图片和文字一起居中。如果想调整图片和文字的位置，可以设置UIButton的titleEdgeInsets和imageEdgeInsets属性。titleEdgeInsets和imageEdgeInsets属性设置的值为UIEdgeInsets结构，这个结构包含上下左右4个字段，默认都是0。如果想要调整某个方向，比如left设为1，就是在原来的位置上向右移动1个像素。

没有设置之前：

![UIButton_Title_Image_1](http://phaibin.tk/wp-content/uploads/2011/11/UIButton_Title_Image_1.jpg)

要想把图片和文字互换位置，就把imageEdgeInsets的left设为文字的宽度，把titleEdgeInsets的right设为图片的宽度。

![UIButton_Title_Image_2](http://phaibin.tk/wp-content/uploads/2011/11/UIButton_Title_Image_2.jpg)