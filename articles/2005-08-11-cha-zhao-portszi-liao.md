---
layout: post
title: 查找ports资料
date: 2005-08-11 00:32
categories:
- FreeBSD
tags: []
published: true
comments: true
---
在 /usr/ports/ 下有着几千个 ports 的安装资料，有时我们可使用以下方式来查相关的 ports.. 

以下都是在 /usr/ports/ 这个目录下执行.. 

1. 先将 ports 资料转换成一个文字文件，如 index.txt 

        # make print-index > index.txt 

2. 使用 make search key="...." 来查 

3. 将 ports 内容转换成 README.html 

        # make readmes 

用以上方法，可很容易的查到相关的 ports 资料，但很奇怪的是，为何我更新一个 ports 的资料后(或 ports tree)，为何会查不到，查到的仍然是旧的资料.. 

原来，在 /usr/ports/ 中有一个 INDEX 檔，以上的查询方式都是在这个 INDEX 档中查询，当你更新 ports 资料时，这个 INDEX 档并不会随之更新.. 

所以为了查询方便，我们需以手动的方式来做.. 

    # make index 

做完后，再更新 index.txt 及 README.html.. 

不过更新 INDEX 档需要一些时间，大约 12-30 分钟..(视计算机等级而定). 