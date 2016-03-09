---
title: Ruby中文排序
date: 2014-09-10 16:31
---
安装iconv，这是个负责在字符集间进行转换的函数库。如果要使用它，还需要在controller中加上 require 'iconv'

实现：

    conv = Iconv.new("GBK", "utf-8")
    ordername  from provinces order by ordername desc")
    @test1 = Province.find(:all).sort {|x, y| conv.iconv(x.prov_name) <=> conv.iconv(y.prov_name)}
