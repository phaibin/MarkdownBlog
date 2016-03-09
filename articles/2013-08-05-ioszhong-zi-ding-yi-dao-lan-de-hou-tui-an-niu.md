---
title: iOS中自定义导航栏的后退按钮
date: 2013-08-05 17:26
tags:
- ios
- navigation bar
---
参考：<http://stackoverflow.com/questions/10906980/customizing-the-backbarbuttonitem>

要自定义导航栏的按钮，比较常用的做法是用custom view生成一个bar button item。这样的custom view可以满足各种情况。

但是后退按钮比较特殊。因为后退按钮是通用的，每个页面都会显示。要实现并不难，难的是省事又优美的方法。

一种方法还是用custom view，然后设置[self.navigationItem setHidesBackButton:YES]。这种方法需要在每个显示back button的ViewController里面都要写。为了消除重复，可以建立一个基类BaseViewController，然后在BaseViewController里面默认加上这个back按钮。这样带来的问题是要在不需要显示back按钮的页面里面去掉这个按钮。当然比起需要显示的页面，不需要的页面要少得多。

自从iOS5之后加入了Appearance，可以通过一行代码控制控件的全局显示，非常方便。如果这里也能用Appearance就很方便了。

有一个方法可以设置后退按钮的背景图：

    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];

于是就变成了这样：

![Decimal Pad](/images/articles/nav_bar_1.png)

然后可以把标题移走：

    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, backButtonImage.size.height*2) forBarMetrics:UIBarMetricsDefault];

于是就变成这样了：

![Decimal Pad](/images/articles/nav_bar_2.png)

虽然文字被移走了，后退按钮的宽度还是没变，所以图片还是被拉伸了。而Appearance是没有方法可以调整后退按钮大小的。

关键就是这行代码：

    UIImage *backButtonImage = [[UIImage imageNamed:@"icon_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];

加了这行代码之后，后退按钮的图片就不会被拉伸了。于是就得到了完美的效果：

![Decimal Pad](/images/articles/nav_bar_3.png)

完整的代码就是：

    UIImage *backButtonImage = [[UIImage imageNamed:@"icon_back.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:backButtonImage  forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, backButtonImage.size.height*2) forBarMetrics:UIBarMetricsDefault];

只需要这三行代码，就可以控制后退按钮的样式。而它的行为还是由系统来控制，只在需要的时候才显示。