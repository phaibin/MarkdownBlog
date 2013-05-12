---
layout: post
title: iPhone HTTP获得XML并使用GDataXML解析
date: 2011-05-19 01:53
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#008425;"><span style="color:#713ea3;"><span style="color:#713ea3;">NSURL</span> *url = [<span style="color:#713ea3;">NSURL</span> <span style="color:#3e1f7c;">URLWithString</span>:</span></span></p>
<p style="font:normal normal normal 11px/normal Menlo;color:#d12c26;margin:0;padding:0;"><span style="color:#000000;"> </span> @"http://www.raywenderlich.com/downloads/Party.xml"<span style="color:#000000;">];</span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#713ea3;margin:0;padding:0;">NSMutableURLRequest<span style="color:#000000;">* request = [</span>NSMutableURLRequest <span style="color:#3e1f7c;">new</span><span style="color:#000000;">]; </span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[request <span style="color:#3e1f7c;">setURL</span>:url];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[request <span style="color:#3e1f7c;">setHTTPMethod</span>:<span style="color:#d12c26;">@"GET"</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#713ea3;margin:0;padding:0;">NSHTTPURLResponse<span style="color:#000000;">* response; </span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSData</span>* data = [<span style="color:#713ea3;">NSURLConnection</span> <span style="color:#3e1f7c;">sendSynchronousRequest</span>:request</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#3e1f7c;">returningResponse</span>:&amp;response</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#3e1f7c;">error</span>:<span style="color:#bb2d9d;">nil</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSString</span>* responseXMLResult = [[<span style="color:#713ea3;">NSString</span> <span style="color:#3e1f7c;">alloc</span>] <span style="color:#3e1f7c;">initWithData</span>:data</p>
<p style="font:normal normal normal 11px/normal Menlo;color:#3e1f7c;margin:0;padding:0;">encoding<span style="color:#000000;">:</span> CFStringConvertEncodingToNSStringEncoding<span style="color:#000000;">(</span>kCFStringEncodingGB_18030_2000<span style="color:#000000;">)]; </span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSError</span> *error;</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#4e8186;">GDataXMLDocument</span> *doc = [[<span style="color:#4e8186;">GDataXMLDocument</span> <span style="color:#3e1f7c;">alloc</span>] <span style="color:#31595d;">initWithXMLString</span>: responseXMLResult</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#31595d;">options</span>:<span style="color:#2c2ecf;">0</span> <span style="color:#31595d;">error</span>:&amp;error];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#bb2d9d;">if</span> (doc == <span style="color:#bb2d9d;">nil</span>) { <span style="color:#bb2d9d;">return</span>; }</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#3e1f7c;margin:0;padding:0;">NSLog<span style="color:#000000;">(</span><span style="color:#d12c26;">@"LOG=%@"</span><span style="color:#000000;">, [[</span><span style="color:#713ea3;">NSString</span> alloc<span style="color:#000000;">]</span> initWithData<span style="color:#000000;">:doc.XMLData</span> encoding<span style="color:#000000;">:</span>NSUTF8StringEncoding<span style="color:#000000;">]);</span></p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">//NSLog(@"%@", doc.rootElement.XMLString);</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#713ea3;margin:0;padding:0;">NSMutableString <span style="color:#000000;">*resultString = [[</span>NSMutableString <span style="color:#3e1f7c;">alloc</span><span style="color:#000000;">]</span> <span style="color:#3e1f7c;">initWithString</span><span style="color:#000000;">:</span><span style="color:#d12c26;">@"XML</span><span style="font:normal normal normal 11px/normal 'Heiti sC Light';color:#d12c26;">数据内容</span><span style="color:#d12c26;">: n"</span><span style="color:#000000;">];</span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">//NSArray *partyMembers = [doc.rootElement elementsForName:@"Player"];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSArray</span> *partyMembers = [doc.rootElement <span style="color:#31595d;">nodesForXPath</span>:<span style="color:#d12c26;">@"//Party/Player"</span> <span style="color:#31595d;">error</span>:<span style="color:#bb2d9d;">nil</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#bb2d9d;">for</span> (<span style="color:#4e8186;">GDataXMLElement</span> *partyMember <span style="color:#bb2d9d;">in</span> partyMembers) {</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSString</span> *_name;</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSString</span> *_level;</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSString</span> *_class;</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">// Name</p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">//NSArray *names = [partyMember elementsForName:@"Name"];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSArray</span> *names = [partyMember <span style="color:#31595d;">nodesForXPath</span>:<span style="color:#d12c26;">@"Name"</span> <span style="color:#31595d;">error</span>:<span style="color:#bb2d9d;">nil</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#bb2d9d;">if</span> (names.<span style="color:#713ea3;">count</span> &gt; <span style="color:#2c2ecf;">0</span>) {</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#4e8186;">GDataXMLElement</span> *firstName = (<span style="color:#4e8186;">GDataXMLElement</span> *) [names <span style="color:#3e1f7c;">objectAtIndex</span>:<span style="color:#2c2ecf;">0</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">_name = firstName.XMLString;</p>
<p style="font:normal normal normal 11px/normal Menlo;color:#bb2d9d;margin:0;padding:0;"><span style="color:#000000;">}</span> else continue<span style="color:#000000;">;</span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">// Level</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSArray</span> *levels = [partyMember <span style="color:#31595d;">elementsForName</span>:<span style="color:#d12c26;">@"Level"</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#bb2d9d;">if</span> (levels.<span style="color:#713ea3;">count</span> &gt; <span style="color:#2c2ecf;">0</span>) {</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#4e8186;">GDataXMLElement</span> *firstLevel = (<span style="color:#4e8186;">GDataXMLElement</span> *) [levels <span style="color:#3e1f7c;">objectAtIndex</span>:<span style="color:#2c2ecf;">0</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">_level = firstLevel.stringValue;</p>
<p style="font:normal normal normal 11px/normal Menlo;color:#bb2d9d;margin:0;padding:0;"><span style="color:#000000;">}</span> else continue<span style="color:#000000;">;</span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">// Class</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#713ea3;">NSArray</span> *classes = [partyMember <span style="color:#31595d;">elementsForName</span>:<span style="color:#d12c26;">@"Class"</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#bb2d9d;">if</span> (classes.<span style="color:#713ea3;">count</span> &gt; <span style="color:#2c2ecf;">0</span>) {</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#4e8186;">GDataXMLElement</span> *firstClass = (<span style="color:#4e8186;">GDataXMLElement</span> *) [classes <span style="color:#3e1f7c;">objectAtIndex</span>:<span style="color:#2c2ecf;">0</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">_class = firstClass.stringValue;</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#bb2d9d;margin:0;padding:0;"><span style="color:#000000;">}</span> else continue<span style="color:#000000;">;</span></p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[resultString <span style="color:#3e1f7c;">appendFormat</span>:<span style="color:#d12c26;">@"Name=%@"</span>,_name ];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[resultString <span style="color:#3e1f7c;">appendFormat</span>:<span style="color:#d12c26;">@" Level=%@"</span>,_level ];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[resultString <span style="color:#3e1f7c;">appendFormat</span>:<span style="color:#d12c26;">@" Class=%@n"</span>,_class ];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">}</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"> </p>
<p style="font:normal normal normal 11px/normal Menlo;color:#008425;margin:0;padding:0;">//textView.text = [[NSString alloc] initWithData:doc.XMLData encoding:NSUTF8StringEncoding];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;"><span style="color:#4e8186;">textView</span>.<span style="color:#713ea3;">text</span> = resultString;</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[url <span style="color:#3e1f7c;">release</span>];</p>
<p style="font:normal normal normal 11px/normal Menlo;margin:0;padding:0;">[doc <span style="color:#3e1f7c;">release</span>];</p></p>
