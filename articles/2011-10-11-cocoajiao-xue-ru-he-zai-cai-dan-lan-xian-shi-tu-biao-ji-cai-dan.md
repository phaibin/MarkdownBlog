---
layout: post
title: Cocoa教学：如何在菜单栏显示图标及菜单
date: 2011-10-11 07:50
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
<p>原文：<a href="http://www.cocoachina.com/b/?p=164">http://www.cocoachina.com/b/?p=164</a>
<p style="font-size:12px;line-height:17px;">如果你用过CoverSutra，那么你一定对它的菜单栏图标有印象。通过在菜单栏画一个心型小图标，你可以在菜单栏控制iTunes的音乐播放和欣赏音乐封面。</p>
<p style="font-size:12px;line-height:17px;"><a href="http://phaibin.tk/wp-content/uploads/2011/10/menubar-icon1.png"><img class="alignnone size-full wp-image-989521" title="menubar-icon1" src="http://phaibin.tk/wp-content/uploads/2011/10/menubar-icon1.png" alt="" width="113" height="70" /></a></p>
<p style="font-size:12px;line-height:17px;">要在自己的程序里加入菜单栏图标，其实也很简单。</p>
<p style="font-size:12px;line-height:17px;"></p>
<p style="font-size:12px;line-height:17px;">你要做的仅仅是在程序里添加一个NSStatusItem，比如这样：</p>
<p style="font-size:12px;line-height:17px;"><span style="line-height:normal;"><span style="color:#0000ff;">@interface</span> Controller : NSObject </span><span style="line-height:normal;">{
</span><span style="color:#0000ff;line-height:normal;">NSStatusItem<span style="color:#000000;">*</span><span style="color:#741828;">_statusItem</span><span style="color:#000000;">;</span></span></p>
<p style="font-size:12px;line-height:17px;"><span style="line-height:normal;">}</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">在希望显示图标的位置加入如下代码：</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#741828;">_statusItem</span><span style="color:#000000;"> = [[</span>NSStatusBarsystemStatusBar<span style="color:#000000;">]</span>statusItemWithLength<span style="color:#000000;">:</span><span style="color:#643820;">NSVariableStatusItemLength</span><span style="color:#000000;">]</span><span style="color:#000000;">;</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">[</span><span style="color:#741828;">_statusItem</span>setImage<span style="color:#000000;">:[</span>NSImageimageNamed<span style="color:#000000;">:</span><span style="color:#7b5229;">@"test"</span><span style="color:#000000;">]];</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">图标就可以显示出来了。</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">如果希望点击图标后显示菜单，你可以手工创建一个菜单：</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"> <a href="http://phaibin.tk/wp-content/uploads/2011/10/menubar-icon2.png"><img class="alignnone size-full wp-image-989522" title="menubar-icon2" src="http://phaibin.tk/wp-content/uploads/2011/10/menubar-icon2.png" alt="" width="155" height="193" /></a></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#0000ff;">NSMenu</span>* menu;</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">menu = [[</span>NSMenualloc<span style="color:#000000;">] </span>initWithTitle<span style="color:#000000;">:</span><span style="color:#7b5229;">@""</span><span style="color:#000000;">];</span><span style="color:#000000;">
</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">[menu </span>addItemWithTitle<span style="color:#000000;">:</span><span style="color:#7b5229;">@"Hi"</span>action<span style="color:#000000;">:<span style="color:#0000ff;">@selector</span>(<span style="color:#008080;">myhi</span>) </span>keyEquivalent<span style="color:#000000;">:</span><span style="color:#7b5229;">@""</span><span style="color:#000000;">];</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#741828;margin:0;"><span style="color:#000000;">[</span>_statusItem<span style="color:#0000ff;">setMenu</span><span style="color:#000000;">:menu];</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#741828;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">[menu <span style="color:#0000ff;">release</span>];</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#741828;margin:0;">这里假设myhi是你自己程序中的一个方法。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#741828;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">这样，你的菜单栏图标就有一个菜单了。你也可以使用addItemWithTitle方法添加更多的菜单。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">在程序退出的时候，记得把图标释放：</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">- (<span style="color:#0000ff;">void</span>)dealloc</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">{</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">[[</span>NSStatusBarsystemStatusBar<span style="color:#000000;">] </span>removeStatusItem<span style="color:#000000;">:</span><span style="color:#741828;">_statusItem</span><span style="color:#000000;">];</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#741828;margin:0;"><span style="color:#000000;">[</span>_statusItem<span style="color:#0000ff;">release</span><span style="color:#000000;">];</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;min-height:14px;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;color:#0000ff;margin:0;"><span style="color:#000000;">[</span>superdealloc<span style="color:#000000;">];</span></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">}</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">菜单栏图标还有一些其他的属性，你可以进行设置，比如：</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">alternateImage: 点击后显示的图标。如果设置了这个属性，点击图标后可以显示另外一幅图片。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">highlightMode: 点击图标后是否高亮。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">title: 如果设置title属性，将会在图标后面显示文字。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">length: 图标在菜单栏占的长度。设置为-1使用图片的默认长度。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">toolTip：鼠标指到图标上显示的工具提示。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">其他的属性你可以自己摸索。</p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;"></p>
<p style="font-size:12px;line-height:17px;font:normal normal normal 12px/normal Helvetica;margin:0;">Pal Kim写了一个非常好而且极为简单的例子，你可以在<a style="text-decoration:underline;color:#414555;border:0 initial initial;" href="http://www.noodlesoft.com/blog/2007/02/17/noodlelabs-super-duper-menu-bar-icon-tester-thing/" target="_blank">这里</a>下载。</p></p>
