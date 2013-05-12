---
layout: post
title: VirtualBox 共享文件夹设置
date: 2011-01-11 06:55
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p><p>环境：   <br />主机(host)：windowsXP    <br />虚拟机：VirtualBox    <br />客户机 (guest)：ubuntu    <br /></p>  <p>设置VirtualBox共享文件夹之前需要安装VirtualBox Guest Additions.如果没有安装。</p>  <p>1. 在主机windows上设一个目录，作为共享目录(并不需要在windows下设置共享属性,其实也是一个普通的文件夹)。(我设的是：D:sharedfolder)</p>  <p>   <br />2.在虚拟机VirtualBox上，如果虚拟机上linux操作系统未启动，在设置-&gt;数据空间 中指定D:sharedfolder作为共享文件夹，且要指定其映射在linux中的名字，默认是和你的目录名一样，我这里即sharedfolder。如果虚拟机上的linux操作系统已经启动，在设备-&gt;分配数据空间&#160; 中可以进行同样的设置。</p>  <p>   <br />3.打开虚拟机上一个控制台，在root的权限下执行如下命令：    <br />&#160;&#160;&#160; #mkdir /mnt/share&#160; //创建一个目录来挂载共享文件夹,当然你可以在任何地方创建一个目录。    <br />然后运行命令：mount -t vboxsf [-o OPTIONS] sharename mountpoint。这里sharename就是我上面提到的默认的名字sharedfolder,mountpoint就是指你想把windows共享文件夹挂载在linux的什么地方。我在这里用的是：    <br />&#160;&#160;&#160; #sudo mount -t vboxsf sharedfolder /mnt/share     <br />如果要让系统启动时自动挂载这个共享文件夹,则可以在/etc/fstab中加入一条记录,具体如下:    <br />sudo pico /etc/fstab    <br />加入一句:    <br />sharedfolder&#160;&#160; /mnt/share&#160; vboxsf defaults 0 0    <br />保存并退出,以后系统启动时会就自动挂载这个文件夹了到/mnt/share    <br />其实挂载这个共享文件夹也如同挂载其它设备一样.    <br />    <br />4.这样就可以把文件放在windows主机的 d:sharedfolder下，在linux客户机中的/mnt/share中就可以看到了。</p></p>
