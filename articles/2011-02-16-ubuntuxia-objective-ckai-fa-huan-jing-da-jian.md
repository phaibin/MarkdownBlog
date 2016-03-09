---
layout: post
title: Ubuntu下Objective-C开发环境搭建
date: 2011-02-16 04:40
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>1）安装gnustep-devel,，打开新立得软件包管理器，搜索gnustep- devel，安装</p>  <p>2）配置gnustep-make的环境变量，打开.bashrc文件，最后面加入如下配置：</p>  <p>#set GNUstep   <br />GNUSTEP_ROOT=/usr/share/GNUstep    <br />export GNUSTEP_ROOT    <br />source /usr/share/GNUstep/Makefiles/GNUstep.sh</p>  <p>如果不加入上面的配置的话，在编译objective-c源文件的时候会提示/common.make,/tool.make找不到</p>  <p>3）写一个简单的Hello World程序</p>  <p>4)然后在这个目录里面创建一个空文件，不需要任何文件类型，但是名字必须是GNUmakefile，内容如下：</p>  <p>include $(GNUSTEP_MAKEFILES)/common.make</p>  <p>TOOL_NAME = LogTest   <br />LogTest_OBJC_FILES = source.m</p>  <p>include $(GNUSTEP_MAKEFILES)/tool.make</p>  <p>这里的LogTest可以换成任务名字，代表编译之后的可执行文件名，只要两个地方统一就好了，source.m是你刚刚保存好的原文件名，换成你自己 的，这里的$(GNUSTEP_MAKEFILES)引用的是我们设置好的gnustep-make的path,所以没有第2步的设置，这里是找不到对应 的目录的。</p>  <p>5）写好这个文件后，在终端进入这个目录，然后执行make,如果一切没问题的话，目录中就会多出来一个obj目录，里面是编译好的可执行文件。</p>  <p>6）再执行./obj/LogTest，就可以看到运行的结果了，这里的LogTest注意，和上面对应，当然可以换成你自己的</p></p>
