---
layout: post
title: 修改Firefox源代码字体（转）
date: 2009-05-19 14:42
categories:
- 网页
tags: []
published: true
comments: true
---
<p><p>打开 X:Program FilesFirefoxresviewsource.css ，找到 #viewsource {} 字段，修改 font-family 属性即可：
<blockquote>
<div align="left">
<pre>
</pre><div style="width:343px;height:202px;" class="cnblogs_code">&lt;!--<br /><br />Code highlighting produced by Actipro CodeHighlighter (freeware)<br />http://www.CodeHighlighter.com/<br /><br />--&gt;<span style="color:#008080;">1</span>&nbsp;<span style="color:#800000;">#viewsource<br />
</span><span style="color:#008080;">2</span>&nbsp;<span style="color:#000000;">{</span><span style="color:#ff0000;"><br />
</span><span style="color:#008080;">3</span>&nbsp;<span style="color:#ff0000;">&nbsp;&nbsp;&nbsp;&nbsp;font-family</span><span style="color:#000000;">:</span><span style="color:#0000ff;">&nbsp;Courier&nbsp;New</span><span style="color:#000000;">;</span><span style="color:#ff0000;"><br />
</span><span style="color:#008080;">4</span>&nbsp;<span style="color:#ff0000;">&nbsp;&nbsp;&nbsp;&nbsp;font-weight</span><span style="color:#000000;">:</span><span style="color:#0000ff;">&nbsp;normal</span><span style="color:#000000;">;</span><span style="color:#ff0000;"><br />
</span><span style="color:#008080;">5</span>&nbsp;<span style="color:#ff0000;">&nbsp;&nbsp;&nbsp;&nbsp;color</span><span style="color:#000000;">:</span><span style="color:#0000ff;">&nbsp;black</span><span style="color:#000000;">;</span><span style="color:#ff0000;"><br />
</span><span style="color:#008080;">6</span>&nbsp;<span style="color:#ff0000;">&nbsp;&nbsp;&nbsp;&nbsp;white-space</span><span style="color:#000000;">:</span><span style="color:#0000ff;">&nbsp;pre</span><span style="color:#000000;">;</span><span style="color:#ff0000;"><br />
</span><span style="color:#008080;">7</span>&nbsp;<span style="color:#ff0000;">&nbsp;&nbsp;&nbsp;&nbsp;font-size</span><span style="color:#000000;">:</span><span style="color:#0000ff;">&nbsp;12px</span><span style="color:#000000;">;</span><span style="color:#ff0000;"><br />
</span><span style="color:#008080;">8</span>&nbsp;<span style="color:#000000;">}</span></div>
ps:为什么不在菜单中做一个设置的接口呢？
</div>
</blockquote></p></p>
