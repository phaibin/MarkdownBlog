---
layout: post
title: 自定义UISearchDisplayController的“No Results"标签和”Cancel“按钮
date: 2011-07-05 02:58
categories:
- iphone
tags: []
published: true
comments: true
---
Cancel:

    - (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {

    UISearchBar *searchBar = self.searchDisplayController.searchBar;

    [searchBar setShowsCancelButton:YES animated:YES];

    for(UIView *subView in searchBar.subviews){

    if([subView isKindOfClass:UIButton.class]){

    [(UIButton*)subView setTitle:@"取消" forState:UIControlStateNormal];

    }

    }

    }

No Results:

    - (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString

    {

    [self filterContentForSearchText:searchString];

    if ([filteredListPinYin count] == 0) {

    UITableView *tableView1 = self.searchDisplayController.searchResultsTableView;

    for( UIView *subview in tableView1.subviews ) {

    if( [subview class] == [UILabel class] ) {

    UILabel *lbl = (UILabel*)subview; // sv changed to subview.

    lbl.text = @"没有结果";

    }

    }

    }

    // Return YES to cause the search result table view to be reloaded.

    return YES;

    }