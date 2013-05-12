---
layout: post
title: 如何在eclipse中安装pydev插件
date: 2006-03-11 09:45
categories:
- Python
tags: []
published: true
comments: true
---
<p><p>从<a href="http://pydev.sourceforge.net/download.html">http://pydev.sourceforge.net/download.html</a>上下载到pydev，解压．</p>
<p>将解压后features目录下的一个文件夹拷到c:eclipse目录下的features目录下,将plugins目录下的三个文件夹手到c:eclipse目录下的plugins目录下,运行c:eclipse的eclipse.exe．</p>
<p>进入eclipse后,选择'help'（帮助）&gt;&gt;'software updates'（软件更新）&gt;&gt;'manage configuration...'（管理配置）,打开后点&quot;file&quot;下面的第三个图标,使它和前面两个图标一样成凹下状,这时在左下面可以看见多出了一个分支,叫&quot;org.python.pydev.feature &quot;,选中它,点右边窗口Available Tasks下面的&quot;Enable&quot;,这时就会让你重启eclipse,重启之后就可以了．</p>
<p>也可以通过选择'help'（帮助）&gt;&gt;'software updates'（软件更新）&gt;&gt;Find and Insatll&gt;&gt;Search for new Feature to Install下一中添加一个New Remote Site为<a href="http://pydev.sf.net/updates/">http://pydev.sf.net/updates/</a> ,然后就可以点击下一步自动升级了,这个是直接从网站上下载安装的</p>
<br />
<p>&nbsp;</p>
<h3>Installing with the update site</h3>
<p> To install Pydev and Pydev Extensions from the Eclipse Update Manager, you need to go to the install menu: </p>
<br />
<p align="center"><img border="1" src="http://www.fabioz.com/pydev/images/install_menu.png" alt="" /></p>
<br />
<p>Then select 'Search for new features for install' (You will follow the same path even if you already have an older version installed).</p>
<br />
<p align="center"><img border="1" src="http://www.fabioz.com/pydev/images/install_select_new.png" alt="" /></p>
<br />
<p>In the next screen (below), click 'new remote site'</p>
<br />
<p align="center"><img border="1" src="http://www.fabioz.com/pydev/images/update_sites.png" alt="" /></p>
<br />
<p>Set the 'Pydev Extensions' update site: http://www.fabioz.com/pydev/updates 	<br /><br /> 	<strong>NOTE:</strong> if you currently have the sourceforge update site, you're advised to remove it (some 	reports pointed to some problems when having both).<br /><br /> 	<strong>NOTE:</strong> The only difference between the sourceforge update site and this one is that the one at sourceforge only contains 	the Pydev 'Open Source' version, and this one contains both. </p>
<br />
<p align="center"><img border="1" src="http://www.fabioz.com/pydev/images/update_address.png" alt="" /></p>
<br />
<p>Click 'Finish'. You should be presented with the screen below:</p>
<br />
<p align="center"><img border="1" src="http://www.fabioz.com/pydev/images/found_features.png" alt="" /></p>
<br />
<p>Select both features and click 'next'...  	<br /><br /> 	<strong>NOTE:</strong> if the features do not appear to you, you should restart Eclipse and try again (that's because 	Eclipse caches the results, and sometimes it may have the wrong version in its cache -- which is only cleared when you  	restart Eclipse). </p>
<br />
<p align="center"><img border="1" src="http://www.fabioz.com/pydev/images/update_license.png" alt="" /></p>
<br />
<p>Now, you'll have to accept the license, click 'next' and in the next screen, review it and click 'finish'. Eclipse should automatically download the plugin contents and present you to a dialog asking if you want to restart (to which you should say <strong>yes</strong>).</p>
<h3>Installing with the zip file</h3>
<p>After downloading the zip file (from <a href="http://www.fabioz.com/pydev/zips">http://www.fabioz.com/pydev/zips</a>), you have to extract it  yourself on top of Eclipse. If you choose to do it, just make sure the plugins folder  is extracted on top of the Eclipse plugins folder. After that, restart it with the '-clean' flag, to make sure Eclipse finds out about it.</p>
<h3>Checking the installation</h3>
<p> You can verify if it is correctly installed going to the menu <strong>'help &gt; about &gt; plug in details'</strong> and  checking if there are at least 5 plugins with the 'plug-in Id' starting with <strong>'com.python.pydev'</strong> and at least other 5 starting with  <strong>'org.python.pydev'</strong> (and check if they have the version you got). </p>
<h3>Uninstalling</h3>
<p> If at any time you wish to stop using the Pydev extensions plugin (or any other Eclipse plugin), you can disable it by going to the menu <strong>'help &gt; software updates &gt; manage configuration'</strong>, selecting the plugin and clicking 'disable', then, you have to restart Eclipse, go to the same place again and then click on 'remove' (note that you have a button in the menu that enables you to see the 'disabled' features. </p>
<br />
<h3>Most commom problems</h3>
<p>  <strong>Corrupted install:</strong> Eclipse sometimes is not able to correctly get the plugin, but will do no checking 	on whether it is really correct (no md5 checking), and when this happens, you'll usually get a ClassNotFoundException 	(similar to the example below).  <br /><br />  	When that happens, <strong>you should uninstall it and reinstall again</strong> with the update site...  	if that still fails, you could try to get the zip files, as it will at least give you a warning when it is corrupt. 	 	<br /> 	<br /> 	-- the chance of the files being corrupt in the server is pretty low, as that's something that's always checked  	in a new release -- but if you're suspicious about it, please contact me, so that I can double-check it.  <br /><br />  	Also, there have been reports with that error where the only solution that 	has been consistent has been <strong>removing all</strong> previous versions of pydev and then installing  	the latest version. 	 <br /><br /> <strong>EXAMPLE</strong><br /> Unable to create this part due to an internal error. Reason for the failure: The editor class could not be instantiated. This usually indicates that the editor's class name was mistyped in plugin.xml. <br /><br />   java.lang.ClassNotFoundException: org.python.pydev.editor.PyEdit <br /> at org.eclipse.osgi.framework.internal.core.BundleLoader.findClass(BundleLoader.java:405)       <br /> at org.eclipse.osgi.framework.internal.core.BundleLoader.findClass(BundleLoader.java:350)<br /> at org.eclipse.osgi.framework.adaptor.core.AbstractClassLoader.loadClass(AbstractClassLoader.java:78)<br /> at java.lang.ClassLoader.loadClass(ClassLoader.java:235)       <br /> at org.eclipse.osgi.framework.internal.core.BundleLoader.loadClass(BundleLoader.java:275)<br /> ... 	 </p></p>
