---
title: 解决Xcode在Release模式下调试出错的问题
date: 2013-06-08 09:58
---
Xcode在Release模式下调试的时候会有一些莫名其妙的问题。比如停在了某个断点，po一个变量却报找不到。代码本身是没有问题的。这个问题困扰了我好久，今天才明白是怎么回事。

原来是Xcode的项目设置里面对Release模式进行了优化，具体的设置见这张图：

![URL](/images/articles/Xcode_Release.png)

把Release模式的这个参数改回“None [-O0]”，调试就没问题了。发布的时候记得改回去。

不过其实配置另外一套debug的schema，但是连接线上环境，应该是更好的解决办法。