---
layout: post
title: SyntaxHighlighter Evolved恶心的问题
date: 2011-10-24 06:37
categories:
- Wordpress
tags:
- SyntaxHighlighter
- Wordpress
published: true
comments: true
---
迁移完blog之后安装了SyntaxHighlighter Evolved插件，但是发现有一篇文章显示有问题。原始的文章只有一句话：

![SyntaxHighlighter Bug](/images/articles/syntaxHighlighter_bug_1.png)

每次一编辑完更新之后就变成这样了：

![SyntaxHighlighter Bug](/images/articles/syntaxHighlighter_bug_2.png)


感觉应该是SyntaxHighlighter Evolved插件造成的。可是换其他的插件代价实在太大，而且显示效果也不好。想想真是很恶心，本来只是语法高亮的插件，怎么能连我的原始文字都改了呢。

然后又在wordpress stack发了帖子询问。发完我突然想到会不会是[text][/text]刚好是SyntaxHighlighter的关键字呢？与是我把text改成text1，居然就好了。看来真是这个问题了。但是wordpress.com官方没有问题，不知道是用了别的插件还是做了修改。