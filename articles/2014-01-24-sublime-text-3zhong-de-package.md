---
title: Sublime Text 3中的Package
date: 2014-01-24 18:20
---
最近把Sublime Text升级到了3，但是发现Package的结构跟Sublime Text 2完全不一样了。在`~/Library/Application Support/Sublime Text 3/Packages`中完全找不到之前的那些Package了。在上一级的Cache目录，能发现一些似曾相识的Package目录，但是里面的都是.cache文件，而且是二进制的，不能编辑。

搜索了很久终于找到了答案：<http://maximilianhoffmann.com/posts/configuring-sublime-text-3>。

原来Sublime Text 3将自带的Package放到了应用程序里面。你可以从Package Control安装一个叫PackageResourceViewer的Package。这个Package可以查看程序自带的那些Package，也可以将某个Package解压到默认的`~/Library/Application Support/Sublime Text 3/Packages`目录下面。然后就可以像Sublime Text 2那样来随意修改了。