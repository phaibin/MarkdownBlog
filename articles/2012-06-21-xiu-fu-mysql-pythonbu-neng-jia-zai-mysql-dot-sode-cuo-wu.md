---
layout: post
title: 修复MySQL-python不能加载_mysql.so的错误
date: 2012-06-21 11:50
categories:
- Python
tags: []
published: true
comments: true
---
如果出现了
> django.core.exceptions.ImproperlyConfigured: Error loading MySQLdb module: dlopen(/Users/xxx/xxx/pyprojects/xxx/lib/python2.7/site-packages/_mysql.so, 2): Library not loaded: libmysqlclient.18.dylibReferenced from: /Users/xxx/xxx/pyprojects/xxx/lib/python2.7/site-packages/_mysql.soReason: image not found

这样的错误。

在`.bash_profile`中加入： 

    export DYLD_LIBRARY_PATH="$DYLD_LIBRARY_PATH:/usr/local/mysql/lib/"

不过这样只能影响控制台，不能影响IDE等工具，如果要永久修复需要运行：

    sudo install_name_tool -change libmysqlclient.18.dylib /usr/local/mysql/lib/libmysqlclient.18.dylib /usr/local/Cellar/python/2.7.3/Frameworks/Python.framework/Versions/2.7/lib/python2.7/site-packages/_mysql.so

\_mysql.so其实是一个到libmysqlclient.18.dylib的引用，这个命令就是建立_mysql.so到mysql里面library的永久链接。
