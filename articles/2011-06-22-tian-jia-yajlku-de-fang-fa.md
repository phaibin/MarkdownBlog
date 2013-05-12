---
layout: post
title: 添加YAJL库的方法
date: 2011-06-22 06:49
categories:
- iphone
tags: []
published: true
comments: true
---
<p><div>iphone:</div>
<ul style="margin:1em 0 1em 2em !important;padding:0;">
	<li>Add <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">YAJLiOS.framework</code> to your project.</li>
	<li>In <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">Build Phases</code>, make sure its listed in <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">Link Binary With Libraries</code>, along with:
<ul style="margin:0 0 0 2em !important;padding:0;">
	<li><code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">CoreGraphics.framework</code></li>
	<li><code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">Foundation.framework</code></li>
	<li><code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">UIKit.framework</code></li>
</ul>
</li>
	<li>In <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">Build Settings</code>:
<ul style="margin:0 0 0 2em !important;padding:0;">
	<li>Under <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">Framework Search Paths</code> make sure the (parent) directory to <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">YAJLiOS.framework</code> is listed.</li>
	<li>Under <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">Other Linker Flags</code> in your target, add <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">-ObjC</code> and <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">-all_load</code></li>
</ul>
</li>
	<li>Import with <code style="font:normal normal normal 12px/normal 'Bitstream Vera Sans Mono', Courier, monospace;font-size:12px!important;color:#444444!important;border:1px !important solid !important #dedede!important;margin:0;padding:0 .2em!important;">#import &lt;YAJL/YAJL.h&gt;</code>.</li>
</ul>
<div>Mac:</div>
<div>
<ul>
	<li>Copy <code>YAJL.framework</code> to your project directory (maybe in MyProject/Frameworks/.)</li>
	<li>Add the <code>YAJL.framework</code> files (from MyProject/Frameworks/) to your target.</li>
	<li>In Build Settings, add <code>@loader_path/../Frameworks</code> to <code>Runpath Search Paths</code>. If you don't see <code>Runpath Search Paths</code> make sure <code>All</code> is selected instead of 'Basic'.</li>
	<li>In Build Phases, select <code>Add Build Phase</code>, then <code>Add Copy Files</code>.
<ul>
	<li>Change the Destination to <code>Frameworks</code>.</li>
	<li>Drag <code>YAJL.framework</code> into the the build phase</li>
	<li>Make sure the copy phase appears before any <code>Run Script</code> phases</li>
</ul>
</li>
	<li>Import with <code>#import &lt;YAJL/YAJL.h&gt;</code>.</li>
</ul>
</div>
项目主页：https://github.com/gabriel/yajl-objc</p>

<p>@loader_path 指的是应用程序运行的位置，也就是yourapp.app/Contents/MacOS/yourapp，所以要用一个..。app包的结构是这样的：</p>

<p><a href="http://phaibin.files.wordpress.com/2011/06/screen-shot-2011-09-20-at-e4b88ae58d8811-36-57.png"><img class="alignnone size-full wp-image-989444" title="Screen Shot 2011-09-20 at 上午11.36.57" src="http://phaibin.files.wordpress.com/2011/06/screen-shot-2011-09-20-at-e4b88ae58d8811-36-57.png" alt="" width="220" height="164" /></a></p>
