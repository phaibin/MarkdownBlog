---
layout: post
title: iPhone确认网络环境 3G/WIFI
date: 2011-08-09 03:16
categories:
- iphone
tags: []
published: true
comments: true
---
<p>原文：<a href="http://www.yifeiyang.net/iphone-web-development-skills-of-the-article-4-make-sure-the-network-environment-3gwifi/">http://www.yifeiyang.net/iphone-web-development-skills-of-the-article-4-make-sure-the-network-environment-3gwifi/</a></p>

<p>开发Web等网络应用程序的时候，需要确认网络环境，连接情况等信息。如果没有处理它们，是不会通过Apple的审查的。
<h3><a name="sec1"></a>Reachability</h3>
<p class="first">Apple 的 例程 <a href="http://developer.apple.com/iphone/library/samplecode/Reachability/index.html">Reachability</a> 中介绍了取得/检测网络状态的方法。在你的程序中使用 Reachability 只须将该例程中的 Reachability.h 和 Reachability.m 拷贝到你的工程中。如下图：</p></p>

<p><div class="imagebox" /></p>

<p><a rel="lightbox[383]" href="http://www.yifeiyang.net/images/iphone/Reachability1.png"><img src="http://www.yifeiyang.net/images/iphone/Reachability1.png" alt="Reachability" width="202" /></a>
然后将 SystemConfiguration.framework 添加进工程：
<div class="imagebox" /></p>

<p><a rel="lightbox[383]" href="http://www.yifeiyang.net/images/iphone/Reachability2.png"><img src="http://www.yifeiyang.net/images/iphone/Reachability2.png" alt="Reachability" width="232" /></a>
Reachability 中定义了3种网络状态。
<div class="codebox" style="padding-bottom:15px;">
<table border="0" width="100%">
<tbody>
<tr>
<td class="line_numbers">
<pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14</pre>
</td>
<td>
<pre><span style="font-family:mceinline;">// the network state of the device for Reachability 1.5.
typedef enum {
    NotReachable = 0,
    ReachableViaCarrierDataNetwork,
    ReachableViaWiFiNetwork
} NetworkStatus;</span></pre></td></tr></tbody></table></div></p>

<p>// the network state of the device for Reachability 2.0.<br />
typedef enum {<br />
    NotReachable = 0,<br />
    ReachableViaWiFi,<br />
    ReachableViaWWAN<br />
} NetworkStatus;




<ul>
	<li>NotReachable
<blockquote>
<p class="quoted">无连接</p>
</blockquote>
</li>
	<li>ReachableViaCarrierDataNetwork （ReachableViaWWAN）
<blockquote>
<p class="quoted">使用3G/GPRS网络</p>
</blockquote>
</li>
	<li>ReachableViaWiFiNetwork (ReachableViaWiFi)
<blockquote>
<p class="quoted">使用WiFi网络</p>
</blockquote>
</li>
</ul>
比如检测某一特定站点的接续状况，可以使用下面的代码：
<div class="codebox" style="padding-bottom:15px;">
<table border="0" width="100%">
<tbody>
<tr>
<td class="line_numbers">
<pre>1
2
3
4
5
6
7
8
9
10
11
12</pre>
</td>
<td>
<pre><span class="type">Reachability</span> *<span class="variable-name">r</span> = [<span class="type">Reachability</span> reachabilityWithHostName:@“www.apple.com”];
<span class="keyword">switch</span> ([r currentReachabilityStatus]) {
    <span class="keyword">case</span> NotReachable:
        <span class="comment-delimiter">// </span><span class="comment">没有网络连接
</span>        <span class="keyword">break</span>;
    <span class="keyword">case</span> ReachableViaWWAN:
        <span class="comment-delimiter">// </span><span class="comment">使用3G网络
</span>        <span class="keyword">break</span>;
    <span class="keyword">case</span> ReachableViaWiFi:
        <span class="comment-delimiter">// </span><span class="comment">使用WiFi网络
</span>        <span class="keyword">break</span>;
}</pre>
</td>
</tr>
</tbody></table>
</div>
<h3><a name="sec2"></a>检测当前网络环境</h3>
<p class="first">程序启动时，如果想检测可用的网络环境，可以像这样。</p></p>

