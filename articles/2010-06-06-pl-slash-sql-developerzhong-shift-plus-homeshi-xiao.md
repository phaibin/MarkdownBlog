---
layout: post
title: PL/SQL Developer中shift+home失效
date: 2010-06-06 15:04
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>最近开始用PL/SQL Developer，但是shift+home不能选择当前行，觉得这个软件做的真是差劲。然后又装了一个Toad，居然还是不行，这让我想到应该不是软件本身的问题。突然想起来很有可能是SQL Assistant造成的，因为SQL Assistant在两个软件中都是开启的。关掉SQL Assistant之后果然可以了，真是见鬼。但是SQL Assistant还是很有用的，不能关掉。于是把SQL Assistant中的选项试了半天，终于让我发现是这个选项造成的：</p>  <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/PLSQLDevelopershifthome_D3FC/image_4.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/PLSQLDevelopershifthome_D3FC/image_thumb_1.png" width="272" height="24" /></a> </p>  <p>只要把这个选项关闭就没事了。唉，又浪费我好几个小时。</p></p>
