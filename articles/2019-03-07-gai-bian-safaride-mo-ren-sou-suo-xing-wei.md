---
title: 改变Safari的默认搜索行为
date: 2019-03-07 15:51
---
不知道你在Safari中搜索的时候有没有发现过下面的现象：

![Safari Search](/images/search_in_safari_1.png)

明明网页中有`complete`这个词，可是却搜不到？难道是Safari的bug？拜托如果Safari这么弱，我们就可以舍弃Mac了。

玄机就在放大镜那里，点开之后会出现一个菜单：

![Safari Search](/images/search_in_safari_2.png)

这下你应该明白了吧！默认是开头匹配模式！如果没发现的人会误大事啊！明明页面里面有结果却没找到。

苹果虽然设计简洁漂亮，可是这个选项也太隐蔽了，而且Safari的设置里面也没有。

然后我搜索了一下发现了这篇文章：<https://www.macworld.com/article/1161764/search_substrings_safari.html>。

这篇文章是2011年的，也就是说最晚在2011年就已经有这个问题了，而我今天才发现。最神奇的是老外居然找到了一条命令来改变这个行为：

```
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool FALSE
```

运行之后就会回到我们熟悉的那个世界了。