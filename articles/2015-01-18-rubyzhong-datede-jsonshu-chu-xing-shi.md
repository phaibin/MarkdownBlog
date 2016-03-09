---
title: Ruby中Date的json输出形式
date: 2015-01-18 11:33
---
Rails中用jbuilder输出日期是这种形式：
> 2015-01-15T07:48:30.435Z

可是一个date直接用to_s输出是这种形式：
> 2015-01-18 11:36:11 +0800

如果也要输出上述形式其实很简单：
> Time.now.utc.as_json