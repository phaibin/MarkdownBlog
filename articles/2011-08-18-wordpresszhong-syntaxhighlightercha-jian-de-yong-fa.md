---
layout: post
title: Wordpress中SyntaxHighlighter插件的用法
date: 2011-08-18 14:27
categories:
- 生活
tags:
- Wordpress
published: true
comments: true
---
Wordpress中原来自带了语法高亮的插件，这样就省得借助编辑器来完成这一步了。官方文档在：

<http://en.support.wordpress.com/code/posting-source-code/>

用法为：

    [sourcecode language="css"]
    your code here
    [/sourcecode]

或者这么写：

    [code lang="css"]
    your code here
    [/code]

支持的语言有：

- actionscript3
- bash
- coldfusion
- cpp
- csharp
- css
- delphi
- erlang
- fsharp
- diff
- groovy
- html
- javascript
- java
- javafx
- matlab (keywords only)
- objc
- perl
- php
- text
- powershell
- python
- r
- ruby
- scala
- sql
- vb
- xml

其他有用的参数：toolbar="false"（不显示工具栏）