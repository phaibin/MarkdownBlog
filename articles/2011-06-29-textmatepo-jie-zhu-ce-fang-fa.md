---
layout: post
title: TextMate破解注册方法
date: 2011-06-29 12:12
categories:
- 生活
tags: []
published: true
comments: true
---
原文：[http://zd5.org/2010/09/23/textmate-1-5-9-破解注册方法/](http://zd5.org/2010/09/23/textmate-1-5-9-破解注册方法/)

TextMate 在 Mac OS X 下被奉为编辑器中的首选。

安装破解步骤：

1. 软件下载：
TextMate 1.5.9 官方下载地址  http://macromates.com/
0xED 官方下载地址 http://www.suavetech.com/0xed/0xed.html

2. 打开terminal，找到 Applications/TextMate.app/Contents/MacOS/TextMate文件。将该文件复制到documents下面以便下一步修改。命令如下：

    cp /applications/textmate.app/contents/macos/textmate users/XXX/documents
    (XXX: 代表你的用户名)

3. 启动 0xED Mac 十六进制的编辑器，然后用 0xED 打开 documents 下的文件 textmate，找到里面所有的年份日期并修改，然后保存。（我使用的是最新版TextMate1.5.9, 故将文件里所有的2009改为了2099, 里边有4个2009）

4. 将原本的Applications/TextMate.app/Contents/MacOS/TextMate文件删除，命令如下：

    rm /applications/textmate.app/contents/macos/textmate

    然后将你修改了的documents下的TextMate文件复制回原来的地方，命令如下：

    cp /users/XXX/documents/textmate /applications/textmate.app/contents/macos   

    关闭 terminal(终端)。

5. 打开 TextMate 程序，输入如下注册信息：

        user: handholder crakced you

        code: DKFTCCXCMWOX35TZKPRN5YNR2NYUTJJAY52VHWKX2H5URTUB72KW- RCRTQJCC2ZZV5BTHSKCNQXTAOSGSLN46V3E7NIJKDBLRDY37NRVD- IXQWZ5SVPHBN67JZDZTTAQ6MS4ROVXRCGDZGKGE2VGOGHEYMPRGY- O5Y243GTBKPZLPP55QSBIHR6MDEUBMVQT4Q3SESPWETRG6PJM

    之后再打开 TextMate －> Registration，可以看到已经成功注册。