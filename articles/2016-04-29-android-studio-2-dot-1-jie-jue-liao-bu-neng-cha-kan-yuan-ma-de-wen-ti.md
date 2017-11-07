---
title: Android Studio 2.1 解决了不能查看源码的问题
date: 2016-04-29 11:18
---
在Android Studio中选择“跳转到实现”可以查看方法的定义，如果是Android内部的方法，实际上是jar反编译的代码。在编辑器的最上面会提示你可以下载Android源码来查看，但是下载完之后这个提示还在，并且源码也显示不出来。

在Android Studio 2.1中修复了这个问题。参考：<http://stackoverflow.com/a/36903786/771472>。

方法是：

进入Preferences -> System Settings -> Android SDK，然后一路Next, next, next，完成之后就好了。
