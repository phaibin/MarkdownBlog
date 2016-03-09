---
layout: post
title: iphone缓存的一种策略
date: 2011-11-10 01:46
categories:
- iphone
tags:
- iphone
- 缓存
published: true
comments: true
---
第一部分，直到数据被请求时才将数据加载到内存

    - (id)retriveObjectNamed:(NSString *)someKey 
    { 
    	id object = [self.myCache objectForKey:someKey];
    	if (!object) {
    		object= [self loadObjectNamed:someKey];
    		[self.myCache setObject:object forKey:someKey];
    	}
    	return object;
    }

缓存的第二个职责是当应用程序遇到低内存状况时能够自我清除

    - (void)respondToMemoryWarning
    {
    	[self.myCache removeAllObjects];
    }
