---
title: "判断NSString中是否有汉字"
date: 2014-03-07 17:25
---
    NSString *str = @"i'm a 苹果。...";
    for(int i=0; i< [str length];i++) {
      int a = [str characterAtIndex:i];
      if(a > 0x4e00 && a < 0x9fff)
        NSLog(@"汉字");
    }

