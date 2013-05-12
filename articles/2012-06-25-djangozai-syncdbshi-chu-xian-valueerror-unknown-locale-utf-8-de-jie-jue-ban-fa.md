---
layout: post
title: 'Django在syncdb时出现“ValueError: unknown locale: UTF-8″ 的解决办法'
date: 2012-06-25 10:47
categories:
- Python
tags:
- django
published: true
comments: true
---
参考<http://patrick.arminio.info/blog/2012/02/fix-valueerror-unknown-locale-utf8/>

在.bash_profile中加入：

    export LANG="zh_CN.UTF-8"
    export LC_COLLATE="zh_CN.UTF-8"
    export LC_CTYPE="zh_CN.UTF-8"
    export LC_MESSAGES="zh_CN.UTF-8"
    export LC_MONETARY="zh_CN.UTF-8"
    export LC_NUMERIC="zh_CN.UTF-8"
    export LC_TIME="zh_CN.UTF-8"
    export LC_ALL=
    
zh_CN是你本地的语言代码。
