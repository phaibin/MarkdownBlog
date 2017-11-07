---
title: 修复jetbrains家族在Mac下字体显示问题
date: 2016-04-18 15:52
---
装完Android Studio之后总感觉代码看的很不清楚，换主题之后尤其突出。然后代码粘贴到Sublime Text里面，一对比吓一跳，差别太大了。设置一样的字体和大小，Sublime Text里面又清楚又好看，而Android Studio里面好像做了锐化处理，看着很不舒服。

Android Studio里面有一个Antialiasing设置，默认是Subpixel，已经是最优的设置。

搜索之后找到了这一篇文章：<https://blog.jamespan.me/2015/01/16/font-of-intellij/>。

原来就是把Android Studio使用的JDK换回Apple的JDK6就好了。

修改方法是：打开`/Applications/Android Studio.app/Contents/Info.plist`文件，修改`JVMOptions`下面的`JVMVersion`为：`1.6*,1.7+`。

JDK6的下载地址：<https://support.apple.com/kb/DL1572?locale=en_US>。

这真的很不可思议，JDK居然会影响字体的渲染。而且最新版的JDK有问题，老的反而没问题。那不是几乎每个人都在被这个问题虐么？
