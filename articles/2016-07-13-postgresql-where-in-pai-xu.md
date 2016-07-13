---
title: Postgresql where in 排序
date: 2016-07-13 13:35
---
意思就是写where id in (...)的时候按照in里面的顺序来排列结果：

    select *
    from comments
    where id in (1,3,2,4)
    order by position(id::text in '1,3,2,4')
