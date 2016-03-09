---
layout: post
title: GMail和GMail下载系统-2
date: 2005-12-20 12:55
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>现在来打造GMail http下载系统。</p><p>先下载个支持php的空间，并且要支持ssl，而且还得是linux的主机，要求很高，不好找，<a href="http://www.5gigs.com/">http://www.5gigs.com/</a>和<a href="http://www.wagoo.com/">http://www.wagoo.com/</a>都可以，我用的<a href="http://www.5gigs.com/">http://www.5gigs.com/</a>的，很快，而且很专业。<a href="http://www.5gigs.com/">http://www.5gigs.com/</a>的空间要等几个小时才能开通。</p><p>这个系统有4个版本<br />&nbsp;&nbsp;&nbsp; gmail-lite-0.9<br />&nbsp;&nbsp;&nbsp; pgd-0.3.3<br />&nbsp;&nbsp;&nbsp; gmail_sharer_v11<br />&nbsp;&nbsp;&nbsp; gdrive0.6<br />里面的文件大同小异，可能鼻祖是gmail-lite-0.9，其他都是改编的。我用的gmail_sharer_v11，这个简单，不用登陆界面，直接进入我的邮箱。不过这几个都对中文的支持不好。</p><p>在gmail_share里有5个文件<br />&nbsp;config.php<br />&nbsp;dl.php<br />&nbsp;libgmailer.php<br />&nbsp;link.php<br />&nbsp;readme.txt<br />在config.php里编辑你的GMail帐户，改第一个就可以了，如果你有多个帐户，那就把后面的都改了。<br />在link.php里这行 <font face="Courier New">$gm-&gt;fetchBox(GM_LABEL, &quot;share&quot;, 0); 表明你的邮件要标上share标签，你也可以改掉它，就是在你的GMail里创作share标签，把带附件的邮件打上share标签。</font></p><p><font face="Courier New">下面在你的主页空间里建目录gmail，把上面4个文件传过去，改权限为755，访问<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你的域名/gmail/link.php<br />就可以了，你也可以把link.php改为index.php，这样访问<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;你的域名/gmail/<br />就可以了。这是我的地址<br />&nbsp;&nbsp;&nbsp;&nbsp; <a href="http://www.phaibin.5gigs.com/gmail/">http://www.phaibin.5gigs.com/gmail/</a><br />最厉害的是居然可以用下载工具下载。</font></p><p><font face="Courier New">让邮件自动打上share标签的方法：登陆你的邮箱，点击</font><span class="lk"><font face="Arial" size="2">创建过滤器，发件人是你自己，下一步选贴标签share。</font></span></p><p><span class="lk"><font size="2">这样这个系统的使用过程就是在我的电脑里拷文件到GMail Drive，这样就在你的邮箱里发了一封带附件的邮件，并且贴上了share标签，现在浏览你的主页就会现在相应的文件。</font></span></p></p>
