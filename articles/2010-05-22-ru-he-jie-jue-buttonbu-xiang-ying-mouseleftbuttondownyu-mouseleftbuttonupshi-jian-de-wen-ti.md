---
layout: post
title: 如何解决Button不响应MouseLeftButtonDown与MouseLeftButtonUp事件的问题
date: 2010-05-22 20:26
categories:
- .NET
tags: []
published: true
comments: true
---
<p><p>引用<a title="http://www.cnblogs.com/wsdj-ittech/archive/2009/07/15/1524112.html" href="http://www.cnblogs.com/wsdj-ittech/archive/2009/07/15/1524112.html">http://www.cnblogs.com/wsdj-ittech/archive/2009/07/15/1524112.html</a></p>  <p>在Silverlight 2和3 中的按钮不能响应MouseLeftButtonDown 和 MouseLeftButtonUp 事件，为解决此问题，我们可通过创建自定义按钮控件加以解决：</p>  <p>1. 在解决方案中添加Silverlight类库</p>  <p>2. 新建类MyButton，继承自Button，添加如下的事件处理：</p>  <blockquote>   <p>protected override void OnMouseLeftButtonDown(MouseButtonEventArgs e)      <br />{&#160; <br />&#160;&#160;&#160; base.OnMouseLeftButtonDown(e);       <br />&#160;&#160;&#160; e.Handled = false;       <br />} </p> </blockquote>  <blockquote>   <p>protected override void OnMouseLeftButtonUp(MouseButtonEventArgs e)      <br />{&#160; <br />&#160;&#160;&#160; base.OnMouseLeftButtonUp(e);&#160; <br />&#160;&#160;&#160; e.Handled = false;       <br />}</p> </blockquote>  <p>3. 在主模板中加入自定义按钮的引用：</p>  <blockquote>   <p>xmlns:myButton=&quot;clr-namespace:MyButton;assembly=MyButton&quot;</p> </blockquote>  <p>4. 然后这么添加Button：</p>  <blockquote>   <p>&lt;myButton:MyButton&gt;&lt;/myButton:MyButton&gt;</p> </blockquote>  <p>这样Button就可以相应MouseLeftButtonDown 和 MouseLeftButtonUp 事件了。</p>  <p>ps：都3了还有这么弱智的bug，真不知道微软是怎么搞的，不知道4里面正不正常。</p></p>
