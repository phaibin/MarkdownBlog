---
layout: post
title: respond_to
date: 2012-03-08 16:09
categories:
- RoR
tags: []
published: true
comments: true
---
在Rails的action里面根据请求的格式返回不同的格式，代码是这么写的：

    respond_to do |format|     
      format.html
      format.json { render :json => @people.to_json }      
      format.xml { render :xml => @people.to_xml }    
    end

那怎么判断客户端请求的格式呢？原来在请求的HTTP头有一个字段Accept，就是根据这个字段的值来判断的。比如把这个字段的值设为"application/json"，这样请求的就是json格式的数据。
