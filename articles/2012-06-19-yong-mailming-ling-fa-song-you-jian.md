---
layout: post
title: 用mail命令发送邮件
date: 2012-06-19 13:43
categories:
- Mac
tags:
- mac
published: true
comments: true
---
首先编辑/etc/mail.rc文件，加入：

    set from=me@wen.com
    set smtp=smtp.wen.com
    set smtp-auth-user=me@wen.com
    set smtp-auth-password=123456

#### 直接发送：

    echo "Test from mail command" | mail -s "title" xxx@gmail.com -f from@gmail.com -c contact2@gmail.com,contact3@gmail.com -b secret@gmail.com

-s指定邮件标题
-f指定发件人
-c抄送，后面是逗号连接的地址
-b密送

#### 正文在文件中：

    cat content.txt | mail -s "title" xxx@gmail.com

或

    mail -s "title" xxx@gmail.com &lt; content.txt

#### 发送附件：

    uuencode ~/Desktop/test.jpg test.jpg | mail -s "title" xxx@gmail.com

uuencode第一个参数是附件，第二个参数是附件的标题

#### 发送附件和正文：

    (cat content.txt;uuencode ~/Desktop/test.jpg test.jpg) | mail -s "title" xxx@gmail.com
