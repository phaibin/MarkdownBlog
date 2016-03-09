---
layout: post
title: iphone app图标设置
date: 2011-10-26 14:28
categories:
- iphone
tags:
- iphone
- 图标
published: true
comments: true
---
Icon.png - Homescreen icon on iPhone/iPod touch. (57*57)

Icon-72.png - Homescreen icon on iPad. (72*72)

Icon@2x.png - Homescreen icon on iPhone 4. (114*114)

Icon-Small.png - Icon in Spotlight and Settings app on iPhone/iPod touch and icon in Settings app on iPad. (29*29)

Icon-Small-50.png - Icon in Spotlight on iPad. (50*50)

Icon-Small@2x.png - Icon in Spotlight and Settings app on iPhone 4. (58*58)

iTunesArtwork - Icon in iTunes for Ad Hoc distribution builds. (512*512)

如果想把图标的透明效果去掉，在info.plist里面加上一个key：

    Icon already includes gloss effects = YES

在XCode4.2和iOS5里面多了一个条目：Icon files (iOS 5)，这里面也有一个“Icon already includes gloss effects”，需要把这个键也设为YES。
