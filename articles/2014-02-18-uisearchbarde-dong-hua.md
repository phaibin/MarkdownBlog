---
title: UISearchBar的动画
date: 2014-02-18 11:35
---
UISearchBar在设置改变frame的动画的时候，会有很奇怪的行为，内部的输入框不会跟着外部的frame一起变化。具体什么形式可以自己体验一下，我相信只要写过这种动画的人都能明白。

试验了几种写法都不是很完美，逼的我必须研究一下问题的本质了（我经常都是这样，实在没办法才想要去深入研究~）。

原来解决方法非常简单，很容易就搜索到了。请参考：
<http://stackoverflow.com/questions/9571995/animating-the-width-of-uisearchbar-frame>
<http://stackoverflow.com/questions/9636367/cant-animate-the-frame-or-bounds-of-a-uisearchbar>

本质原因也许是UISearchBar的一个bug，它的inner views在resize的时候会忽略动画。解决办法就是在动画里面加个：[searchBar layoutSubviews]。

    [UIView animateWithDuration:.3
                     animations:^ {
                         CGRect newBounds = locationSearch.frame;
                         newBounds.size.width += 215; //newBounds.size.width -= 215; to contract
                         locationSearch.frame = newBounds;
                         [locationSearch layoutSubviews];
                     }];

另外有人提到layoutSubviews不应该直接调用，更优雅的做法是用下面两句替代：

    [searchBar setNeedsLayout];
    [searchBar layoutIfNeeded];

下面还有一个更绝的回答，在animation的options里面加入一个UIViewAnimationOptionLayoutSubviews的选项就可以了：

    [UIView animateWithDuration:0.5
                                  delay:0
                                options:UIViewAnimationOptionLayoutSubviews
                             animations:^{
                                 //Set the frame you want to the search bar
                             }
                             completion:^(BOOL finished) {

                             }];