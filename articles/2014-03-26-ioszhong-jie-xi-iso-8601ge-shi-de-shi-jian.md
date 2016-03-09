---
title: iOS中解析ISO 8601格式的时间
date: 2014-03-26 10:40
---
Rails中默认时间的输出格式是这样的：`2014-03-25T06:26:01.927Z`。这种格式是ISO 8601，日期和时间之后用T来分割，最好的Z表示是UTC时间。如果不是UTC时间需要这么表示：`2014-03-25T06:26:01.927+0800`。具体参考wikipedia：<http://zh.wikipedia.org/wiki/ISO_8601>。

在iOS中解析的时候需要用这样的格式化字符串：`@"yyyy-MM-dd'T'HH:mm:ss.SSSZZZ"`。

参考：<http://stackoverflow.com/questions/7925038/why-nsdateformatter-can-not-parse-date-from-iso-8601-format>
