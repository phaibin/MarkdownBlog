---
layout: post
title: 管理多个Gmail邮箱
date: 2009-05-21 15:20
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>我有两个Gmail邮箱，一个是个人用，一个是工作用，每次都要登陆两个账户，而且各种提醒工具比如Gmail Notifier和Google Toolbar都只能设置一个账户，很不方便。于是搜索一下别人的设置，找到一个比较方便的办法。</p> <p>比如我有两个邮箱：<a href="mailto:friend@gmail.com">friend@gmail.com</a>和<a href="mailto:job@gmail.com">job@gmail.com</a>，希望可以在friend邮箱里面接收job的邮件和以job身份发送邮件。</p> <p>1.进入job邮箱，打开settings-&gt;filters-&gt;create a new filter，在Has the words一项加入: in:inbox OR in:spam，点击下一步，然后选Forward it to，并加入friend的邮件地址，保存。这样，所有到达inbox和spam标签下的邮件都会被转发给friend了。你还可以根据需要勾选skip the inbox，mark as read等等。</p> <p>2.在friend帐号中创建过滤器和标签分类：在过滤器has the words一项中加入: to:job@gmail.com OR cc: <a href="mailto:job@gmail.com">job@gmail.com</a>，并在下一步中选择skip the inbox，apply the label。意思是, 如果邮件的收件人是job，或者转发给job的邮件，都不进入inbox，而是应用一个我预先定义好的标签，比如job。</p> <p>3.设置以job的身份发送邮件。登录friend，在Settings-&gt;Accounts中有一项Send mail as的设置，允许你以其他邮件地址发送邮件(不限于Gmail)。点击Add another email address，在弹出对话框中，输入job所对应的邮件地址，点下一步，点发送验证。然后进入job的邮箱，在收到的确认信中点确认链接确认。这时回到friend邮箱，在撰写邮件的时候，from一栏就会多出一个选项：job。现在你就可以在friend帐号中以job的身份发邮件了。</p> <p>ps:这样设置完之后因为job的邮件没有保存的friend的收件箱中，所以Gmail的邮件提醒工具会检测不到新邮件，所以我就把那个选项去掉了。缺点就是两种邮件混杂在了一起。不过应用一个显眼的tag还是比较好区分的。</p></p>
