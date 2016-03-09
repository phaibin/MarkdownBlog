---
layout: post
title: Drupal配置笔记（一）
date: 2006-05-01 10:21
categories:
- 网页
tags: []
published: true
comments: true
---
<p><p>1.主题主要分为XTemplate和PHPTemplate的，4.7之后默认都是PHPTemplate的了，而且还分drupal的版本，不一定可以通用。<br />2.常用的一些模块：image（用来建立一个简单的相册）；tinymce（WYSIWYG 编辑器），这些都需要下载CVS版，不然在4.7中会出错。<br />3.激活tinymce后要在&ldquo;输入格式&rdquo;中选中&ldquo;Full HTML&rdquo;。这样html标记才能起作用。<br />4.主链接的编辑（4.7版）：确认menu模块已经启用，进入 管理-&gt;菜单，点&ldquo;添加菜单&rdquo;，建立一个新的菜单，例如&ldquo;sitemenu&rdquo;，加入菜单项。在主菜单中点击 管理-&gt;设置-&gt;菜单，将&ldquo;Menu containing primary links&rdquo;设为你新建的菜单，例如上面的&ldquo;sitemenu&rdquo;。这样在主页最上面就出现了你自己编辑的导航条。<br />5.要启用干净URL，即在URL中不包括<code>?q=，需要在Apache中启用mod_rewrite，即把<br />&nbsp; LoadModule rewrite_module modules/mod_rewrite.so<br />去掉注释，还要把主目录的AllowOverride设为All，在Drupal下面的.htaccess文件已经设置好。</code></p></p>
