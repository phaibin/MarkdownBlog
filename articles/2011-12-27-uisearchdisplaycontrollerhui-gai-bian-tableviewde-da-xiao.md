---
layout: post
title: UISearchDisplayController会改变TableView的大小
date: 2011-12-27 22:33
categories:
- iphone
tags: []
published: true
comments: true
---
本来是做一个这样的界面：

![UISearchDisplayController](http://phaibin.tk/wp-content/uploads/2011/12/UISearchDisplayController.jpg)

TableView没有占据全部View的大小。但是搜索之后发现界面变成了这样：

![UISearchDisplayController_1](http://phaibin.tk/wp-content/uploads/2011/12/UISearchDisplayController_1.jpg)

TableView自动扩充至了整个view 的大小。我纳闷死了，为什么要改变TableView的大小呢？

经过调试才发现，原来是我错了，copy了这么多次代码，其实我压根就没有花时间搞明白UISearchDisplayController的原理。在下面这个方法上加断点：

    - (void)searchDisplayController:(UISearchDisplayController *)controller didShowSearchResultsTableView:(UITableView *)tableView

你会发现，tableView的类型其实是UISearchResultsTableView。我之前一直以为是把tableView的数据清空，用搜索的结果代替，其实是用了另外一个tableView来显示搜索结果，这个tableView显示在之前的tableView的上面，并且默认是全屏的。所以此文的标题应该是带引号的。不过这种问题估计碰到的机会不大，而且也不是一句两句可以说清楚的。

解决的方法也很简单，就是在上面那个方法里面，把参数里面的tableView的frame设为跟自己的一样就好了。
