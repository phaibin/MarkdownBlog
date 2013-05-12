---
layout: post
title: XCode4.2和iOS5中的定位
date: 2011-11-18 07:08
categories:
- iphone
tags:
- ios5
- xcode
- 定位
published: true
comments: true
---
从Lion和XCode4.1开始就不能定位了，升级到XCode4.2之后增加了模拟定位，改变位置方便了，找自己的位置还是不太方便。要改变模拟定位，一种方法是在Schema里面：

![xcode42_location_1](http://phaibin.tk/wp-content/uploads/2011/11/xcode42_location_1.png)

或者在运行的时候在debug bar改变：

![xcode42_location_2](http://phaibin.tk/wp-content/uploads/2011/11/xcode42_location_2.png)

要想模拟自己的位置，需要加一个GPX文件：

![xcode42_location_3](http://phaibin.tk/wp-content/uploads/2011/11/xcode42_location_3.png)

这个文件是xml格式的，可是更改为自己的经纬度。添加之后选择这个文件就可以定位到当前位置了。
