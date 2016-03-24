---
title: 把同一列作为字符串连接起来的SQL语句（Postgres）
date: 2016-03-24 08:35
---
参考：<https://bytes.com/topic/postgresql/answers/661106-aggregate-concatenate-function-flattening-columns-into-row>

我有一张这样的表：
![](/images/sql.png)

想得到这样的数据：
14489, 689, 694, 18612, 14488...

也就是把id列用","连接起来。

解决方法是这样的：

select array_to_string(array(select id from series limit 10), ',');


