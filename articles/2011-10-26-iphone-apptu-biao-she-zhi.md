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
<p><p>Icon.png - Homescreen icon on iPhone/iPod touch. (57*57)<br />Icon-72.png - Homescreen icon on iPad. (72*72)<br />Icon@2x.png - Homescreen icon on iPhone 4. (114*114)<br />Icon-Small.png - Icon in Spotlight and Settings app on iPhone/iPod touch and icon in Settings app on iPad. (29*29)<br />Icon-Small-50.png - Icon in Spotlight on iPad. (50*50)<br />Icon-Small@2x.png - Icon in Spotlight and Settings app on iPhone 4. (58*58)<br />iTunesArtwork - Icon in iTunes for Ad Hoc distribution builds. (512*512)</p>
<p>如果想把图标的透明效果去掉，在info.plist里面加上一个key：</p>
<p>Icon already includes gloss effects = YES</p>
<p>在XCode4.2和iOS5里面多了一个条目：Icon files (iOS 5)，这里面也有一个“Icon already includes gloss effects”，需要把这个键也设为YES。</p></p>
