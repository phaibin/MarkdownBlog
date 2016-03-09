---
title: Ruby使用多种字分割字符串
date: 2013-06-13 22:01
tags:
- ruby
---
参考：<http://stackoverflow.com/questions/6207303/split-a-string-with-multiple-delimiters-in-ruby>

单纯使用String#split方法也可以办到，但是十分麻烦，就是使用一个很复杂的正则表达式作为参数。看到另外一个人的解答很精妙，独辟蹊径，很简单地解决了这个问题：

    str.gsub(/;|,|\./, ' ').split

先把各种分隔符统一替换为一种字符，然后分割。

