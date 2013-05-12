---
layout: post
title: python中将unicode形式字符串转换为unicode编码（转）
date: 2012-09-21 22:45
categories:
- Python
tags: []
published: true
comments: true
---
原文：<http://hi.baidu.com/kanif/item/398612af052770ad29ce9d99>

在网页抓取中，经常会遇到服务器端返回的结果为unicode形式的字符串，例如 
    ["j\/\u6781\u4e50\u9662\u5973\u5b50\u9ad8\u5bee\u7269\u8bed\/16\/gokujo02_139.jpg","j\/\u6781\u4e50\u9662\u5973\u5b50\u9ad8\u5bee\u7269\u8bed\/16\/gokujo02_140.jpg"]
那么如何将这种字符换转换为真正的unicode格式呢。 主要有两种方法： 

1. 对于json字符串可使用json.loads或者cjson.decode进行解析和转换。

2. 对于非json字符串，可以自行解的unicode码后得到。

        def ustr2unicode(input):    
            end = len(input)    
            pos = 0    
            output = u""    
            while pos < end:        
                if pos <= end - 6 and input[pos] == '\\' and input[pos+1] == 'u':            
                    output += unichr(int(input[pos+2:pos+6], 16))            
                    pos = pos + 6        
                else:            
                    output += unicode(input[pos])            
                    pos += 1    
            return output