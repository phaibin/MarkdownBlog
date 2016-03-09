---
layout: post
title: MasterPage的诡异
date: 2008-06-15 15:48
categories:
- .NET
tags: []
published: true
comments: true
---
<p>在读孟宪会的《ASP.NET 2.0应用开发技术》的时候，第6章母版页讲到：<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&#8220;母版页的设置具有比内容页更高的优先级，如果在母版页将EnableViewState设为false，而在内容页将EnableViewState设为true，实际上会禁用视图状态。&#8221;<br />
<br />
我觉得很奇怪，如果母版页的优先级更高，所有的内容页都只能继承，而不能改写母版页的设置了。我试验了一下，发现事情比这还要复杂。最后的结果是：<br />
1.如果母版页没有设置EnableViewState属性，或者设为true，那么内容页的设置不会受影响。即内容页的EnableViewState属性设为true则启用视图状态，设为false则禁用视图状态。<br />
2.如果母版页设置EnableViewState属性为false，不管内容页设置EnableViewState为什么值，都会禁用视图状态。最奇怪的是如果把内容页的EnableViewState设为true，虽然检测Page的EnableViewState属性为true，但是查看HTML源代码其实没有视图状态。<br />
<br />
想一想道理应该是这样的：内容页是作为母版页的一部分插入母版页的，如果母版页的EnableViewState为true，则它会完全接受内容页的内容；如果为false，虽然内容页启用了视图状态，但是在插入母版页之后，母版页就会禁用整个页面的视图状态，任何控件的视图状态都不会保存。<br />
<br />
所以，如果想在母版页禁用视图状态，而希望在个别内容页启用视图状态是做不到的。</p>
