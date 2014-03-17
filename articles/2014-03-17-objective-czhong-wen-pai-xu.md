---
title: Objective-C中文排序
date: 2014-03-17 10:25
---
如果数组里面保存的是NSString，一般的排序方式：

    [self.contacts sortedArrayUsingSelector:@selector(compare:)];

但是这对于中文不起作用。另外NSString里面还有一个localizedCompare:方法，这个方法也不行，貌似是按照笔画方法排序。

在Google上搜索了一圈，很多都是中文首字母排序，这个算法还比较简单。但是对于通讯录就不太好了，我希望当第一个字母相同的时候继续按第二个字母排序。

另外一个算法是收集把一些常用字的全拼，然后把要排序的字符串转换为全拼，再对全拼进行排序。虽然发明这个算法的人真的很辛苦，但是不得不说这个算法真的太傻了。如果有没有覆盖到的字就没有办法了。

最后终于让我发现了一个正确的算法：<http://www.lowxp.com/g/article/detail/248>，完全不需要转换为拼音。我就觉得Objective-C不会这么傻的。两个中文字符串比较的关键代码就是：

    static NSStringCompareOptions comparisonOptions = NSNumericSearch;
    NSLocale *locale=[[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    NSRange string1Range = NSMakeRange(0, [string1 length]);
    return [string1 compare:string2
                    options:comparisonOptions
                      range:string1Range
                     locale:(NSLocale *)locale];

另外如果一个数组保存的是自定义的对象，希望按照对象的一个字段来排序，需要这么写：

    myArray.sortDescriptors = @[
      [NSSortDescriptor sortDescriptorWithKey:@"fullName" ascending:YES comparator:^NSComparisonResult(id obj1, id obj2) {
          ...
      }]];

