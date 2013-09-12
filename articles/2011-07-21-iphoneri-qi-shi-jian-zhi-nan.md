---
layout: post
title: iphone日期时间指南
date: 2011-07-21 09:34
categories:
- iphone
tags:
- iphone
- NSDate
published: true
comments: true
---
主要有3个类：

NSDate：表示一个绝对的时间点

NSCalendar：允许你展示一个特殊的日历，比如Gregorian（公历）或Hebrew历（包括中国农历），它提供了大部分的日期计算接口，并且允许你在NSDate和NSDateComponents之间转换

NSDateComponents允许你展示一个特殊日期的不同部分，比如hour，minute，day，year等等。

NSTimeZone表示时区信息

NSDateFormatter用来在日期和字符串之间转换

可以认为NSDate表示的是绝对的数值，而NSCalendar，NSTimeZone和NSDateFormatter则表示了怎么来解释这个数值。

###NSDate：

NSDate是一个抽象的概念，独立于locals，timezones和calendars，也可以认为它表示的就是公历的GMT时间（NSLog打印的时候都会显示GMT时间）。它的单位是NSTimeInterval，用秒来表示。NSDate用相对于2001年1月1日（GMT）的秒来计算时间，早于这个时间用负值来表示，晚于这个时间为正值。NSDate的方法timeIntervalSinceReferenceDate就是指相对于这个日期的秒数。

Listing 1 Creating dates with time intervals

    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *tomorrow = [[NSDate alloc]
                initWithTimeIntervalSinceNow:secondsPerDay];
    NSDate *yesterday = [[NSDate alloc]
                initWithTimeIntervalSinceNow:-secondsPerDay];
    [tomorrow release];
    [yesterday release];

Listing 2 Creating dates by adding a time interval

    NSTimeInterval secondsPerDay = 24 * 60 * 60;
    NSDate *today = [[NSDate alloc] init];
    NSDate *tomorrow, *yesterday;
     
    tomorrow = [today dateByAddingTimeInterval: secondsPerDay];
    yesterday = [today dateByAddingTimeInterval: -secondsPerDay];
    [today release];

比较时间用isEqualToDate:, compare:, laterDate:和 earlierDate:方法，两个时间之间的间隔用timeIntervalSince...方法

###NSCalendar和NSDateComponents：

Listing 3 Creating calendar objects

    NSCalendar *currentCalendar = [NSCalendar currentCalendar];
     
    NSCalendar *japaneseCalendar = [[NSCalendar alloc]
                                    initWithCalendarIdentifier:NSJapaneseCalendar];
     
    NSCalendar *usersCalendar =
                          [[NSLocale currentLocale] objectForKey:NSLocaleCalendar];

currentCalendar和usersCalendar都是用户本地的日历

Listing 4 Creating a date components object

    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setDay:6];
    [components setMonth:5];
    [components setYear:2004];
 
    NSInteger weekday = [components weekday]; // Undefined (== NSUndefinedDateComponent)

在Dates和Date Components之间转换：

Listing 5 Getting a date’s components

    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =
                        [gregorian components:(NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:today];
    NSInteger day = [weekdayComponents day];
    NSInteger weekday = [weekdayComponents weekday];

你需要用Calendar Units这个常量来指定要获取的部分。

NSCalendar的ordinalityOfUnit:inUnit:forDate:方法用来获取一个小的单位在一个大的单位里面的序数，比如你可以查看一个日期在一年中的天数。

Listing 6 Creating a date from components

    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setWeekday:2]; // Monday
    [components setWeekdayOrdinal:1]; // The first Monday in the month
    [components setMonth:5]; // May
    [components setYear:2008];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:components];

技术上来说不存在没有年的日期，如果你只想表示生日也可以不指定year：

Listing 7 Creating a yearless date

    NSDateComponents *components = [[NSDateComponents alloc] init];
    [components setMonth:11];
    [components setDay:7];
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *birthday = [gregorian dateFromComponents:components];

不过这样以后你取components的时候就要记得不能指定year。

Listing 8 Converting date components from one calendar to another

    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setDay:6];
    [comps setMonth:5];
    [comps setYear:2004];
     
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *date = [gregorian dateFromComponents:comps];
    [comps release];
    [gregorian release];
     
    NSCalendar *hebrew = [[NSCalendar alloc]
                            initWithCalendarIdentifier:NSHebrewCalendar];
    NSUInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit |
                                  NSYearCalendarUnit;
    NSDateComponents *components = [hebrew components:unitFlags fromDate:date];
     
    NSInteger day = [components day]; // 15
    NSInteger month = [components month]; // 9
    NSInteger year = [components year]; // 5764

