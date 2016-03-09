---
layout: post
title: 用 dig 及 host 来取代 nslookup
date: 2005-08-11 00:32
categories:
- FreeBSD
tags: []
published: true
comments: true
---
<p><div class="diaryContent" id="diary1007086">一般我们用来检查网络是否有问题，大多是用以下三个指令.. <br /><br />nslookup <br />ping <br />traceroute <br /><br />其中 nsllokup 是用来检查 dns 的相关设定， ping 用来检查自己和对方网络是否通顺，而 traceroute 则是用来检查从自己的计算机到对方的计算机所经过的线路状况.. <br /><br />不过以 nslookup 而言，个人觉得不是很实用，有时我们只是想单纯的查一下某台主机或是 MX 记录，那使用 nslookup 就有点噜嗦了.. <br /><br />在此介绍二个好用的指令 host 及 dig，这二个指令很类似，不过效率较 nslookup 高 <br /><br /># host -a &lt;主机名称&gt; 或 <br /><br />=&gt; 输入主机名称显示 dns 正向解析的部份，输入 ip 则是显示反向(ptr) <br /><br /># dig &lt;主机名称或ip&gt; <br /><br />如要显示 MX 记录 <br /><br /># dig 主机名称 mx <br /><br />个人是觉得比 nslookup 方便多了，你觉得呢.. ^.^ <br /><br />当然功能不只这些，详情请 man dig 或 host.. <br /></div></p>
