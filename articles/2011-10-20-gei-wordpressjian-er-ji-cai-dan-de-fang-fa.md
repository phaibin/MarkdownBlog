---
layout: post
title: 给Wordpress建二级菜单的方法
date: 2011-10-20 02:09
categories:
- Wordpress
tags:
- Wordpress
published: true
comments: true
---
貌似Wordpress只支持1级菜单，但是经过搜索是可以实现二级菜单的。方法是：

先用自定义链接建一个包含下拉菜单的菜单，如果这个菜单不指向任何页面，链接里面写个#：

![Wordpress Menu 1](/images/articles/wordpress_menu_1.png)

然后把作为子菜单的页面加进去：

![Wordpress Menu 2](/images/articles/wordpress_menu_2.png)

接下来就是关键所在，把两个子菜单的页面向里面拉一下：

![Wordpress Menu 3](/images/articles/wordpress_menu_3.png)

然后保存就好了。效果：

![Wordpress Menu 4](/images/articles/wordpress_menu_4.png)
