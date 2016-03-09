---
layout: post
title: 使用快捷键启动应用程序
date: 2011-09-18 03:24
categories:
- Mac
tags:
- mac
published: true
comments: true
---
<p><p>转自：<a href="http://mac.linsheng.me/archives/822.html">http://mac.linsheng.me/archives/822.html</a></p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;margin:0 0 1em;padding:0;">在Mac中，我们可以通过很多方式来启动应用程序。比如通过鼠标在Finder中双击或者通过Spotlight或者QuickSilver等工具来启动。可是，你有没有想过通过一个快捷键就来启动一个应用程序呢？其实，这个功能并不需要使用第三方软件就可以实现。今天，我们就来介绍一下实现的方法。</p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;margin:0 0 1em;padding:0;">1. 运行Automator。在弹出的新建窗口中，选择新建一个“服务”。</p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0 0 1em;padding:0;"><img style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;float:none;margin:0 12px 0 0;padding:0;" src="http://mac.linsheng.me/wp-content/uploads/2009/11/new-service.png" alt="new-service.png" width="400" height="374" /></p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;text-align:left;margin:0 0 1em;padding:0;">2. 在编辑页面， 选中“资源库”中的“实用工具”，然后在出现的操作中，将“开启应用程序”拖拽到右侧的工作流中。</p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0 0 1em;padding:0;"><img style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;float:none;margin:0 12px 0 0;padding:0;" src="http://mac.linsheng.me/wp-content/uploads/2009/11/open-app-1.png" alt="open-app-1.png" width="387" height="353" /></p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;margin:0 0 1em;padding:0;">3. 拖拽完毕后，会出现一个下拉框让你选择应用程序。选择你希望启动的应用程序。然后将编辑窗口上方的“服务接收”设置为“没有输入”，“位置”为“任何应用程序”。</p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0 0 1em;padding:0;"><img style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;float:none;margin:0 12px 0 0;padding:0;" src="http://mac.linsheng.me/wp-content/uploads/2009/11/setting-1.png" alt="setting-1.png" width="570" height="173" /></p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;margin:0 0 1em;padding:0;">4. 保存。</p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;margin:0 0 1em;padding:0;">5. 打开“系统偏好设置”，进入“键盘”，选择“键盘快捷键”标签。在左侧的选择“服务”，在右侧的服务列表的“通用”项下面，就会出现你刚才创建的那个服务。双击这个服务的右侧位置，就可以给这个服务设置一个快捷键。</p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;text-align:center;margin:0 0 1em;padding:0;"><img style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;float:none;margin:0 12px 0 0;padding:0;" src="http://mac.linsheng.me/wp-content/uploads/2009/11/shortcut-2.png" alt="shortcut-2.png" width="500" height="216" /></p>
<p style="font-weight:inherit;font-style:inherit;font-size:14px;font-family:inherit;vertical-align:baseline;margin:0 0 1em;padding:0;">到此为止，我们就完成了整个设置。这时，只要我们按下刚才设置的快捷键，指定的应用程序就被启动了。这应该算是启动应用的最快的方式了。快去试试吧。</p></p>
