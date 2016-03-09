---
layout: post
title: Textmate调试Python
date: 2011-08-11 01:57
categories:
- Python
tags: []
published: true
comments: true
---
要让Textmate调试Python的时候在光标停在编辑器里面，类似XCode的效果，需要安装PdbTextMateSupport。方法是：

    sudo easy_install PdbTextMateSupport

这会安装相关的模块。然后你需要让pdb知道Textmate，这命令行运行：

    pdbtmsupport enable

这个命令的原理是建立~/.pdbrc文件，然后在里面加入：

    from PdbTextMateSupport import preloop, precmd
    pdb.Pdb.preloop = preloop
    pdb.Pdb.precmd = precmd

但是我之后调试出错，在这个文件前面加上"import pdb"就好了。

然后在Textmate里面设置，勾选“Highlight current line”。


