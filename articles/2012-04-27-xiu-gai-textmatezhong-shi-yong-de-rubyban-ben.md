---
layout: post
title: 修改Textmate中使用的ruby版本
date: 2012-04-27 16:04
categories:
- RoR
tags:
- textmate
published: true
comments: true
---
在用homebrew安装了最新的ruby 1.9.3之后，Textmate中编写ruby脚本依然使用的是系统自带的1.8.7。修改的办法是在Textmate的环境变量里面加入一个键“TM_RUBY”，值为新安装的ruby的路径。比如我的路径为“/usr/local/bin/ruby”。

这样修改之后虽然Textmate调用的是最新版的ruby，但是Textmate的出错信息却乱了，显示为：
![textmate_ruby](http://phaibin.tk/wp-content/uploads/2012/04/textmate_ruby.png)

google了很多才找到解决办法：
<http://www.rubyflow.com/items/6795-solution-to-ruby-1-9-3-segfaulting-when-using-textmate-ruby-b>

方法就是：
    mate /Applications/TextMate.app/Contents/SharedSupport/Bundles/Ruby.tmbundle/Support/RubyMate/catch_exception.rb
编辑这个文件，注释`require "cgi"`，然后删除所有escapeHTML调用。
