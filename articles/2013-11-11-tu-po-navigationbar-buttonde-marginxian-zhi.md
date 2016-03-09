---
title: 突破NavigationBar Button的Margin限制
date: 2013-11-11 10:21
---
参考：<http://stackoverflow.com/questions/4715280/placing-a-custom-view-based-uibarbuttonitem-in-the-navigation-bar-without-defaul>

在NavigationBar上面可以用CustomView生成自定义的按钮，但是leftBarButtonItem和rightBarButtonItem的左右都有一定限制，不管怎么设置frame都不能超过这个限制。

之前使用的办法是在View里面加入Button，然后把Button的frame设为负数，然后再把CustomView设为这个View。也就是让Button超出View的范围。这种方法的坏处就是，在超出的Button部分点击是不起作用的，因为点击事件没法被View捕捉到。一个修复的方法就是使用一个自定义View，重新定义hitTest方法。但是明显要麻烦很多。

在这个帖子里面的方法就优雅多了。方法是在ButtonItem左边加一个FixedSpace类型的ButtonItem，然后把FixedSpace的ButtonItem的宽带设为负数，于是自己的ButtonItem就向左移了。
