---
title: self.title和self.tabBarItem.title、self.navigationItem.title的关系
date: 2014-04-28 15:33
---
设置页面标题的方法我一直认为是

    self.title = @"Page Title";

后来看到有人这么写：

    self.navigationItem.title = @"Page Title";

感觉很麻烦，跟前面一种写法效果完全是一样的。于是每当看到这样的写法就被我改成了第一种写法。

直到最近我才发现原来是不一样的。

最近接到一个小项目，在设计图里面，tab和页面的标题是不一样的。我的写法是这样的：

    self.tabBarItem.title = @"Tab title";
    self.title = @"Page title";

这样运行起来我奇怪的发现tab和页面的标题都变成了"Page title"！Google了一下发现居然有人碰到了跟我一样的问题：<http://blog.csdn.net/huifeidexin_1/article/details/8078118>。

我这才明白原来设置`self.title`跟`self.navigationItem.title`是不一样的。`self.title`相当于是同时设置`tabBarItem.title`和`navigationItem.title`的快捷方法，而`tabBarItem.title`才是真正对应tab的标题，`navigationItem.title`对应NavigationBar上面的标题。

这么基础的知识直到今天才明白真是惭愧，可惜的是Xcode的文档里面居然没有提到。