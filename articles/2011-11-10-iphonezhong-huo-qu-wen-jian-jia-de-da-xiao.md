---
layout: post
title: iphone中获取文件夹的大小
date: 2011-11-10 08:49
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
因为iphone上面只能获取文件夹节点的大小，不能获取占磁盘的大小，只能通过遍历所有文件来计算，这样计算的结果可能跟在finder中看到的结果有一点出入。返回的结果以字节计算。

    - (unsigned long long) folderSize:(NSString *)folder {
        NSFileManager *_manager = [NSFileManager defaultManager];
        NSArray *_cacheFileList;
        NSEnumerator *_cacheEnumerator;
        NSString *_cacheFilePath;
        unsigned long long _cacheFolderSize = 0;
        
        _cacheFileList = [_manager subpathsAtPath:folder];
        _cacheEnumerator = [_cacheFileList objectEnumerator];
        while (_cacheFilePath = [_cacheEnumerator nextObject]) {
            NSDictionary *_cacheFileAttributes = [_manager attributesOfItemAtPath:[folder stringByAppendingPathComponent:_cacheFilePath] error:nil];
            _cacheFolderSize += [_cacheFileAttributes fileSize];
        }
        
        return _cacheFolderSize;
    }
