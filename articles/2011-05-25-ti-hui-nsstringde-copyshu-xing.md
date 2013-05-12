---
layout: post
title: 体会NSString的copy属性
date: 2011-05-25 04:35
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p style="font:14px 'Heiti SC Light';color:#444444;margin:0;">规范上NSString做属性都是写成copy的，理论上应该是复制了字符串而不是单纯的增加引用计数，其实问题只会出现在把NSMutableString赋值给NSString的时候。</p>
<p style="font:12px Monaco;margin:0;"><span><br /></span></p>
<p style="font:12px Monaco;margin:0;">@interface Demo : NSObject</p>
<p style="font:12px Monaco;margin:0;">{</p>
<p style="font:12px Monaco;margin:0;"><span> </span>NSString  *retainString;</p>
<p style="font:12px Monaco;margin:0;"><span> </span>NSString *copyString;</p>
<p style="font:12px Monaco;margin:0;">}</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">@property (nonatomic, retain)NSString *retainString;</p>
<p style="font:12px Monaco;margin:0;">@property (nonatomic, copy)NSString *copyString;</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">@end</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">@implementation Demo</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">@synthesize retainString;</p>
<p style="font:12px Monaco;margin:0;">@synthesize copyString;</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">-(void)dealloc</p>
<p style="font:12px Monaco;margin:0;">{</p>
<p style="font:12px Monaco;margin:0;"><span> </span>[retainString release];</p>
<p style="font:12px Monaco;margin:0;"><span> </span>[copyString release];</p>
<p style="font:12px Monaco;margin:0;"><span> </span>[super dealloc];</p>
<p style="font:12px Monaco;margin:0;">}</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">@end</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:12px Monaco;margin:0;">Demo *o  = [[Demo  alloc] init];</p>
<p style="font:12px Monaco;margin:0;">NSMutableString *s1 = [[NSMutableString  alloc] initWithCapacity:100];</p>
<p style="font:12px Monaco;margin:0;">[s1 setString"fuckyou"];</p>
<p style="font:12px Monaco;margin:0;">o.retainString =  s1;</p>
<p style="font:12px Monaco;margin:0;">o.copyString  = s1;</p>
<p style="font:12px Monaco;margin:0;">NSLog(@"retain  string  is %@",  o.retainString);</p>
<p style="font:12px Monaco;margin:0;">NSLog(@"copy string is  %@", o.copyString);</p>
<p style="font:12px Monaco;margin:0;">[s1 setString"fuckme"];</p>
<p style="font:12px Monaco;margin:0;">NSLog(@"retain string  is %@", o.retainString);</p>
<p style="font:12px Monaco;margin:0;">NSLog(@"copy string is %@", o.copyString);</p>
<p style="font:12px Monaco;margin:0;"> </p>
<p style="font:14px 'Heiti SC Light';color:#444444;margin:0;">这样就可以看出，当使用<span style="font:14px Tahoma;">retain</span>方式的时候，<span style="font:14px Tahoma;">NSMutableString</span>的内容变化时，语义上应该不可变的<span style="font:14px Tahoma;">NSString</span>也变化了，而用<span style="font:14px Tahoma;">copy</span>则是始终保持赋值时的内容。</p></p>
