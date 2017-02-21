---
title: iOS中强制一个页面横屏
date: 2017-02-21 14:15
---
参考：<http://swiftiostutorials.com/ios-orientations-landscape-orientation-one-view-controller/>

整个App是竖屏的，但是某个页面需要横屏显示，典型的就是视频播放器。一个很简单的需求，实现起来确实不容易。

搜索了很多解答都不行，在这篇文章里面作者给了一个简单的实现，并且还有demo，很棒。我试验了用navigation push的方式来横屏会有问题，用present model的形式还是比较理想的。后续可以做一些优化，加上自定义的转化动画，类似汽车之家的播放器。