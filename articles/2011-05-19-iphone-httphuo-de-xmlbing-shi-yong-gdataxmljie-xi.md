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
    NSURL *url = [NSURL URLWithString:
    @"http://www.raywenderlich.com/downloads/Party.xml"];
     
    NSMutableURLRequest* request = [NSMutableURLRequest new];
    [request setURL:url];
    [request setHTTPMethod:@"GET"];
     
    NSHTTPURLResponse* response;
    NSData* data = [NSURLConnection sendSynchronousRequest:request
    returningResponse:&response
    error:nil];
     
    NSString* responseXMLResult = [[NSString alloc] initWithData:data
    encoding: CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000)];
     
     
     
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithXMLString: responseXMLResult
    options:0 error:&error];
     
     
    if (doc == nil) { return; }
     
    NSLog(@"LOG=%@", [[NSString alloc] initWithData:doc.XMLData encoding:NSUTF8StringEncoding]);
    //NSLog(@"%@", doc.rootElement.XMLString);
     
    NSMutableString *resultString = [[NSMutableString alloc] initWithString:@"XML数据内容: n"];
     
    //NSArray *partyMembers = [doc.rootElement elementsForName:@"Player"];
    NSArray *partyMembers = [doc.rootElement nodesForXPath:@"//Party/Player" error:nil];
    for (GDataXMLElement *partyMember in partyMembers) {
     
    NSString *_name;
    NSString *_level;
    NSString *_class;
     
    // Name
    //NSArray *names = [partyMember elementsForName:@"Name"];
    NSArray *names = [partyMember nodesForXPath:@"Name" error:nil];
    if (names.count > 0) {
    GDataXMLElement *firstName = (GDataXMLElement *) [names objectAtIndex:0];
    _name = firstName.XMLString;
    } else continue;
     
    // Level
    NSArray *levels = [partyMember elementsForName:@"Level"];
    if (levels.count > 0) {
    GDataXMLElement *firstLevel = (GDataXMLElement *) [levels objectAtIndex:0];
    _level = firstLevel.stringValue;
    } else continue;
     
    // Class
    NSArray *classes = [partyMember elementsForName:@"Class"];
    if (classes.count > 0) {
    GDataXMLElement *firstClass = (GDataXMLElement *) [classes objectAtIndex:0];
    _class = firstClass.stringValue;
     
    } else continue;
     
    [resultString appendFormat:@"Name=%@",_name ];
    [resultString appendFormat:@" Level=%@",_level ];
    [resultString appendFormat:@" Class=%@n",_class ];
     
     
    }
     
     
    //textView.text = [[NSString alloc] initWithData:doc.XMLData encoding:NSUTF8StringEncoding];
    textView.text = resultString;
    [url release];
    [doc release];