---
layout: post
title: 提取pdf目录的方法
date: 2012-01-06 14:54
categories:
- iphone
tags:
- iphone
- pdf
published: true
comments: true
---
理论知识：<http://stackoverflow.com/questions/4643489/how-do-i-retrieve-a-page-number-or-page-reference-for-an-outline-destination-in>

原理就是：通过CGPDFDocumentGetCatalog方法可以获取pdf的元信息，这是一个类似Dictionary的结构，而目录信息就放在里面，需要自己解析出来。

在这里：<https://github.com/below/PDF-Voyeur>有一个人写的开源项目，可以查看pdf的元信息，而我也是根据他的代码来找出pdf的目录的。

比如这本书：

![iphone_outlines](http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines.png)

用PDF-Voyeur打开之后看到的是这样的：

![Voyeur_iphone](http://phaibin.tk/wp-content/uploads/2012/01/Voyeur_iphone.png)

/Outlines这个节点代表的就是目录，点开Outlines之后会看到/First和/Last，这两个就是第一个和最后一个目录

![Voyeur_iphone_2](http://phaibin.tk/wp-content/uploads/2012/01/Voyeur_iphone_2.png)

而/First下面又包含/Next，所有的目录就像链表一样这样串联起来的。

在目录的节点下面可以看到title，就是目录的名字，但是要找到跳转的页数就不容易了。根据本文第一个链接里面的回答，目录索引的方式有3种：

1. 用/Dest来索引，Dest是一个array，这时候/Dest下面第一个对象就是page的对象。跟节点下面的pages对象包含的就是所有的page对象，代表每一页，把/Dest下面的page跟所有的page对比，用==判断，就可以找出页码。需要注意的是pages有的时候下面不直接包含page对象，而是像子目录一样包含了很多层级，需要判断节点的type是pages还是page。

    ![iphone_outlines_dest](http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines_dest.png)

2. 用/Dest索引，但是Dest是一个name，这时候需要在根节点下面的/Dests里面找到对应名字的节点，然后从里面找到page对象，再用类型1里面的方法来找到页数

    ![iphone_outlines_dest_name](http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines_dest_name.png)

3. 用/A来索引，这种情况跟第一个类似，只要在/D下面找到page对象就好了

![iphone_outlines_a](http://phaibin.tk/wp-content/uploads/2012/01/iphone_outlines_a.png)


最后附上我做的一个demo：[IPadTest.zip](http://phaibin.tk/wp-content/uploads/2012/01/IPadTest.zip)
