---
layout: post
title: FMDB操作
date: 2011-07-07 01:11
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>
<p>NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];</p>
<p>NSString *albumsManage = [docPath stringByAppendingPathComponent:@"AlbumsManage.sqlite"];</p>
<p>NSFileManager *fileManager = [NSFileManager defaultManager];</p>
<p>FMDatabase *fmDatabase = [[FMDatabase alloc] initWithPath:albumsManage];</p>
<p> </p>
<p>if (![fileManager fileExistsAtPath:albumsManage]) {</p>
<p>[fmDatabase open];</p>
<p>// 创建数据库代码</p>
<p>[fmDatabase executeUpdate:@"CREATE TABLE Albums (Aid INTEGER PRIMARY KEY  AUTOINCREMENT  UNIQUE , Aname VARCHAR(50) ,Acontent VARCHAR(200))"];</p>
<p>[fmDatabase executeUpdate:@"CREATE TABLE Photos (Pid INTEGER PRIMARY KEY  AUTOINCREMENT  UNIQUE , Aid INTEGER ,Plongitude FLOAT ,Platitude FLOAT ,Paddress VARCHAR(350))"];</p>
<p>[fmDatabase close];</p>
<p>}</p>
<p>[fmDatabase open];</p>
<p> </p>
<p>NSString *sql = [NSString stringWithFormat:@"INSERT INTO Albums (Aname, Acontent) VALUES (?, ?)"];</p>
<p>[fmDatabase executeUpdate:sql, self.aName, self.aContent];// 参数可以这么写，也可以用stringWithFormat这样直接带参数得。</p>
<p> </p>
<p>if ([fmDatabase hadError]) {</p>
<p>NSLog(@"Err %d: %@", [fmDatabase lastErrorCode], [fmDatabase lastErrorMessage]);</p>
<p>}</p>
<p> </p>
<p>int id = 0;</p>
<p>sql = [NSString stringWithFormat:@"select id from position where pid=%d and coordinate='%@'", planID, position.coordinate];</p>
<p>FMResultSet *rs = [fmDatabase executeQuery:sql];</p>
<p>while ([rs next]) {</p>
<p>id = [rs intForColumn:@"id"];</p>
<p>}</p>
<p> </p>
<p>[rs close];</p>
<p>[fmDatabase close];</p>
<p>[fmDatabase release];</p>
</p></p>
