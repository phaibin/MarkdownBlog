---
layout: post
title: 建立iOS Framework的模板
date: 2011-10-26 10:02
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
<p><p>在iOS的项目中没有framework的选项，搜了一下，发现有个人建立了一个模板，可以用来建iphone的framework。</p>
<p>代码在这里：<a href="https://github.com/kstenerud/iOS-Universal-Framework">https://github.com/kstenerud/iOS-Universal-Framework</a></p>
<p>今天把修改的腾讯微博的SDK做成framework，因为引用到了YAJL的库，想让自己的库包含YAJL，这样应用就不需要包含两个库了。但是运行的时候出问题，把自己的库和YAJL分别添加一次就好了。我猜想库之间是不能互相包含的，只能是依赖的关系。添加一个库的时候需要把它依赖的库也同时添加进来。</p>
<p>还有一件很诡异的事情，我在引用framework的项目里面调试，出错的时候居然打开了framework里的源文件，断点停在了出错的那一行上。这真是太神奇了。也许是XCode侦测到我打开过framework的项目，自动引用到了。</p></p>
