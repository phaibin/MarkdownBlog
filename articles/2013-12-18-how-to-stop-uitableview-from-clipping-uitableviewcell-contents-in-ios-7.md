---
title: How to stop UITableView from clipping UITableViewCell contents in iOS 7
date: 2013-12-18 17:12
---
参考：<http://stackoverflow.com/questions/18877895/how-to-stop-uitableview-from-clipping-uitableviewcell-contents-in-ios-7>

    [cell.contentView.superview setClipsToBounds:NO];