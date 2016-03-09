---
title: '修复dyld: DYLD_ environment variables being ignored错误'
date: 2013-07-19 11:16
tags:
- mac
- dyld
---
参考：<http://stackoverflow.com/questions/12064725/dyld-dyld-environment-variables-being-ignored-because-main-executable-usr-bi>

自从升级到了Mountain Lion，这个警告就出来了。在Lion之前的版本都没出现过。具体原因搞不清楚。

目前最好的方法是，在shell的配置文件里面加上：

    sudo () { ( unset LD_LIBRARY_PATH DYLD_LIBRARY_PATH; exec command sudo $* ) }

但是，貌似有时候还是会蹦出那个警告。期待在10.9里面苹果能解决这个问题。