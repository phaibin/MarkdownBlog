---
layout: post
title: VirtualBox-虚拟机网络配置(转)
date: 2010-11-29 16:57
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p>“网络”配置页面有4个方案：</p>

<p>　　1：NAT 网络地址转换（Network Address Translation）</p>

<p>　　2：Birdged Network 桥接</p>

<p>　　3：Internal Network 内部网络（可以是虚拟机与虚拟机之间）</p>

<p>　　4：Host-Only 只与主机通信（大概吧）</p>

<p>　　安装完VirtualBox2.2后，主机多了一个“VirtualBox Host-Only Network ”本地网卡。</p>

<p>　　-------------------------------------------------- ------------------</p>

<p>　　我的网络环境：</p>

<p>　　主机：</p>

<p>　　系统：xp</p>

<p>　　“本地连接”的IP：由于是笔记本，经常换工作网络环境，都是通过DHCP分配的，有时候还无网络，“本地连接”有红叉（对主机与虚拟机通信有影响）。</p>

<p>　　“VirtualBox Host-Only Network网卡”IP：192.168.56.1 ,因为VirtualBox的DHCP服务器IP是192.168.56.100，要在同一网段。</p>

<p>　　虚拟机：要能与主机互相通信，要能访问互联网（不须要被互联网访问）。</p>

<p>　　系统：win2003</p>

<p>　　网卡1，网卡2，网卡3 后面说各网卡的配置情况</p>

<p>　　-------------------------------------------------- --------------------</p>

<p>　　--------------------------- 各网卡的配置情况 --------------------------------------------</p>

<p>　　网卡1： 用NAT方案</p>

<p>　　IP:10.0.2.15</p>

<p>　　网关：10.0.2.2</p>

<p>　　DNS：10.0.2.3</p>

<p>　　为什么这样配置？因为VirtualBox的帮助中，有以下一段说明（英译汉）:</p>

<p>　　一台虚拟机的多个网卡可以被设定使用 NAT， 第一个网卡连接了到专用网 10.0.2.0，第二个网卡连接到专用网络 10.0.3.0，等等。默认得到的客户端ip（IP Address）是10.0.2.15，网关（Gateway）是10.0.2.2，域名服务器（DNS）是10.0.2.3，可以手动参考这个进行修 改。</p>

<p>　　NAT方案优缺点：</p>

<p>　　笔记本已插网线时： 虚拟机可以访问主机，虚拟机可以访问互联网，在做了端口映射后（最后有说明），主机可以访问虚拟机上的服务（如数据库）。</p>

<p>　　笔记本没插网线时： 主机的“本地连接”有红叉的，虚拟机可以访问主机，虚拟机不可以访问互联网，在做了端口映射后，主机可以访问虚拟机上的服务（如数据库）。</p>

<p>　　网卡2：用Birdged Network 方案</p>

<p>　　IP：一般是DHCP分配的，与主机的“本地连接”的IP 是同一网段的。虚拟机就能与主机互相通信。</p>

<p>　　笔记本已插网线时：（若网络中有DHCP服务器）主机与虚拟机会通过DHCP分别得到一个IP，这两个IP在同一网段。 主机与虚拟机可以ping通，虚拟机可以上互联网。</p>

<p>　　笔记本没插网线时：主机与虚拟机不能通信。主机的“本地连接”有红叉，就不能手工指定IP。虚拟机也不能通过DHCP得到IP地址，手工指定IP后，也无法与主机通信，因为主机无IP。</p>

<p>　　这时主机的VirtualBox Host-Only Network 网卡是有ip的，192.168.56.1。虚拟机就算手工指定了IP 192.168.56.*，也ping不能主机。</p>

<p>　　网卡3： 用Host-Only 方案</p>

<p>　　ip: VirtualBox的DHCP服务器会为它分配IP ，一般得到的是192.168.56.101，因为是从101起分的，也可手工指定192.168.56.*。</p>

<p>　　笔记本已插网线时：虚拟机可以与主机的VirtualBox Host-Only Network 网卡通信</p>

<p>　　笔记本没插网线时：虚拟机可以与主机的VirtualBox Host-Only Network 网卡通信</p>

<p>　　这种方案不受主机本地连接（网卡）是否有红叉的影响。</p>

<p>　　-------------------------------------------------- ----------------</p>

<p>　　以上三种方案，可以右击虚拟机窗口最下边 两个小电视 的图标快速切换。满足各种网络环境。</p>

<p>　　关于Internal Network 方案，我也没试。 上面三种方案的总结</p>

<p>　　同进启用下面两个方案：</p>

<p>　　网卡2：用Birdged Network 方案</p>

<p>　　网卡3： 用Host-Only 方案</p>

<p>　　虚拟机访问主机 用的是主机的VirtualBox Host-Only Network网卡的IP：192.168.56.1 ，不管主机“本地连接”有无红叉，永远通。</p>

<p>　　主机访问虚拟机，用是的虚拟机的网卡3的IP： 192.168.56.101 ，不管主机“本地连接”有无红叉，永远通。</p>

<p>　　虚拟机访问互联网，用的是自己的网卡2， 这时主机要能通过“本地连接”有线上网，（无线网卡不行）</p>

<p>　　-------------------------------------------------- --------------------</p>

<p>　　---------------------------------转 NAT 设置端口映射 -------------------------------------------------- ----</p>

<p>　　http://huzhangsheng.blog.163.com/blog/static/34787 784200802801435931/</p>

<p>　　你可以设置一个虚拟机的服务（比如 WEB 服务），通过使用命令行工具 VboxManage 代理。你需要知道虚拟机的服务使用哪个端口，然后决定在主机上使用哪个端口（通常但不总是想要使虚拟机和主机使用同一个端口）。在主机上提供一个服务需要 使用一个端口，你能使用在主机上没有准备用来提供服务的任何端口。一个怎样设置新的 NAT 例子，在虚拟机上连接到一个 ssh 服务器，需要下面的三个命令：</p>

<p>　　VBoxManage setextradata "Linux Guest" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestss h/Protocol" TCP</p>

<p>　　VBoxManage setextradata "Linux Guest" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestss h/GuestPort" 22</p>

<p>　　VBoxManage setextradata "Linux Guest" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestss h/HostPort" 2222</p>

<p>　　说明：VboxManage 是一个命令行程序，请查询你的 VirtualBox 安装目录，"Linux Guest" 是虚拟主机名。guestssh 是一个自定义的名称，你可以任意设置，通过上面的三个命令，把虚拟机的 22 端口 转发到主机的 2222 端口。</p>

<p>又比如，我在虚拟机 debian 上安装了 apache2 服务器，使用 80 端口，映射到主机的 80 端口。使用下面的命令。</p>

<p>　　"C:Program Filesinnotek VirtualBoxVBoxManage.exe" setextradata "debian" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/huzhang sheng/Protocol" TCP</p>

<p>　　"C:Program Filesinnotek VirtualBoxVBoxManage.exe" setextradata "debian" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/huzhang sheng/GuestPort" 80</p>

<p>　　"C:Program Filesinnotek VirtualBoxVBoxManage.exe" setextradata "debian" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/huzhang sheng/HostPort" 80</p>

<p>　　注意：要使设置生效，请关掉 VirtualBox 再运行虚拟机，我把 VirtualBox 安装在 winxp 上，在虚拟机中安装 debian 4.02r ，虚拟机名是 debian ，并安装了 apache2 php5 mysql-server ，在主机上用IE浏览 http://localhost，成功转发到虚拟机 debian 的 apache2 web 服务器上 ubuntu下bugfree实现。</p>
