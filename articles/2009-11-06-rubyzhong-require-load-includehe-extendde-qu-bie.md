---
layout: post
title: Ruby中Require、Load、Include和Extend的区别
date: 2009-11-06 12:48
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>原文：<a title="http://ionrails.com/2009/09/19/ruby_require-vs-load-vs-include-vs-extend/" href="http://ionrails.com/2009/09/19/ruby_require-vs-load-vs-include-vs-extend/">http://ionrails.com/2009/09/19/ruby_require-vs-load-vs-include-vs-extend/</a></p>  <p><strong>Require：</strong></p>  <p>require方法让你加载一个库，并且只加载一次，如果你多次加载会返回false。只有当你要加载的库位于一个分离的文件中时才有必要使用require。使用时不需要加扩展名，一般放在文件的最前面：</p>  <p>&#160;&#160;&#160; require ‘test_library’</p>  <p><strong>Load：</strong></p>  <p>load用来多次加载一个库，你必须指定扩展名：</p>  <p>&#160;&#160; load ‘test_library.rb’</p>  <p><strong>Include:</strong></p>  <p>当你的库加载之后，你可以在你的类定义中包含一个module，让module的实例方法和变量成为类本身的实例方法和类变量，它们mix进来了。根据锄头书，include并不会把module的实例方法拷贝到类中，只是做了引用，包含module的不同类都指向了同一个对象。如果你改变了module的定义，即使你的程序还在运行，所有包含module的类都会改变行为。</p>  <p>&#160;&#160; module Log   <br />&#160;&#160;&#160;&#160;&#160;&#160; def class_type    <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; “This class is of type: #{self.class}”    <br />&#160;&#160;&#160;&#160;&#160;&#160; end    <br />&#160;&#160; end    <br />&#160;&#160; class TestClass    <br />&#160;&#160;&#160;&#160;&#160;&#160; include Log    <br />&#160;&#160; end    <br />&#160;&#160; tc=TestClass.new.class_type&#160;&#160;&#160; #=&gt;This class is of type: TestClass</p>  <p><strong>Extend:</strong></p>  <p>extend会把module的实例方法作为类方法加入类中：</p>  <p>&#160;&#160; module Log   <br />&#160;&#160;&#160;&#160;&#160;&#160; def class_type    <br />&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160; “This class is of type: #{self.class}”    <br />&#160;&#160;&#160;&#160;&#160;&#160; end    <br />&#160;&#160; end    <br />&#160;&#160; class TestClass    <br />&#160;&#160;&#160;&#160;&#160;&#160; extend Log    <br />&#160;&#160; end    <br />&#160;&#160; tc=TestClass.class_type&#160;&#160;&#160;&#160;&#160;&#160; #=&gt;This class is of type: TestClass    </p></p>
