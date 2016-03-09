---
layout: post
title: Vista下用586W做MODEM上网
date: 2009-02-09 17:52
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>1.Windows Mobile 设备中心,选择&#8220;连接设置&#8221;，然后取消USB端口，避免手机和电脑自动同步，导致无法上网。将手机和电脑通过同步数据线连接起来，这时会提示找到新硬件，选择安装。</p>
<p>2.进入设备管理器，调制解调器属性，设置额外的初始化命令，AT+CGDCONT=1,"IP","cmnet"，确认。</p>
<p>3.创建一个新的拨号连接，MODEM设备选择新增的HTC MODEM。用户名和密码为空，拨号号码为*99#。</p></p>
