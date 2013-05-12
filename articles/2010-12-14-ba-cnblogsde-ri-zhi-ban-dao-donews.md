---
layout: post
title: 把cnblogs的日志搬到donews
date: 2010-12-14 17:36
categories:
- 生活
tags: []
published: true
comments: true
---
<p>在cnblogs的管理界面右上角有一个“备份”的链接：</p>

<p><a href="http://phaibin.files.wordpress.com/2010/12/jpg"><img class="alignnone size-full wp-image-988585" title="未命名" src="http://phaibin.files.wordpress.com/2010/12/jpg" alt="" width="413" height="81" /></a></p>

<p>选择时间之后点备份，会导出一个rss格式的xml文件。然后在donews的管理界面，在左边的目录选择“导入”：</p>

<p><a href="http://phaibin.files.wordpress.com/2010/12/rss3.png"><img class="alignnone size-full wp-image-988586" title="rss" src="http://phaibin.files.wordpress.com/2010/12/rss3.png" alt="" width="262" height="445" /></a></p>

<p>利用Wordpress的RSS导入功能可以把cnblogs的备份文件导入进来。</p>

<p>不过因为cnblogs的RSS格式跟Wordpress的格式有一些区别，这样导入的日志显示会有些问题。需要对备份文件作一些修改：
<ul>
	<li>
<pre>在开头的xml声明部分加入：xmlns:content="<a href="http://purl.org/rss/1.0/modules/content/">http://purl.org/rss/1.0/modules/content/</a>"</pre>
</li>
</ul>
<ul>
	<li>
<pre>替换所有的 &lt;description&gt;&lt;![CDATA[ 为  &lt;content:encoded&gt;&lt;![CDATA[</pre>
</li>
	<li>
<pre>替换所有的 ]]&gt;&lt;/description&gt; 为 ]]&gt;&lt;/content:encoded&gt;</pre>
</li>
</ul></p>