<p><div class="codebox" style="padding-bottom:15px;">
<table border="0" width="100%">
<tbody>
<tr>
<td class="line_numbers">
<pre>1
2
3
4
5
6
7
8
9</pre>
</td>
<td>
<pre><span class="comment-delimiter">// </span><span class="comment">是否wifi
</span>+ (<span class="type">BOOL</span>) <span class="function-name">IsEnableWIFI</span> {
    <span class="keyword">return</span> ([[<span class="type">Reachability</span> reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}</pre></td></tr></tbody></table></div></p>

<p><span class="comment-delimiter">// </span><span class="comment">是否3G
</span>+ (<span class="type">BOOL</span>) <span class="function-name">IsEnable3G</span> {<br />
    <span class="keyword">return</span> ([[<span class="type">Reachability</span> reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);<br />
}




<h3><a name="sec3"></a>连接状态实时通知</h3>
<p class="first">网络连接状态的实时检查，通知在网络应用中也是十分必要的。接续状态发生变化时，需要及时地通知用户。</p></p>

<p><div class="codebox" style="padding-bottom:15px;">
<table border="0" width="100%">
<tbody>
<tr>
<td class="line_numbers">
<pre>1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39</pre>
</td>
<td>
<pre><span class="comment-delimiter">// </span><span class="comment">MyAppDelegate.h
</span>
<span class="keyword">@class</span> <span class="type">Reachability</span>;</pre></td></tr></tbody></table></div></p>

<p><span class="keyword">@interface</span> <span class="type">MyAppDelegate</span> : <span class="type">NSObject</span> &lt;<span class="type">UIApplicationDelegate</span>&gt; {<br />
    <span class="type">Reachability</span>  *<span class="variable-name">hostReach</span>;<br />
}</p>

<p><span class="keyword">@end</span></p>

<p><span class="comment-delimiter">// </span><span class="comment">MyAppDelegate.m
</span>- (<span class="type">void</span>)<span class="function-name">reachabilityChanged</span>: (<span class="type">NSNotification</span> *)<span class="variable-name">note</span> {<br />
    <span class="type">Reachability</span>* <span class="variable-name">curReach</span> = [note object];<br />
    <span class="type">NSParameterAssert</span>([curReach isKindOfClass: [<span class="type">Reachability</span> class]]);<br />
    <span class="type">NetworkStatus</span> <span class="variable-name">status</span> = [curReach currentReachabilityStatus];</p>

<p>    <span class="keyword">if</span> (status == NotReachable) {<br />
        <span class="type">UIAlertView</span> *<span class="variable-name">alert</span> = [[<span class="type">UIAlertView</span> alloc] initWithTitle:@<span class="string">"AppName""<br />
                                                        message:@"</span>NotReachable<span class="warning">"</span><span class="string">
                                                       delegate:nil<br />
                                              cancelButtonTitle:@"</span><span class="constant">YES</span><span class="warning">"</span><span class="string"> otherButtonTitles:nil];<br />
        [alert show];<br />
        [alert release];<br />
    }<br />
}</span></p>

<p>- (void)applicationDidFinishLaunching:(UIApplication *)application {<br />
    // ...</p>

<p>    // 监测网络情况<br />
    [[NSNotificationCenter defaultCenter] addObserver:self<br />
                                          selector:@selector(reachabilityChanged:)<br />
                                          name: kReachabilityChangedNotification<br />
                                          object: nil];<br />
    hostReach = [[Reachability reachabilityWithHostName:@"www.google.com<span class="warning">"</span><span class="string">] retain];<br />
    [hostReach startNotifer];<br />
    // ...<br />
}
</span>



</p>
