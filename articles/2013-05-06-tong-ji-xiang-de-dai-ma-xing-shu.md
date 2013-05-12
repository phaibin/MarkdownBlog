---
title: 统计项目的代码行数
date: 2013-05-06 17:10
---
原文：<http://blog.csdn.net/sheldongreen/article/details/7938410>

在终端运行：
    find . "(" -name "*.m" -or -name "*.strings" -or -name "*.h" ")" -print | xargs wc -l 
原文是统计iOS项目的，其实对任何项目都是适用的，只要指定好要统计文件的扩展名就可以了。

