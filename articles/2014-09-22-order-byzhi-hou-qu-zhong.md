---
title: Order By之后去重
date: 2014-09-22 18:36
---
参考：<http://stackoverflow.com/questions/15549174/select-distinct-records-based-on-one-field-while-keeping-other-fields-intact>

    select max(id), address, max(date) as latest 
           from searches 
           group by address 
           order by latest desc
