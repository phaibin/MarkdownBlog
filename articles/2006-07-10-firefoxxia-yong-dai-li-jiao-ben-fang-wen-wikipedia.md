---
layout: post
title: Firefox下用代理脚本访问Wikipedia
date: 2006-07-10 18:46
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p><code>function FindProxyForURL(url, host)<br />{<br />url = url.toLowerCase();<br />host = host.toLowerCase();<br /><br />if(dnsDomainIs(host,&quot;wikipedia.org&quot;)) return &quot;PROXY 145.97.39.132:80&quot;;<br />else return &quot;DIRECT&quot;;<br /><br />}<br /></code>　　把这段文本保存为proxy.pac，然后选择Firefox的工具/选项/连接设置/选择自动代理配置，输入proxy.pac的路径，如：&quot;C: Program FilesMozilla Firefoxpluginsproxy.pac&quot;，然后载入设置，ok。</p>
<p>由于维基的图片是在wikimedia.org域中的，所以按照上述方法处理后，图片仍然显示不出来，我在配置文件中加了这么一行： <br /><code><br />else if(dnsDomainIs(host,&quot;wikimedia.org&quot;)) return &quot;PROXY 145.97.39.132:80&quot;;</code></p></p>
