---
title: Mac里的Smart Quotes功能
date: 2014-01-23 10:34
---
今天要在Numbers里面拼接sql语句，其中一列是：`','`，可是Numbers会自动把单引号替换为中文的单引号，也就是左右形状不一样的形态。我猜想应该是自动更正的问题。然后打开TextEdit试验，有一样的问题。Word也有同样的问题。

中间经过各种奇奇怪怪的试验之后，总算找到了关闭这个自动更正的办法。这个功能的名称叫：Smart Quotes。

1. 首先在系统预置里面有一个全局的设置：

    ![Smart Quotes 1](/images/articles/smart_quotes_1.png)

2. 在TextEdit的Preferences里面：

    ![Smart Quotes 2](/images/articles/smart_quotes_2.png)

3. 在Word的首选项->自动更正里面：

    ![Smart Quotes 3](/images/articles/smart_quotes_3.png)

4. 最奇葩的就是Numbers了，在Preferences里面居然什么都没有，还要通过菜单来设置：

    ![Smart Quotes 4](/images/articles/smart_quotes_4.png)

---

在这些设置修改过之后，一般都需要重新开新文档或者重启应用程序才能生效。

Smart Quotes设计的目的是让你看清左右的引号，防止忘记关闭引号。但是对于写代码的人来说明显就是很讨厌的功能了。如果你真的想要左右不同的引号，打开中文输入就好了。