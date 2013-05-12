---
layout: post
title: 让Django自带的服务器输出SQL语句的方法
date: 2012-07-31 17:53
categories:
- Python
tags:
- django
- python
published: true
comments: true
---
修改settings.py里面的LOGGING，加入：
    LOGGING = {
        ...
        'handlers': {
            ...
            'console': {
                'level': 'DEBUG',
                'class': 'logging.StreamHandler',
            },
            ...
        },
        ...
        'loggers': {
            ...
            'django.db.backends': {
                'level': 'DEBUG',
                'handlers': ['console'],
            },
            ...
        },
        ...
    }
