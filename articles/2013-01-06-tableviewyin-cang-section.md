---
layout: post
title: tableview隐藏section
date: 2013-01-06 17:46
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
先设置
    tableView.sectionHeaderHeight = 0;
    tableView.sectionFooterHeight = 0;
再根据需要实现：
    - (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
