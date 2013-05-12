---
layout: post
title: Managing Hierarchical Data in MySQL(推荐)
date: 2009-06-09 15:17
categories:
- 算法
tags: []
published: true
comments: true
---
<p><p>原文在：<a title="http://dev.mysql.com/tech-resources/articles/hierarchical-data.html" href="http://dev.mysql.com/tech-resources/articles/hierarchical-data.html">http://dev.mysql.com/tech-resources/articles/hierarchical-data.html</a></p> <p>译文:Yimin</p> <h1><strong>引言<br /></strong></h1> <p>大多数用户都曾在数据库中处理过分层数据(hierarchical data)，认为分层数据的管理不是关系数据库的目的。之所以这么认为，是因为关系数据库中的表没有层次关系，只是简单的平面化的列表；而分层数据具有父－子关系，显然关系数据库中的表不能自然地表现出其分层的特性。</p> <p>我们认为，分层数据是每项只有一个父项和零个或多个子项（根项除外，根项没有父项）的数据集合。分层数据存在于许多基于数据库的应用程序中，包括论坛和邮件列表中的分类、商业组织图表、内容管理系统的分类、产品分类。我们打算使用下面一个虚构的电子商店的产品分类： </p> <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_10.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_thumb_4.png" width="708" height="389" /></a> </p> <p>这些分类层次与上面提到的一些例子中的分类层次是相类似的。在本文中我们将从传统的邻接表(adjacency list)模型出发，阐述2种在MySQL中处理分层数据的模型。<br /> <h1><strong>邻接表模型</strong></h1> <p>上述例子的分类数据将被存储在下面的数据表中（我给出了全部的数据表创建、数据插入的代码，你可以跟着做）：</p> <blockquote><pre /><font color="#800000" size="2">CREATE TABLE category(<br />
category_id INT AUTO_INCREMENT PRIMARY KEY,<br />
name VARCHAR(20) NOT NULL,<br />
parent INT DEFAULT NULL);</font></blockquote></p>

<p>INSERT INTO category<br />
VALUES(1,'ELECTRONICS',NULL),(2,'TELEVISIONS',1),(3,'TUBE',2),<br />
(4,'LCD',2),(5,'PLASMA',2),(6,'PORTABLE ELECTRONICS',1),<br />
(7,'MP3 PLAYERS',6),(8,'FLASH',7),<br />
(9,'CD PLAYERS',6),(10,'2 WAY RADIOS',6);</p>

<p>SELECT * FROM category ORDER BY category_id;</p>

<p>+-------------+----------------------+--------+<br />
| category_id | name                 | parent |<br />
+-------------+----------------------+--------+<br />
|           1 | ELECTRONICS          |   NULL |<br />
|           2 | TELEVISIONS          |      1 |<br />
|           3 | TUBE                 |      2 |<br />
|           4 | LCD                  |      2 |<br />
|           5 | PLASMA               |      2 |<br />
|           6 | PORTABLE ELECTRONICS |      1 |<br />
|           7 | MP3 PLAYERS          |      6 |<br />
|           8 | FLASH                |      7 |<br />
|           9 | CD PLAYERS           |      6 |<br />
|          10 | 2 WAY RADIOS         |      6 |<br />
+-------------+----------------------+--------+<br />
10 rows in set (0.00 sec)

<p>在邻接表模型中，数据表中的每项包含了指向其父项的指示器。在此例中，最上层项的父项为空值(NULL)。邻接表模型的优势在于它很简单，可以很容易地看出FLASH是MP3 PLAYERS的子项，哪个是portable electronics的子项，哪个是electronics的子项。虽然，在客户端编码中邻接表模型处理起来也相当的简单，但是如果是纯SQL编码的话，该模型会有很多问题。 </p>
<h2><strong>检索整树</strong></h2>
<p>通常在处理分层数据时首要的任务是，以某种缩进形式来呈现一棵完整的树。为此，在纯SQL编码中通常的做法是使用自连接(self-join)：
<blockquote><pre /><font color="#800000" size="2">SELECT t1.name AS lev1, t2.name as lev2, t3.name as lev3, t4.name as lev4<br />
FROM category AS t1<br />
LEFT JOIN category AS t2 ON t2.parent = t1.category_id<br />
LEFT JOIN category AS t3 ON t3.parent = t2.category_id<br />
LEFT JOIN category AS t4 ON t4.parent = t3.category_id<br />
WHERE t1.name = 'ELECTRONICS';</font></blockquote></p>

