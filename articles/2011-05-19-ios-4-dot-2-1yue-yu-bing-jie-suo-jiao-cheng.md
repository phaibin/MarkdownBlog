---
layout: post
title: IOS 4.2.1越狱并解锁教程
date: 2011-05-19 13:35
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p style="margin:0;padding:0;">原文：http://sj.bbs.91.com/thread/26/67/20101130/4cf465caadc1f5413-1.html</p>
<p style="margin:0;padding:0;"> </p>
<p style="margin:0;padding:0;">本教程适用于iPhone 3G / 3GS 有锁版用户，无锁版的请参阅教程“<a href="http://sj.bbs.91.com/thread/26/67/20101124/4cecd31e14f86b713-1.html" target="_blank"><span style="color:#cc00ff;margin:0;padding:0;">使用Redsn0w 0.9.6b4越狱iOS 4.2.1教程</span></a>”。何为有锁无锁？<a href="http://iphone.sj.91.com/content/2010-06-02/20100602182958849,1.shtml" target="_blank"><span style="color:#cc00ff;margin:0;padding:0;">iPhone新手扫盲名词解释</span></a>为您释疑。<strong>目前</strong> <strong>RedSn0w 仅支持iPhone 3G 完美越狱，iPhone 3GS仍需 RedSn0w 引导开机。</strong>总之还是一个词：<span style="font-size:x-small;"><strong>慎越</strong></span>。<br /><br />鉴于 RedSn0w 是利用 iPad 固件将 iPhone 的基带升级到 06.15.00 ，这必然会造成官方识别出现错误，也就是意味着机器将无法利用官方固件进行固件升级，而只能通过自制固件进行刷机，因为基带一经升级就无法下降。何为基带？请参见<a href="http://iphone.sj.91.com/content/2010-06-02/20100602182958849,1.shtml" target="_blank"><span style="color:#cc00ff;margin:0;padding:0;">iPhone新手扫盲名词解释</span></a>。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img5.91huo.cn/ipad.sj/2010/11/25/ipad421yueyu11.jpg" alt="" /></p>
<p style="margin:0;padding:0;"><strong>RedSn0w v0.9.6 beta5 Win版            RedSn0w v0.9.6 beta5 MAC版</strong></p>
<p style="margin:0;padding:0;"><a href="http://www.91rb.com/pc/redsn0w_win_0.9.6b5.zip" target="_blank"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/null/2010/07/26/20100726222152856.jpg" alt="" /> </a> <a href="http://www.91rb.com/pc/redsn0w_mac_0.9.6b5.zip" target="_blank"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/null/2010/07/26/20100726222152856.jpg" alt="" /></a></p>
<p> </p>
<p style="margin:0;padding:0;">根据自己的PC操作系统下载红雪，以下教程于Windows下制作。</p>
<p><br /><br /></p>
<p style="margin:0;padding:0;"><strong>越狱前的准备：</strong></p>
<p style="margin:0;padding:0;">1.ios4.2（4.2.1）官方固件： <a href="http://appldnld.apple.com/iPhone4/061-9853.20101122.Vfgt5/iPhone1,2_4.2.1_8C148_Restore.ipsw" target="_blank"><span style="color:#cc00ff;margin:0;padding:0;">iPhone 3G</span></a> 、 <a href="http://appldnld.apple.com/iPhone4/061-9895.20101122.Cdew2/iPhone2,1_4.2.1_8C148a_Restore.ipsw" target="_blank"><span style="color:#cc00ff;margin:0;padding:0;">iPhone 3GS</span></a></p>
<p style="margin:0;padding:0;">2.RedSn0w v0.9.6 beta5（下载地址见上文）</p>
<p style="margin:0;padding:0;">3. iPhone 资料通过 iTunes 先进行备份。</p>
<p style="margin:0;padding:0;">4.备份 iPhone 的SHSH。参阅教程 <a href="http://iphone.sj.91.com/content/2010-06-28/20100628000014805,1.shtml" target="_blank"><span style="color:#cc00ff;margin:0;padding:0;">使用TinyUmbrella 备份SHSH</span></a><span style="color:#cc00ff;margin:0;padding:0;"> </span></p>
<p style="margin:0;padding:0;"><span style="color:#000000;margin:0;padding:0;">5.深吸一口气，准备解锁越狱。</span></p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img1.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo33.jpg" alt="" /></p>
<p style="margin:0;padding:0;"> </p>
<p style="margin:0;padding:0;"><strong>开始越狱</strong></p>
<p style="margin:0;padding:0;">第一步：恢复官方固件到4.2（4.2.1）</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img3.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo44.jpg" alt="" /></p>
<p>将 iPhone 用数据线连接电脑，打开 iTunes，按住 Shift + 左键 点击“恢复”，然后选择下载到本地 ios4.2（4.2.1）固件进行恢复。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img5.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo55.jpg" alt="" /></p>
<p style="margin:0;padding:0;">等待 iPhone 恢复固件完成。</p>
<p style="margin:0;padding:0;">第二步：打开RedSn0w</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img6.91huo.cn/ipad.sj/2010/11/25/ipad421yueyu66.jpg" alt="" /></p>
<p style="margin:0;padding:0;">在电脑中找到刚才下载的RedSn0w，并打开。</p>
<p style="margin:0;padding:0;"> </p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img9.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo77.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第四步：在弹出来的对话框中选择ios4.2（4.2.1）固件然后打开。（<strong>请注意</strong>：iPhone 3G 和 iPhone 3GS 固件的命名是不一样的，务必仔细认真校验，避免出错。比如ios4.2.1固件官方下载下来的命名，iPhone 3G 是 iPhone1,2_4.2.1_8C148_Restore.ipsw而iPhone 3GS 是iPhone2,1_4.2.1_8C148_Restore.ipsw）。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img2.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo88.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第五步：待到固件核实无误以后，点击“Next”继续。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img4.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo99.jpg" alt="" /></p>
<p style="margin:0;padding:0;">然后将会看到RedSn0w<span style="color:#000000;margin:0;padding:0;">在准备越狱数据，等待进度条完成。</span></p>
<p style="margin:0;padding:0;"><span style="color:#000000;margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img3.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo1010.jpg" alt="" /></span></p>
<p style="margin:0;padding:0;"> </p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img5.91huo.cn/iphone.sj/2010/11/28/iphone421jiesuo1111.jpg" alt="" /></p>
<p style="margin:0;padding:0;">其中的一些功能一般只有开发人员和高级用户可能会用到，平常用户不必理睬。</p>
<p style="margin:0;padding:0;">您也可以使用RedSn0w开启多任务（Enable Multitasking）、启用主屏幕壁纸（Enable homescreen wallpaper）、启用电池百分比（Enable battery percentage）。建议不要开启主屏幕壁纸及多任务功能，这两项功能会明显拖慢3G的运行速度。</p>
<p style="margin:0;padding:0;"><strong><span style="color:#ff0000;margin:0;padding:0;">如果你想勾选“Install iPad Baseband”来实现iPhone3G/3GS 4.1/4.2.1固件解锁的话，你需要了解以下信息：<br /></span></strong><strong><span style="color:#ff0000;margin:0;padding:0;">1、刷新了iPad基带后，您的基带将无法还原回“正常”的基带；<br />2、你的iPhone将无法获得苹果的保修；<br />3、只能通过刷新PwnageTool制作的自制固件来升级</span></strong></p>
<p style="margin:0;padding:0;">如果您已经了解到此次越狱解锁对您的iPhone将带来的变化以后，想进行解锁和越狱，要把基带升级为06.15 iPad 版本的话。就请您勾选“<strong>Install iPad Baseband</strong>”吧，在随后弹出的提示框点击确定。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img9.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1133.jpg" alt="" /></p>
<p> </p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img2.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1144.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第八步：按提示将 iPhone 关机，同时保持与电脑连接的状态，随后点击“Next”继续。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img4.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1155.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第九步：进入DFU模式。按住上方的Power电源键（开机），不要松开。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img6.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1166.jpg" alt="" /></p>
<p style="margin:0;padding:0;"> </p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img8.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1177.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第十一步：保持Power电源键和Home键同时按下的情况下，约10秒（大多小于10秒）后，即可松开电源键，但Home键仍然不能松开。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img1.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1188.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第十二步：约30秒后可松开Home键，此时RedSn0w开始对iPad进行上传和修补操作，此过程务必不要打断。RedSn0w将下载iPad基带然后将重启您的iPhone。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img3.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo1199.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://img5.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo2020.jpg" alt="" /></p>
<p> </p>
<p>第十三步：等待RedSn0w开始上传新越狱相关文件。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img7.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo2211.jpg" alt="" /></p>
<p>第十四步：点击“Finish”结束，然后重启 iPhone （约5-10分钟）宣告正式完成。</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img9.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo2222.jpg" alt="" /></p>
<p style="margin:0;padding:0;">第十五步：（iPhone 3G 请轻松飘过这个步骤）由于 iPhone 3GS 还是不完美越狱，Cydia和Safari有可能是没有办法运行的，这时就需要RedSn0w进行 iPhone 启动引导开机</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://img2.91huo.cn/iphone.sj/2010/11/29/iphone421jiesuo2233.jpg" alt="" /></p>
<p style="margin:0;padding:0;"><span style="color:#ff0000;margin:0;padding:0;">因为此次的解锁并不是完美的，如果不升级官方基带的话，将无法使用官方固件，而只能通过自制固件进行刷机了，因为基带一经升级就无法下降。而 iPhone 3GS 每次的重启都需要 RedSn0w进行引导，因此非常的不方便，还望各位机油们慎越之</span></p>
<p style="margin:0;padding:0;"><span style="color:#ff0000;margin:0;padding:0;"><br /></span></p>
<p>选择“Manage”按钮，进入管理选项卡</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_01_0625.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_02_0625.jpg" alt="" /></p>
<p>第三步：选择“Sources”按钮进入Cydia源管理界面<br />第四步：如果ultrasn0w源地址已经在源列表里则跳到第九步，否则按照下面的操作添加ultrasn0w源地址，点击右上角的“Edit”按钮</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_03_0625.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_04_0625.jpg" alt="" /></p>
<p>第五步：按下“Add”按钮<br />第六步：在弹出的输入框中输入ultrasn0w源地址<a href="http://repo666.ultrasn0w.com/" target="_blank">http://repo666.ultrasn0w.com</a>（其中ultrasn0w中的0是数字0而不是字母0 ），并按下“Add Source”按钮<strong>（也可以添加91手机助手的源</strong><a href="http://91rb.com/cydia" target="_blank"><strong>http://91rb.com/cydia</strong></a><strong>进行对超雪的安装）</strong></p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_05_0625.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_06_0625.jpg" alt="" /></p>
<p> </p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_07_0625.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_08_0625.jpg" alt="" /></p>
<p>第九步：按下ultrasn0w源地址，进入源软件列表<br />第十步：选择“ulteasn0w”补丁</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/06/25/ip_jc_ultrasn0w_4.0_09_0625.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/08/04/ip_jc_ultrasn0w_iphone4_01_0804.jpg" alt="" /></p>
<p>第十一步：按下右上角的“Install”按钮，安装ultrasn0w<br />第十二步：按下“Confirm”按钮继续</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/08/04/ip_jc_ultrasn0w_iphone4_02_0804.jpg" alt="" /> <img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/08/04/ip_jc_ultrasn0w_iphone4_03_0804.jpg" alt="" /></p>
<p>第十三步：下载并安装成功后，点击“Restart SpringBoard”注销下你的iPhone即完成ultrasn0w解锁补丁的安装，此时你的iPhone就可以使用任意运营商的SIM卡</p>
<p style="margin:0;padding:0;"><img style="border:0 initial initial;margin:0;padding:0;" src="http://image.91.com/iphone.sj/2010/08/04/ip_jc_ultrasn0w_iphone4_04_0804.jpg" alt="" /></p></p>
