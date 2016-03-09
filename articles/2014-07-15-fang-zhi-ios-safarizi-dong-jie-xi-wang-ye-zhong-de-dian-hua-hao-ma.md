---
title: "防止iOS safari自动解析网页中的电话号码"
date: 2014-07-15 10:07
---
最近做了一个网页，里面有一串数字：1866139。在电脑的safari打开显示是正常的，但是iphone的safari打开很奇怪，这一串数字变成了蓝色的链接形式。

我猜测是因为浏览器把这串数字当成了电话号码，自动变成了链接。搜索之后发现果然是这样。

解决办法就是在header里面加这样一个meta：

    <meta name="format-detection" content="telephone=no">
