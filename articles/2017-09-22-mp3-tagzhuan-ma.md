---
title: MP3 Tag转码
date: 2017-09-22 09:51
---
最近终于想起来把以前收集的老歌copy到iCloud Drive里面，这样在公司也可以听了。但是这些歌拖到iTunes里面很多显示的都是乱码。这是因为这些歌都是很早在Windows上面下载的，所用的ID3 Tag都是gb2312编码的。以前在Windows上面听歌喜欢用Winamp，里面有一个功能可以批量移除MP3的ID3，这样只要保证文件名正确就可以了。但是iTunes里面是没有这种功能的。

Google了一下，居然有一个很好用的工具，看来这种问题由来已久。

这个工具叫[Mutagen](https://mutagen.readthedocs.io/en/latest/)，只需要这么安装：`pip install mutagen`。

其中有一个`mid3iconv`命令，可以把ID3 Tag转码。切换到mp3目录下面，执行：

    find . -execdir mid3iconv -e GBK "{}" \;

就可以批量转码了。`-e`是指定tag的原始编码。
