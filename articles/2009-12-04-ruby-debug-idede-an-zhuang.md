---
layout: post
title: ruby-debug-ide的安装
date: 2009-12-04 14:59
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>在RubyMine里调试提示需要安装ruby-debug-ide，但是安装的过程有问题，提示：</p>  <blockquote>   <p>ERROR: Failed to build gem native extension.</p> </blockquote>  <p>于是想解开gem包，把里面的extension去掉。但是编辑完之后再用winrar打包gem就认不出来了。看来压缩的格式也很重要。于是找来了tar和gzip两个工具，tar还好，用gzip解压和压缩过的文件还是认不出来。只有另想别的办法了。突然想到把文件解压之后，应该可以用gem的工具来生成一个gem安装文件吧。于是找了一篇制作gem的教程，把extension去掉之后制作了一个gem，居然可以顺序安装了。然后重新打开RubyMine也可以调试了。</p></p>
