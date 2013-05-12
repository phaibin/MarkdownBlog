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
<p><p>Cancel:</p>
<p> </p>
<p>- (void)searchDisplayControllerWillBeginSearch:(UISearchDisplayController *)controller {</p>
<p>UISearchBar *searchBar = self.searchDisplayController.searchBar;</p>
<p>[searchBar setShowsCancelButton:YES animated:YES];</p>
<p>for(UIView *subView in searchBar.subviews){</p>
<p>if([subView isKindOfClass:UIButton.class]){</p>
<p>[(UIButton*)subView setTitle:@"取消" forState:UIControlStateNormal];</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>No Results:</p>
<p>
<p>- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString</p>
<p>{</p>
<p>[self filterContentForSearchText:searchString];</p>
<p>if ([filteredListPinYin count] == 0) {</p>
<p>UITableView *tableView1 = self.searchDisplayController.searchResultsTableView;</p>
<p>for( UIView *subview in tableView1.subviews ) {</p>
<p>if( [subview class] == [UILabel class] ) {</p>
<p>UILabel *lbl = (UILabel*)subview; // sv changed to subview.</p>
<p>lbl.text = @"没有结果";</p>
<p>}</p>
<p>}</p>
<p>}</p>
<p>// Return YES to cause the search result table view to be reloaded.</p>
<p>return YES;</p>
<p>}</p>
</p>
<p> </p></p>
