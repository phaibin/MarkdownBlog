---
layout: post
title: 用nginx+uwsgi部署Django网站
date: 2012-08-29 16:23
categories:
- Python
tags:
- django
- nginx
- uwsgi
published: true
comments: true
---
1. 安装uwsgi：`pip install uwsgi`或`brew install uwsgi`

    在我的机器上安装出错，找了下面的命令才能装好：

        CFLAGS="-Os -w -pipe -march=core2 -msse4 -arch x86_64" LDFLAGS="-arch x86_64" pip install uwsgi

    并且在virtualenv和外面环境中的uwsgi似乎冲突，只能在一个环境中安装

2. 在项目下建立一个wsgi.py文件，内容为：

        import osos.environ.setdefault("DJANGO_SETTINGS_MODULE", "my_hrms.settings")
        from django.core.wsgi import get_wsgi_applicationapplication = get_wsgi_application()

3. 在项目下建立一个uwsgi.ini文件，内容为：

        [uwsgi]
        # set the http porthttp = :9090
        socket = /tmp/django.sock
        # change to django project directory
        chdir = /Users/leon/Desktop/Python
        # load django
        module = my_hrms.wsgi:application
        home = /Users/leon/.virtualenvs/devlopment
        pythonpath = /Users/leon/Desktop/Python/my_hrms

    http是运行的端口，如果和nginx搭配也可以不写，chdir是项目所在的目录，module是项目里面的wsgi模块，home是virtualenv的目录，pythonpath用来加入项目目录到python path中。

4. 运行`uwsgi --ini uwsgi.ini`来启动uwsgi，打开浏览器输入localhost:9090就可以访问你的网站

5. 安装nginx：`brew install nginx`

6. 打开`/usr/local/etc/nginx/nginx.conf`文件加入：

        location / {     
          uwsgi_pass unix:///tmp/django.sock;     
          include uwsgi_params; 
        }

    uwsgi_pass的参数跟uwsgi的socket一致。

7. 在命令行输入nginx启动nginx

8. 打开浏览器，输入localhost:8080就可以通过uwsgi来处理网站请求

参考：

<http://blog.naver.com/PostView.nhn?blogId=ez_&logNo=140149955374>

<http://obmem.info/?p=703>

<http://studio.zeuik.com/?p=791>