###日期计算：

你可以用dateByAddingComponents:toDate:options:方法给一个date增加一个date的部分（比如小时或者分钟）

Listing 9 An hour and a half from now

    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
              initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];
    [offsetComponents setHour:1];
    [offsetComponents setMinute:30];
    // Calculate when, according to Tom Lehrer, World War III will end
    NSDate *endOfWorldWar3 = [gregorian dateByAddingComponents:offsetComponents
              toDate:today options:0];

Listing 10 Getting the Sunday in the current week

    NSDate *today = [[NSDate alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc]
              initWithCalendarIdentifier:NSGregorianCalendar];
     
    // Get the weekday component of the current date
    NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit
              fromDate:today];
     
    /*
    Create a date components to represent the number of days to subtract from the current date.
    The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today is Sunday, subtract 0 days.)
    */
    NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];
    [componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];
     
    NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract
              toDate:today options:0];
     
    /*
    Optional step:
    beginningOfWeek now has the same hour, minute, and second as the original date (today).
    To normalize to midnight, extract the year, month, and day components and create a new date from those components.
    */
    NSDateComponents *components =
         [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |
              NSDayCalendarUnit) fromDate: beginningOfWeek];
    beginningOfWeek = [gregorian dateFromComponents:components];

NSCalendar的rangeOfUnit:startDate:interval:forDate:方法可以按照rangeOfUnit指定的单位查找初始值，比如：

Listing 11 Getting the beginning of the week

    NSDate *today = [[NSDate alloc] init];
    NSDate *beginningOfWeek = nil;
    BOOL ok = [gregorian rangeOfUnit:NSWeekCalendarUnit startDate:&beginningOfWeek
                         interval:NULL forDate: today];

Listing 12 Getting the difference between two dates

    NSDate *startDate = ...;
    NSDate *endDate = ...;
     
    NSCalendar *gregorian = [[NSCalendar alloc]
                     initWithCalendarIdentifier:NSGregorianCalendar];
     
    NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;
     
    NSDateComponents *components = [gregorian components:unitFlags
                                              fromDate:startDate
                                              toDate:endDate options:0];
    NSInteger months = [components month];
    NSInteger days = [components day];

Listing 15 Determining whether a date is this week

    -(BOOL)isDateThisWeek:(NSDate *)date {
         NSDate *start;
         NSTimeInterval extends;
         NSCalendar *cal=[NSCalendar autoupdatingCurrentCalendar];
         NSDate *today=[NSDate date];
         BOOL success= [cal rangeOfUnit:NSWeekCalendarUnit startDate:&start
              interval: &extends forDate:today];
         if(!success)return NO;
         NSTimeInterval dateInSecs = [date timeIntervalSinceReferenceDate];
         NSTimeInterval dayStartInSecs= [start timeIntervalSinceReferenceDate];
         if(dateInSecs > dayStartInSecs && dateInSecs < (dayStartInSecs+extends)){
              return YES;
         }
         else {
              return NO;
         }
    }

###Time Zones：

time zone会影响从calendar计算的date components，你可以设置NSCalendar的time zone。NSCalendar默认使用应用程序的时区。可以从timeZoneWithName:, timeZoneWithAbbreviation:, 和 timeZoneForSecondsFromGMT:方法获取一个NSTimeZone对象。可以用[NSTimeZone knownTimeZoneNames]方法获取所有time zone的数组。

可以用setDefaultTimeZone:方法设置默认的时区，用localTimeZone方法始终返回默认的时区。

Listing 16 Creating a date from components using a specific time zone

    NSCalendar *gregorian=[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];
    [gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CDT"]];
    NSDateComponents *timeZoneComps=[[NSDateComponents alloc] init];
    [timeZoneComps setHour:16];
    //specify whatever day, month, and year is appropriate
    NSDate *date=[gregorian dateFromComponents:timeZoneComps];

###Date Formatters

有两个基本的方法：dateFromString: 和 stringFromDate:用来在日期和字符串之间转换

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [formatter dateFromString:string];
    [formatter release];

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone systemTimeZone]];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate:date];
    [formatter release];

我写的NSDate的几个方法在：<https://github.com/phaibin/MyCategories>