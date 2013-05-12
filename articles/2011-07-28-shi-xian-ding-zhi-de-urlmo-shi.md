---
layout: post
title: 实现定制的URL模式
date: 2011-07-28 02:31
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p style="margin-top:0;margin-bottom:.833em;font:normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;">您可以为自己的应用程序注册包含定制模式的URL类型。定制的URL模式是第三方应用程序和其它程序及系统进行交互的机制。通过定制的URL模式，应用程序可以将自己的服务提供给其它程序。</p>
<p style="margin-top:0;margin-bottom:.833em;font:normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>图1-7 </strong>在<code style="font-size:12px;font-family:Courier, Consolas, monospace;color:#666666;">Info.plist</code>文件中定义一个定制的URL模式</p>
<p><img src="http://www.apple.com.cn/developer/iphone/library/documentation/iPhone/Conceptual/iPhoneOSProgrammingGuide/Art/register_custom_scheme.jpg" alt="Defining a custom URL scheme in the Info.plist file" /></p>
<p>然后在safari中输入：todolist:就可以访问你的程序。在代码中应该这么写：</p>
<table style="width:1052px;padding-bottom:4px;border:1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding:.5em;" scope="row">
<pre style="font-size:11px;font-family:Courier, Consolas, monospace;color:#666666;margin:-.083em .333em 0 .5em;">NSURL *myURL = [NSURL URLWithString:@"todolist://www.acme.com?Quarterly%20Report#200806231300"];</pre>
</td>
</tr>
<tr>
<td style="padding:.5em;" scope="row">
<pre style="font-size:11px;font-family:Courier, Consolas, monospace;color:#666666;margin:-.083em .333em 0 .5em;">[[UIApplication sharedApplication] openURL:myURL];</pre>
</td>
</tr>
</tbody>
</table>
<p>苹果内置支持<code style="font-size:12px;font-family:Courier, Consolas, monospace;color:#666666;">http</code>、<code style="font-size:12px;font-family:Courier, Consolas, monospace;color:#666666;">mailto</code>、<code style="font-size:12px;font-family:Courier, Consolas, monospace;color:#666666;">tel</code>、和<code style="font-size:12px;font-family:Courier, Consolas, monospace;color:#666666;">sms</code>这些URL模式，还支持基于<code style="font-size:12px;font-family:Courier, Consolas, monospace;color:#666666;">http</code>的、指向Maps、YouTube、和iPod程序的URL。</p>
<p> </p></p>
