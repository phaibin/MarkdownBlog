---
layout: post
title: 在Vista下建立扩展分区
date: 2009-02-01 13:43
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p>运行 DISKPART，输入 Create PARTTITION EXTENDED 建立一个扩展分区，这个扩展分区会包括所有的空余磁盘空间。然后再输入 Create PARTTITION LOGICAL 建立一个逻辑分区。这个逻辑分区也会使用扩展分区的所有空间。当我们再次进入计算机管理中的磁盘管理的时候就可以看到扩展分区和逻辑分区了，直接删除那个占用所有剩余空间的逻辑分区，然后再重新建立逻辑分区就可以了。 <br /></p>
