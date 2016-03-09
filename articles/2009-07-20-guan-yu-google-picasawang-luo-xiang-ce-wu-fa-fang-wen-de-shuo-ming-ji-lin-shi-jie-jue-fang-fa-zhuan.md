---
layout: post
title: 关于Google Picasa网络相册无法访问的说明及临时解决方法（转）
date: 2009-07-20 13:51
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p>2011-1-5更新</p>

<p>来源：<a href="http://bigdouya.blogbus.com/">杀毒之家</a></p>

<p>到今天已经是第四天了，Google Picasa Web Albums 还是无法访问。豆芽这里是北京网通，在昨天晚上有一段时间可以访问，但今天又不行了...本站图片已经挂了四天了，给大家带来的不便请谅解！</p>

<p>在6月24日，Goole Gmail也发生过类似情况，这里不想对Z-F、GFW、Google发表更多看法，只是希望他们多为用户想一想，望Google之事早日妥善解决。</p>

<p>目前大家只能用翻墙或直接解析Google Picasa域名IP的方法使用Google Picasa：</p>

<p><strong>挂代理：</strong>随便找个代理（非中国），把自己的外网IP换成代理的即可。（具体方法大家Google一下吧）</p>

<p><strong>直接解析Google Picasa域名的IP：
</strong> 打开我的电脑，找到C:windowssystem32driversetchosts，然后用记事本打开。在文件末尾复制如下地址：</p>

<p>#picasaweb.google.com<br />
203.208.39.104 picadaweb.google.com<br />
203.208.39.104 lh1.ggpht.com<br />
203.208.39.104 lh2.ggpht.com<br />
203.208.39.104 lh3.ggpht.com<br />
203.208.39.104 lh4.ggpht.com<br />
203.208.39.104 lh5.ggpht.com<br />
203.208.39.104 lh6.ggpht.com</p>

<p>复制完成后，退出并保存。重新打开浏览器即可访问和查看Google Picasa Web Albums。 目前Google没有发布正式公告说明。</p>
