---
title: 获取表索引的SQL
date: 2019-11-12 10:40
---
可以使用`show keys from tablename`或者从`INFORMATION_SCHEMA.STATISTICS`表里面查询来获取表的索引。但是这两种方式都有一个毛病，就是组合索引是分开两条记录来返回的，每条记录一个字段。

可以通过组合`INFORMATION_SCHEMA.STATISTICS`中的记录来改进一下:

``` sql
SELECT table_name AS `Table`,
       index_name AS `Index`,
       GROUP_CONCAT(column_name ORDER BY seq_in_index) AS `Columns`
FROM information_schema.statistics
WHERE table_schema = 'database' and table_name = 'table'
GROUP BY index_name;
```

但是这样查询的结果还不够完美，索引的顺序乱了。`INFORMATION_SCHEMA.STATISTICS`中默认查询出来的顺序就是索引添加的顺序。可惜的是`INFORMATION_SCHEMA.STATISTICS`中没有主键，也没有其他可以辅助排序的字段。

进过摸索之后终于找到了一种可以保留索引顺序的写法：

``` sql
select b.* from 
(SELECT @rownum := @rownum + 1 AS row_number, table1.*
FROM (select distinct table_schema, table_name, index_name from INFORMATION_SCHEMA.STATISTICS 
where table_schema='database' and table_name='table') table1 JOIN (SELECT @rownum := 0) r) a
join
(select table_schema, table_name, index_name, GROUP_CONCAT(column_name order by seq_in_index) column_name, Non_unique, Index_type 
from INFORMATION_SCHEMA.STATISTICS
where table_schema='database' and table_name='table'
group by table_schema, table_name, index_name, Non_unique, Index_type) b
on a.table_schema = b.table_schema and a.table_name = b.table_name and a.index_name = b.index_name
order by a.row_number
```

原理就是上面的SQL跟原始的SQL join，按照默认SQL的顺序来排序。