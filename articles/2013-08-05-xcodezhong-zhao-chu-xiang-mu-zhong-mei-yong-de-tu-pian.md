---
title: XCode中找出项目中没用的图片
date: 2013-08-05 11:07
tags:
- ios
- xcode
---
参考：<http://stackoverflow.com/questions/6113243/how-to-find-unused-images-in-an-xcode-project>

首先找出在项目文件目录下面，但是没用加入到项目中的图片：

在左侧导航的项目目录上面点击右键，选择加入文件，或者按快捷键cmd+option+A，打开Finder窗口。在Finder里面灰色不能点的文件就是已经加入到项目中的文件，而亮的可以点的，就是没用加入到项目中的。这些文件就可以删掉了。

其次是加入到项目中，但是其实没有用到的图片：

在target的Build Phases中加入一条run script，代码为：

    #!/bin/sh
    PROJ=`find . -name '*.xib' -o -name '*.[mh]'`

    for png in `find . -name '*.png'`
    do
        name=`basename $png`
        if ! grep -qhs "$name" "$PROJ"; then
            echo "$png is not referenced"
        fi
    done

然后在Build输出中就可以看到哪些图片没有用了。