---
layout: post
title: 断点续传的原理和实现方法
date: 2012-01-06 15:27
categories:
- iphone
tags: []
published: true
comments: true
---
断点续传其实很简单，就是在http header里面加入这么一句：

    Range: bytes=1000-

这样如果服务器支持断点续传，就会从1000的位置开始传送，也可以写1000-2000，表示传输从1000字节到2000字节的内容。这时候服务器返回的信息会是这样的：

    206 Content-Length: 106786028 
    Content-Range: bytes 1000-2000/106786028

返回的代码也变为206了。

在iphone里面做只需要加入这么一句就好了：

    [request setValue:[NSString stringWithFormat:@"bytes=%d-", size] forHTTPHeaderField:@"Range"];

另外，找到了一个测试http连接的小工具：<http://apikitchen.com/>，可以在线测试，也有MacOS版。非常好用。
比如测试这个连接：

![apikitchen_1](http://phaibin.tk/wp-content/uploads/2012/01/apikitchen_1.png)

执行之后结果为：

![apikitchen_2](http://phaibin.tk/wp-content/uploads/2012/01/apikitchen_2.png)

唯一美中不足的是这个工具会把请求的文件全部获取下来，如果你测试的是一个很大的文件就不现实了。
