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
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString *albumsManage = [docPath stringByAppendingPathComponent:@"AlbumsManage.sqlite"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    FMDatabase *fmDatabase = [[FMDatabase alloc] initWithPath:albumsManage];
     
    if (![fileManager fileExistsAtPath:albumsManage]) {
    [fmDatabase open];
    // 创建数据库代码
    [fmDatabase executeUpdate:@"CREATE TABLE Albums (Aid INTEGER PRIMARY KEY  AUTOINCREMENT  UNIQUE , Aname VARCHAR(50) ,Acontent VARCHAR(200))"];
    [fmDatabase executeUpdate:@"CREATE TABLE Photos (Pid INTEGER PRIMARY KEY  AUTOINCREMENT  UNIQUE , Aid INTEGER ,Plongitude FLOAT ,Platitude FLOAT ,Paddress VARCHAR(350))"];
    [fmDatabase close];
    }
    [fmDatabase open];
     
    NSString *sql = [NSString stringWithFormat:@"INSERT INTO Albums (Aname, Acontent) VALUES (?, ?)"];
    [fmDatabase executeUpdate:sql, self.aName, self.aContent];// 参数可以这么写，也可以用stringWithFormat这样直接带参数得。
     
    if ([fmDatabase hadError]) {
    NSLog(@"Err %d: %@", [fmDatabase lastErrorCode], [fmDatabase lastErrorMessage]);
    }
     
    int id = 0;
    sql = [NSString stringWithFormat:@"select id from position where pid=%d and coordinate='%@'", planID, position.coordinate];
    FMResultSet *rs = [fmDatabase executeQuery:sql];
    while ([rs next]) {
    id = [rs intForColumn:@"id"];
    }
     
    [rs close];
    [fmDatabase close];
    [fmDatabase release];