<p>+-------------+----------------------+--------------+-------+<br />
| lev1        | lev2                 | lev3         | lev4  |<br />
+-------------+----------------------+--------------+-------+<br />
| ELECTRONICS | TELEVISIONS          | TUBE         | NULL  |<br />
| ELECTRONICS | TELEVISIONS          | LCD          | NULL  |<br />
| ELECTRONICS | TELEVISIONS          | PLASMA       | NULL  |<br />
| ELECTRONICS | PORTABLE ELECTRONICS | MP3 PLAYERS  | FLASH |<br />
| ELECTRONICS | PORTABLE ELECTRONICS | CD PLAYERS   | NULL  |<br />
| ELECTRONICS | PORTABLE ELECTRONICS | 2 WAY RADIOS | NULL  |<br />
+-------------+----------------------+--------------+-------+<br />
6 rows in set (0.00 sec)

<h2><strong>检索所有叶子节点</strong></h2>
<p>我们可以用左连接(LEFT JOIN)来检索出树中所有叶子节点(没有孩子节点的节点）：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT t1.name FROM<br />
category AS t1 LEFT JOIN category as t2<br />
ON t1.category_id = t2.parent<br />
WHERE t2.category_id IS NULL;</font></blockquote></p>

<p>+--------------+<br />
| name         |<br />
+--------------+<br />
| TUBE         |<br />
| LCD          |<br />
| PLASMA       |<br />
| FLASH        |<br />
| CD PLAYERS   |<br />
| 2 WAY RADIOS |<br />
+--------------+

<h2><strong>检索单一路径</strong></h2>
<p>通过自连接，我们也可以检索出单一路径：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT t1.name AS lev1, t2.name as lev2, t3.name as lev3, t4.name as lev4<br />
FROM category AS t1<br />
LEFT JOIN category AS t2 ON t2.parent = t1.category_id<br />
LEFT JOIN category AS t3 ON t3.parent = t2.category_id<br />
LEFT JOIN category AS t4 ON t4.parent = t3.category_id<br />
WHERE t1.name = 'ELECTRONICS' AND t4.name = 'FLASH';</font></blockquote></p>

<p>+-------------+----------------------+-------------+-------+<br />
| lev1        | lev2                 | lev3        | lev4  |<br />
+-------------+----------------------+-------------+-------+<br />
| ELECTRONICS | PORTABLE ELECTRONICS | MP3 PLAYERS | FLASH |<br />
+-------------+----------------------+-------------+-------+<br />
1 row in set (0.01 sec)

<p>这种方法的主要局限是你需要为每层数据添加一个自连接，随着层次的增加，自连接变得越来越复杂，检索的性能自然而然的也就下降了。
<h2><strong>邻接表模型的局限性</strong></h2>
<p>用纯SQL编码实现邻接表模型有一定的难度。在我们检索某分类的路径之前，我们需要知道该分类所在的层次。另外，我们在删除节点的时候要特别小心，因为潜在的可能会孤立一棵子树（当删除portable electronics分类时，所有他的子分类都成了孤儿）。部分局限性可以通过使用客户端代码或者存储过程来解决，我们可以从树的底部开始向上迭代来获得一颗树或者单一路径，我们也可以在删除节点的时候使其子节点指向一个新的父节点，来防止孤立子树的产生。</p>
<h1><strong>嵌套集合(Nested Set)模型</strong></h1>
<p>我想在这篇文章中重点阐述一种不同的方法，俗称为嵌套集合模型。在嵌套集合模型中，我们将以一种新的方式来看待我们的分层数据，不再是线与点了，而是嵌套容器。我试着以嵌套容器的方式画出了electronics分类图：
<p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_12.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_thumb_5.png" width="668" height="214" /></a>
<p>&nbsp; <p>从上图可以看出我们依旧保持了数据的层次，父分类包围了其子分类。在数据表中，我们通过使用表示节点的嵌套关系的左值(left value)和右值(right value)来表现嵌套集合模型中数据的分层特性：
<blockquote><pre /><font color="#800000" size="2">CREATE TABLE nested_category (<br />
 category_id INT AUTO_INCREMENT PRIMARY KEY,<br />
 name VARCHAR(20) NOT NULL,<br />
 lft INT NOT NULL,<br />
 rgt INT NOT NULL<br />
);</font></blockquote></p>

<p>INSERT INTO nested_category<br />
VALUES(1,'ELECTRONICS',1,20),(2,'TELEVISIONS',2,9),(3,'TUBE',3,4),<br />
(4,'LCD',5,6),(5,'PLASMA',7,8),(6,'PORTABLE ELECTRONICS',10,19),<br />
(7,'MP3 PLAYERS',11,14),(8,'FLASH',12,13),<br />
(9,'CD PLAYERS',15,16),(10,'2 WAY RADIOS',17,18);</p>

<p>SELECT * FROM nested_category ORDER BY category_id;</p>

<p>+-------------+----------------------+-----+-----+<br />
| category_id | name                 | lft | rgt |<br />
+-------------+----------------------+-----+-----+<br />
|           1 | ELECTRONICS          |   1 |  20 |<br />
|           2 | TELEVISIONS          |   2 |   9 |<br />
|           3 | TUBE                 |   3 |   4 |<br />
|           4 | LCD                  |   5 |   6 |<br />
|           5 | PLASMA               |   7 |   8 |<br />
|           6 | PORTABLE ELECTRONICS |  10 |  19 |<br />
|           7 | MP3 PLAYERS          |  11 |  14 |<br />
|           8 | FLASH                |  12 |  13 |<br />
|           9 | CD PLAYERS           |  15 |  16 |<br />
|          10 | 2 WAY RADIOS         |  17 |  18 |<br />
+-------------+----------------------+-----+-----+

<p>我们使用了<strong>lft</strong>和<strong>rgt</strong>来代替left和right，是因为在MySQL中left和right是保留字。http://dev.mysql.com/doc/mysql/en/reserved-words.html，有一份详细的MySQL保留字清单。
<p>那么，我们怎样决定左值和右值呢？我们从外层节点的最左侧开始，从左到右编号：
<p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_14.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_thumb_6.png" width="686" height="209" /></a>
<p>这样的编号方式也同样适用于典型的树状结构：</p>
<p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_16.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_thumb_7.png" width="687" height="361" /></a> </p>
<p>&nbsp;</p>
<p>当我们为树状的结构编号时，我们从左到右，一次一层，为节点赋右值前先从左到右遍历其子节点给其子节点赋左右值。这种方法被称作改进的<strong>先序遍历算法</strong>。
<h2><strong>检索整树</strong></h2>
<p>我们可以通过自连接把父节点连接到子节点上来检索整树，是因为子节点的<strong>lft</strong>值总是在其父节点的<strong>lft</strong>值和<strong>rgt</strong>值之间：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT node.name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
AND parent.name = 'ELECTRONICS'<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+----------------------+<br />
| name                 |<br />
+----------------------+<br />
| ELECTRONICS          |<br />
| TELEVISIONS          |<br />
| TUBE                 |<br />
| LCD                  |<br />
| PLASMA               |<br />
| PORTABLE ELECTRONICS |<br />
| MP3 PLAYERS          |<br />
| FLASH                |<br />
| CD PLAYERS           |<br />
| 2 WAY RADIOS         |<br />
+----------------------+

<p>不像先前邻接表模型的例子，这个查询语句不管树的层次有多深都能很好的工作。在BETWEEN的子句中我们没有去关心node的rgt值，是因为使用node的rgt值得出的父节点总是和使用lft值得出的是相同的。
<h2><strong>检索所有叶子节点</strong></h2>
<p>检索出所有的叶子节点，使用嵌套集合模型的方法比邻接表模型的LEFT JOIN方法简单多了。如果你仔细得看了nested_category表，你可能已经注意到叶子节点的左右值是连续的。要检索出叶子节点，我们只要查找满足rgt=lft+1的节点：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT name<br />
FROM nested_category<br />
WHERE rgt = lft + 1;</font></blockquote></p>

<p>+--------------+<br />
| name         |<br />
+--------------+<br />
| TUBE         |<br />
| LCD          |<br />
| PLASMA       |<br />
| FLASH        |<br />
| CD PLAYERS   |<br />
| 2 WAY RADIOS |<br />
+--------------+

<h2><strong>检索单一路径</strong></h2>
<p>在嵌套集合模型中，我们可以不用多个自连接就可以检索出单一路径：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT parent.name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
AND node.name = 'FLASH'<br />
ORDER BY parent.lft;</font></blockquote></p>

<p>+----------------------+<br />
| name                 |<br />
+----------------------+<br />
| ELECTRONICS          |<br />
| PORTABLE ELECTRONICS |<br />
| MP3 PLAYERS          |<br />
| FLASH                |<br />
+----------------------+

<h2><strong>检索节点的深度</strong></h2>
<p>我们已经知道怎样去呈现一棵整树，但是为了更好的标识出节点在树中所处层次，我们怎样才能检索出节点在树中的深度呢？我们可以在先前的查询语句上增加COUNT函数和GROUP BY子句来实现：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT node.name, (COUNT(parent.name) - 1) AS depth<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+----------------------+-------+<br />
| name                 | depth |<br />
+----------------------+-------+<br />
| ELECTRONICS          |     0 |<br />
| TELEVISIONS          |     1 |<br />
| TUBE                 |     2 |<br />
| LCD                  |     2 |<br />
| PLASMA               |     2 |<br />
| PORTABLE ELECTRONICS |     1 |<br />
| MP3 PLAYERS          |     2 |<br />
| FLASH                |     3 |<br />
| CD PLAYERS           |     2 |<br />
| 2 WAY RADIOS         |     2 |<br />
+----------------------+-------+

<p>我们可以根据depth值来缩进分类名字，使用CONCAT和REPEAT字符串函数:</p>
<blockquote><pre /><font color="#800000" size="2">SELECT CONCAT( REPEAT(' ', COUNT(parent.name) - 1), node.name) AS name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+-----------------------+<br />
| name                  |<br />
+-----------------------+<br />
| ELECTRONICS           |<br />
|  TELEVISIONS          |<br />
|   TUBE                |<br />
|   LCD                 |<br />
|   PLASMA              |<br />
|  PORTABLE ELECTRONICS |<br />
|   MP3 PLAYERS         |<br />
|    FLASH              |<br />
|   CD PLAYERS          |<br />
|   2 WAY RADIOS        |<br />
+-----------------------+
<p>当然，在客户端应用程序中你可能会用depth值来直接展示数据的层次。Web开发者会遍历该树，随着depth值的增加和减少来添加&lt;li&gt;&lt;/li&gt;和&lt;ul&gt;&lt;/ul&gt;标签。
<h2><strong>检索子树的深度</strong></h2>
<p>当我们需要子树的深度信息时，我们不能限制自连接中的node或parent，因为这么做会打乱数据集的顺序。因此，我们添加了第三个自连接作为子查询，来得出子树新起点的深度值：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT node.name, (COUNT(parent.name) - (sub_tree.depth + 1)) AS depth<br />
FROM nested_category AS node,<br />
	nested_category AS parent,<br />
	nested_category AS sub_parent,<br />
	(<br />
		SELECT node.name, (COUNT(parent.name) - 1) AS depth<br />
		FROM nested_category AS node,<br />
		nested_category AS parent<br />
		WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
		AND node.name = 'PORTABLE ELECTRONICS'<br />
		GROUP BY node.name<br />
		ORDER BY node.lft<br />
	)AS sub_tree<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
	AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt<br />
	AND sub_parent.name = sub_tree.name<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+----------------------+-------+<br />
| name                 | depth |<br />
+----------------------+-------+<br />
| PORTABLE ELECTRONICS |     0 |<br />
| MP3 PLAYERS          |     1 |<br />
| FLASH                |     2 |<br />
| CD PLAYERS           |     1 |<br />
| 2 WAY RADIOS         |     1 |<br />
+----------------------+-------+

<p>这个查询语句可以检索出任一节点子树的深度值，包括根节点。这里的深度值跟你指定的节点有关。
<h2><strong>检索节点的直接子节点</strong></h2>
<p>可以想象一下，你在零售网站上呈现电子产品的分类。当用户点击分类后，你将要呈现该分类下的产品，同时也需列出该分类下的直接子分类，而不是该分类下的全部分类。为此，我们只呈现该节点及其直接子节点，不再呈现更深层次的节点。例如，当呈现PORTABLEELECTRONICS分类时，我们同时只呈现MP3 PLAYERS、CD PLAYERS和2 WAY RADIOS分类，而不呈现FLASH分类。
<p>要实现它非常的简单，在先前的查询语句上添加HAVING子句：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT node.name, (COUNT(parent.name) - (sub_tree.depth + 1)) AS depth<br />
FROM nested_category AS node,<br />
	nested_category AS parent,<br />
	nested_category AS sub_parent,<br />
	(<br />
		SELECT node.name, (COUNT(parent.name) - 1) AS depth<br />
		FROM nested_category AS node,<br />
		nested_category AS parent<br />
		WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
		AND node.name = 'PORTABLE ELECTRONICS'<br />
		GROUP BY node.name<br />
		ORDER BY node.lft<br />
	)AS sub_tree<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
	AND node.lft BETWEEN sub_parent.lft AND sub_parent.rgt<br />
	AND sub_parent.name = sub_tree.name<br />
GROUP BY node.name<br />
HAVING depth &lt;= 1<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+----------------------+-------+<br />
| name                 | depth |<br />
+----------------------+-------+<br />
| PORTABLE ELECTRONICS |     0 |<br />
| MP3 PLAYERS          |     1 |<br />
| CD PLAYERS           |     1 |<br />
| 2 WAY RADIOS         |     1 |<br />
+----------------------+-------+

<p>如果你不希望呈现父节点，你可以更改<strong>HAVING depth &lt;= 1</strong>为<strong>HAVING depth = 1</strong>。</p>
<h2><strong>嵌套集合模型中集合函数的应用</strong></h2>
<p>让我们添加一个产品表，我们可以使用它来示例集合函数的应用：</p>
<blockquote><pre /><font color="#800000" size="2">CREATE TABLE product(<br />
product_id INT AUTO_INCREMENT PRIMARY KEY,<br />
name VARCHAR(40),<br />
category_id INT NOT NULL<br />
);</font></blockquote></p>

<p>INSERT INTO product(name, category_id) VALUES('20" TV',3),('36" TV',3),<br />
('Super-LCD 42"',4),('Ultra-Plasma 62"',5),('Value Plasma 38"',5),<br />
('Power-MP3 5gb',7),('Super-Player 1gb',8),('Porta CD',9),('CD To go!',9),<br />
('Family Talk 360',10);</p>

<p>SELECT * FROM product;</p>

<p>+------------+-------------------+-------------+<br />
| product_id | name              | category_id |<br />
+------------+-------------------+-------------+<br />
|          1 | 20" TV            |           3 |<br />
|          2 | 36" TV            |           3 |<br />
|          3 | Super-LCD 42"     |           4 |<br />
|          4 | Ultra-Plasma 62"  |           5 |<br />
|          5 | Value Plasma 38"  |           5 |<br />
|          6 | Power-MP3 128mb   |           7 |<br />
|          7 | Super-Shuffle 1gb |           8 |<br />
|          8 | Porta CD          |           9 |<br />
|          9 | CD To go!         |           9 |<br />
|         10 | Family Talk 360   |          10 |<br />
+------------+-------------------+-------------+

<p>现在，让我们写一个查询语句，在检索分类树的同时，计算出各分类下的产品数量：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT parent.name, COUNT(product.name)<br />
FROM nested_category AS node ,<br />
nested_category AS parent,<br />
product<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
AND node.category_id = product.category_id<br />
GROUP BY parent.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+----------------------+---------------------+<br />
| name                 | COUNT(product.name) |<br />
+----------------------+---------------------+<br />
| ELECTRONICS          |                  10 |<br />
| TELEVISIONS          |                   5 |<br />
| TUBE                 |                   2 |<br />
| LCD                  |                   1 |<br />
| PLASMA               |                   2 |<br />
| PORTABLE ELECTRONICS |                   5 |<br />
| MP3 PLAYERS          |                   2 |<br />
| FLASH                |                   1 |<br />
| CD PLAYERS           |                   2 |<br />
| 2 WAY RADIOS         |                   1 |<br />
+----------------------+---------------------+

<p>这条查询语句在检索整树的查询语句上增加了COUNT和GROUP BY子句，同时在WHERE子句中引用了product表和一个自连接。
<h2><strong>新增节点</strong></h2>
<p>到现在，我们已经知道了如何去查询我们的树，是时候去关注一下如何增加一个新节点来更新我们的树了。让我们再一次观察一下我们的嵌套集合图：
<p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_18.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/ManagingHierarchicalDatainMySQL_D6FF/image_thumb_8.png" width="656" height="207" /></a>
<p>当我们想要在TELEVISIONS和PORTABLE ELECTRONICS节点之间新增一个节点，新节点的lft和rgt 的 值为10和11，所有该节点的右边节点的lft和rgt值都将加2，之后我们再添加新节点并赋相应的lft和rgt值。在MySQL 5中可以使用存储过程来完成，我假设当前大部分读者使用的是MySQL 4.1版本，因为这是最新的稳定版本。所以，我使用了锁表（LOCK TABLES）语句来隔离查询：</p>
<blockquote><pre /><font color="#800000" size="2">LOCK TABLE nested_category WRITE;</font></blockquote></p>

<p>SELECT @myRight := rgt FROM nested_category<br />
WHERE name = 'TELEVISIONS';</p>

<p>UPDATE nested_category SET rgt = rgt + 2 WHERE rgt &gt; @myRight;<br />
UPDATE nested_category SET lft = lft + 2 WHERE lft &gt; @myRight;</p>

<p>INSERT INTO nested_category(name, lft, rgt) VALUES('GAME CONSOLES', @myRight + 1, @myRight + 2);</p>

<p>UNLOCK TABLES;</p>

<p>我们可以检验一下新节点插入的正确性：</p>

<p>SELECT CONCAT( REPEAT( ' ', (COUNT(parent.name) - 1) ), node.name) AS name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</p>

<p>+-----------------------+<br />
| name                  |<br />
+-----------------------+<br />
| ELECTRONICS           |<br />
|  TELEVISIONS          |<br />
|   TUBE                |<br />
|   LCD                 |<br />
|   PLASMA              |<br />
|  GAME CONSOLES        |<br />
|  PORTABLE ELECTRONICS |<br />
|   MP3 PLAYERS         |<br />
|    FLASH              |<br />
|   CD PLAYERS          |<br />
|   2 WAY RADIOS        |<br />
+-----------------------+

<p>如果我们想要在叶子节点下增加节点，我们得稍微修改一下查询语句。让我们在2 WAYRADIOS叶子节点下添加FRS节点吧：</p>
<blockquote><pre /><font color="#800000" size="2">LOCK TABLE nested_category WRITE;</font></blockquote></p>

<p>SELECT @myLeft := lft FROM nested_category</p>

<p>WHERE name = '2 WAY RADIOS';</p>

<p>UPDATE nested_category SET rgt = rgt + 2 WHERE rgt &gt; @myLeft;<br />
UPDATE nested_category SET lft = lft + 2 WHERE lft &gt; @myLeft;</p>

<p>INSERT INTO nested_category(name, lft, rgt) VALUES('FRS', @myLeft + 1, @myLeft + 2);</p>

<p>UNLOCK TABLES;

<p>在这个例子中，我们扩大了新产生的父节点(2 WAY RADIOS节点）的右值及其所有它的右边节点的左右值，之后置新增节点于新父节点之下。正如你所看到的，我们新增的节点已经完全融入了嵌套集合中：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT CONCAT( REPEAT( ' ', (COUNT(parent.name) - 1) ), node.name) AS name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+-----------------------+<br />
| name                  |<br />
+-----------------------+<br />
| ELECTRONICS           |<br />
|  TELEVISIONS          |<br />
|   TUBE                |<br />
|   LCD                 |<br />
|   PLASMA              |<br />
|  GAME CONSOLES        |<br />
|  PORTABLE ELECTRONICS |<br />
|   MP3 PLAYERS         |<br />
|    FLASH              |<br />
|   CD PLAYERS          |<br />
|   2 WAY RADIOS        |<br />
|    FRS                |<br />
+-----------------------+

<h2><strong>删除节点</strong></h2>
<p>最后还有个基础任务，删除节点。删除节点的处理过程跟节点在分层数据中所处的位置有关，删除一个叶子节点比删除一个子节点要简单得多，因为删除子节点的时候，我们需要去处理孤立节点。
<p>删除一个叶子节点的过程正好是新增一个叶子节点的逆过程，我们在删除节点的同时该节点右边所有节点的左右值和该父节点的右值都会减去该节点的宽度值：</p>
<blockquote><pre /><font color="#800000" size="2">LOCK TABLE nested_category WRITE;</font></blockquote></p>

<p>SELECT @myLeft := lft, @myRight := rgt, @myWidth := rgt - lft + 1<br />
FROM nested_category<br />
WHERE name = 'GAME CONSOLES';</p>

<p>DELETE FROM nested_category WHERE lft BETWEEN @myLeft AND @myRight;</p>

<p>UPDATE nested_category SET rgt = rgt - @myWidth WHERE rgt &gt; @myRight;<br />
UPDATE nested_category SET lft = lft - @myWidth WHERE lft &gt; @myRight;</p>

<p>UNLOCK TABLES;

<p>我们再一次检验一下节点已经成功删除,而且没有打乱数据的层次：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT CONCAT( REPEAT( ' ', (COUNT(parent.name) - 1) ), node.name) AS name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+-----------------------+<br />
| name                  |<br />
+-----------------------+<br />
| ELECTRONICS           |<br />
|  TELEVISIONS          |<br />
|   TUBE                |<br />
|   LCD                 |<br />
|   PLASMA              |<br />
|  PORTABLE ELECTRONICS |<br />
|   MP3 PLAYERS         |<br />
|    FLASH              |<br />
|   CD PLAYERS          |<br />
|   2 WAY RADIOS        |<br />
|    FRS                |<br />
+-----------------------+

<p>这个方法可以完美地删除节点及其子节点：</p>
<blockquote><pre /><font color="#800000" size="2">LOCK TABLE nested_category WRITE;</font></blockquote></p>

<p>SELECT @myLeft := lft, @myRight := rgt, @myWidth := rgt - lft + 1<br />
FROM nested_category<br />
WHERE name = 'MP3 PLAYERS';</p>

<p>DELETE FROM nested_category WHERE lft BETWEEN @myLeft AND @myRight;</p>

<p>UPDATE nested_category SET rgt = rgt - @myWidth WHERE rgt &gt; @myRight;<br />
UPDATE nested_category SET lft = lft - @myWidth WHERE lft &gt; @myRight;</p>

<p>UNLOCK TABLES;

<p>再次验证我们已经成功的删除了一棵子树：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT CONCAT( REPEAT( ' ', (COUNT(parent.name) - 1) ), node.name) AS name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+-----------------------+<br />
| name                  |<br />
+-----------------------+<br />
| ELECTRONICS           |<br />
|  TELEVISIONS          |<br />
|   TUBE                |<br />
|   LCD                 |<br />
|   PLASMA              |<br />
|  PORTABLE ELECTRONICS |<br />
|   CD PLAYERS          |<br />
|   2 WAY RADIOS        |<br />
|    FRS                |<br />
+-----------------------+

<p>有时，我们只删除该节点，而不删除该节点的子节点。在一些情况下，你希望改变其名字为占位符，直到替代名字的出现，比如你开除了一个主管（需要更换主管）。在另外一些情况下，你希望子节点挂到该删除节点的父节点下：</p>
<blockquote><pre /><font color="#800000" size="2">LOCK TABLE nested_category WRITE;</font></blockquote></p>

<p>SELECT @myLeft := lft, @myRight := rgt, @myWidth := rgt - lft + 1<br />
FROM nested_category<br />
WHERE name = 'PORTABLE ELECTRONICS';</p>

<p>DELETE FROM nested_category WHERE lft = @myLeft;</p>

<p>UPDATE nested_category SET rgt = rgt - 1, lft = lft - 1 WHERE lft BETWEEN @myLeft AND @myRight;<br />
UPDATE nested_category SET rgt = rgt - 2 WHERE rgt &gt; @myRight;<br />
UPDATE nested_category SET lft = lft - 2 WHERE lft &gt; @myRight;</p>

<p>UNLOCK TABLES;

<p>在这个例子中，我们对该节点所有右边节点的左右值都减去了2（因为不考虑其子节点，该节点的宽度为2），对该节点的子节点的左右值都减去了1（弥补由于失去父节点的左值造成的裂缝）。我们再一次确认，那些节点是否都晋升了：</p>
<blockquote><pre /><font color="#800000" size="2">SELECT CONCAT( REPEAT( ' ', (COUNT(parent.name) - 1) ), node.name) AS name<br />
FROM nested_category AS node,<br />
nested_category AS parent<br />
WHERE node.lft BETWEEN parent.lft AND parent.rgt<br />
GROUP BY node.name<br />
ORDER BY node.lft;</font></blockquote></p>

<p>+---------------+<br />
| name          |<br />
+---------------+<br />
| ELECTRONICS   |<br />
|  TELEVISIONS  |<br />
|   TUBE        |<br />
|   LCD         |<br />
|   PLASMA      |<br />
|  CD PLAYERS   |<br />
|  2 WAY RADIOS |<br />
|   FRS         |<br />
+---------------+

<p>有时，当删除节点的时候，把该节点的一个子节点挂载到该节点的父节点下，而其他节点挂到该节点父节点的兄弟节点下，考虑到篇幅这种情况不在这里解说了。
<h2><strong>最后的思考</strong></h2>
<p>我希望这篇文章对你有所帮助，SQL中的嵌套集合的观念大约有十年的历史了，在网上和一些书中都能找到许多相关信息。在我看来，讲述分层数据的管理最全面的，是来自一本名叫《<a href="http://www.openwin.org/mike/books/index.php/trees-and-hierarchies-in-sql" target="_blank">Joe Celko's Trees and Hierarchies in SQL for Smarties</a>》的书，此书的作者是在高级SQL领域倍受尊敬的Joe Celko。Joe Celko被认为是嵌套集合模型的创造者，更是该领域内的多产作家。我把Celko的书当作无价之宝，并极力地推荐它。在这本书中涵盖了在此文中没有提及的一些高级话题，也提到了其他一些关于邻接表和嵌套集合模型下管理分层数据的方法。</p>
<p>在随后的参考书目章节中，我列出了一些网络资源，也许对你研究分层数据的管理会有所帮助，其中包括一些PHP相关的资源（处理嵌套集合的PHP库）。如果你还在使用邻接表模型，你该去试试嵌套集合模型了，在<a href="http://www.sitepoint.com/article/hierarchical-data-database" target="_blank">Storing Hierarchical Data in a Database</a> 文中下方列出的一些资源链接中能找到一些样例代码，可以去试验一下。</p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p></p>
