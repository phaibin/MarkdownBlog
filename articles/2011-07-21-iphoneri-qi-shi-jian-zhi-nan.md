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
<p><p>主要有3个类：</p>
<p>NSDate：表示一个绝对的时间点</p>
<p>NSCalendar：允许你展示一个特殊的日历，比如Gregorian（公历）或Hebrew历（包括中国农历），它提供了大部分的日期计算接口，并且允许你在NSDate和NSDateComponents之间转换</p>
<p>NSDateComponents允许你展示一个特殊日期的不同部分，比如hour，minute，day，year等等。</p>
<p>NSTimeZone表示时区信息</p>
<p>NSDateFormatter用来在日期和字符串之间转换</p>
<p>可以认为NSDate表示的是绝对的数值，而NSCalendar，NSTimeZone和NSDateFormatter则表示了怎么来解释这个数值。</p>
<p style="font-size: 15px;"><strong>NSDate：</strong></p>
<p>NSDate是一个抽象的概念，独立于locals，timezones和calendars，也可以认为它表示的就是公历的GMT时间（NSLog打印的时候都会显示GMT时间）。它的单位是NSTimeInterval，用秒来表示。NSDate用相对于2001年1月1日（GMT）的秒来计算时间，早于这个时间用负值来表示，晚于这个时间为正值。NSDate的方法timeIntervalSinceReferenceDate就是指相对于这个日期的秒数。</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 1</strong> Creating dates with time intervals</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1205px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSTimeInterval secondsPerDay = 24 * 60 * 60;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *tomorrow = [[NSDate alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">            initWithTimeIntervalSinceNow:secondsPerDay];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *yesterday = [[NSDate alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">            initWithTimeIntervalSinceNow:-secondsPerDay];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[tomorrow release];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[yesterday release];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 2</strong> Creating dates by adding a time interval</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1205px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSTimeInterval secondsPerDay = 24 * 60 * 60;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *today = [[NSDate alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *tomorrow, *yesterday;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">tomorrow = [today dateByAddingTimeInterval: secondsPerDay];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">yesterday = [today dateByAddingTimeInterval: -secondsPerDay];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[today release];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>比较时间用<code style="font-size: 13px; font-family: Courier, Consolas, monospace; color: #666666;">isEqualToDate:</code>, <code style="font-size: 13px; font-family: Courier, Consolas, monospace; color: #666666;">compare:</code>, <code style="font-size: 13px; font-family: Courier, Consolas, monospace; color: #666666;">laterDate:和</code> <code style="font-size: 13px; font-family: Courier, Consolas, monospace; color: #666666;">earlierDate:方法，两个时间之间的间隔用timeIntervalSince...方法</code></p>
<p><strong>NSCalendar和NSDateComponents：</strong></p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 3</strong> Creating calendar objects</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1021px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *currentCalendar = [NSCalendar currentCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *japaneseCalendar = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                                initWithCalendarIdentifier:NSJapaneseCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *usersCalendar =</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                      [[NSLocale currentLocale] objectForKey:NSLocaleCalendar];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>currentCalendar和usersCalendar都是用户本地的日历</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 4</strong> Creating a date components object</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1021px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *components = [[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setDay:6];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setMonth:5];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setYear:2004];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger weekday = [components weekday]; // Undefined (== NSUndefinedDateComponent)</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>在Dates和Date Components之间转换：</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 5</strong> Getting a date’s components</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1021px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *today = [NSDate date];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                         initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *weekdayComponents =</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                    [gregorian components:(NSDayCalendarUnit | NSWeekdayCalendarUnit) fromDate:today];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger day = [weekdayComponents day];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger weekday = [weekdayComponents weekday];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>你需要用Calendar Units这个常量来指定要获取的部分。</p>
<p>NSCalendar的ordinalityOfUnit:inUnit:forDate:方法用来获取一个小的单位在一个大的单位里面的序数，比如你可以查看一个日期在一年中的天数。</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 6</strong> Creating a date from components</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1021px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *components = [[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setWeekday:2]; // Monday</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setWeekdayOrdinal:1]; // The first Monday in the month</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setMonth:5]; // May</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setYear:2008];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                         initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *date = [gregorian dateFromComponents:components];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>技术上来说不存在没有年的日期，如果你只想表示生日也可以不指定year：</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 7</strong> Creating a yearless date</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 1021px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *components = [[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setMonth:11];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[components setDay:7];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                         initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *birthday = [gregorian dateFromComponents:components];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>不过这样以后你取components的时候就要记得不能指定year。</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 8</strong> Converting date components from one calendar to another</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 947px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *comps = [[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[comps setDay:6];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[comps setMonth:5];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[comps setYear:2004];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                         initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *date = [gregorian dateFromComponents:comps];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[comps release];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[gregorian release];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *hebrew = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                        initWithCalendarIdentifier:NSHebrewCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSUInteger unitFlags = NSDayCalendarUnit | NSMonthCalendarUnit |</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                              NSYearCalendarUnit;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *components = [hebrew components:unitFlags fromDate:date];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger day = [components day]; // 15</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger month = [components month]; // 9</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger year = [components year]; // 5764</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p style="font-size: 18px;"><strong>日期计算：</strong></p>
<p>你可以用dateByAddingComponents:toDate:options:方法给一个date增加一个date的部分（比如小时或者分钟）</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 9</strong> An hour and a half from now</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 947px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *today = [[NSDate alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *offsetComponents = [[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[offsetComponents setHour:1];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[offsetComponents setMinute:30];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">// Calculate when, according to Tom Lehrer, World War III will end</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *endOfWorldWar3 = [gregorian dateByAddingComponents:offsetComponents</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          toDate:today options:0];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 10</strong> Getting the Sunday in the current week</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 963px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *today = [[NSDate alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">// Get the weekday component of the current date</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *weekdayComponents = [gregorian components:NSWeekdayCalendarUnit</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          fromDate:today];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">/*</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">Create a date components to represent the number of days to subtract from the current date.</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">The weekday value for Sunday in the Gregorian calendar is 1, so subtract 1 from the number of days to subtract from the date in question.  (If today is Sunday, subtract 0 days.)</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">*/</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *componentsToSubtract = [[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[componentsToSubtract setDay: 0 - ([weekdayComponents weekday] - 1)];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *beginningOfWeek = [gregorian dateByAddingComponents:componentsToSubtract</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          toDate:today options:0];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">/*</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">Optional step:</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">beginningOfWeek now has the same hour, minute, and second as the original date (today).</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">To normalize to midnight, extract the year, month, and day components and create a new date from those components.</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">*/</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *components =</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     [gregorian components:(NSYearCalendarUnit | NSMonthCalendarUnit |</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          NSDayCalendarUnit) fromDate: beginningOfWeek];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">beginningOfWeek = [gregorian dateFromComponents:components];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p>NSCalendar的rangeOfUnit:startDate:interval:forDate:方法可以按照rangeOfUnit指定的单位查找初始值，比如：</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 11</strong> Getting the beginning of the week</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 963px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *today = [[NSDate alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *beginningOfWeek = nil;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">BOOL ok = [gregorian rangeOfUnit:NSWeekCalendarUnit startDate:&amp;beginningOfWeek</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                     interval:NULL forDate: today];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p><span style="font-family: 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif; font-size: 12px;"><strong>Listing 12</strong></span><span style="font-family: 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif; font-size: 12px;"> Getting the difference between two dates</span></p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 963px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *startDate = ...;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *endDate = ...;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian = [[NSCalendar alloc]</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                 initWithCalendarIdentifier:NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSUInteger unitFlags = NSMonthCalendarUnit | NSDayCalendarUnit;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;"> </pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *components = [gregorian components:unitFlags</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                                          fromDate:startDate</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">                                          toDate:endDate options:0];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger months = [components month];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSInteger days = [components day];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 15</strong> Determining whether a date is this week</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 963px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">-(BOOL)isDateThisWeek:(NSDate *)date {</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     NSDate *start;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     NSTimeInterval extends;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     NSCalendar *cal=[NSCalendar autoupdatingCurrentCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     NSDate *today=[NSDate date];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     BOOL success= [cal rangeOfUnit:NSWeekCalendarUnit startDate:&amp;start</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          interval: &amp;extends forDate:today];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     if(!success)return NO;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     NSTimeInterval dateInSecs = [date timeIntervalSinceReferenceDate];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     NSTimeInterval dayStartInSecs= [start timeIntervalSinceReferenceDate];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     if(dateInSecs &gt; dayStartInSecs &amp;&amp; dateInSecs &lt; (dayStartInSecs+extends)){</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          return YES;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     }</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     else {</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">          return NO;</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">     }</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">}</pre>
</td>
</tr>
</tbody>
</table>
</div>
<p><strong>Time Zones：</strong></p>
<p>time zone会影响从calendar计算的date components，你可以设置NSCalendar的time zone。NSCalendar默认使用应用程序的时区。可以从timeZoneWithName:, timeZoneWithAbbreviation:, 和 timeZoneForSecondsFromGMT:方法获取一个NSTimeZone对象。可以用[NSTimeZone knownTimeZoneNames]方法获取所有time zone的数组。</p>
<p>可以用setDefaultTimeZone:方法设置默认的时区，用localTimeZone方法始终返回默认的时区。</p>
<p class="codesample clear" style="margin-top: 1.667em; margin-bottom: -.85em; font: normal normal normal 100%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif;"><strong>Listing 16</strong> Creating a date from components using a specific time zone</p>
<div class="codesample clear" style="font-size: 12px; margin: 1.5em 0;">
<table style="width: 897px; padding-bottom: 4px; border: 1px solid #c7cfd5;">
<tbody>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSCalendar *gregorian=[[NSCalendar alloc] initWithCalendarIdentifier: NSGregorianCalendar];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[gregorian setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CDT"]];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDateComponents *timeZoneComps=[[NSDateComponents alloc] init];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">[timeZoneComps setHour:16];</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">//specify whatever day, month, and year is appropriate</pre>
</td>
</tr>
<tr>
<td style="padding: .5em;" scope="row">
<pre style="font-size: 12px; font-family: Courier, Consolas, monospace; color: #666666; margin: -.083em .333em 0 .5em;">NSDate *date=[gregorian dateFromComponents:timeZoneComps];</pre>
</td>
</tr>
</tbody>
</table>
</div>
<h1 style="margin-top: 0; margin-bottom: 1.15em; font: normal normal normal 215%/normal 'Lucida Grande', Geneva, Helvetica, Arial, sans-serif; font-weight: normal; color: #000000; padding-top: 24px;">Date Formatters</h1>
<p>有两个基本的方法：dateFromString: 和 stringFromDate:用来在日期和字符串之间转换</p>
<p> </p>
<p>NSDateFormatter *formatter = [[NSDateFormatter alloc] init];</p>
<p>[formatter setTimeZone:[NSTimeZone systemTimeZone]];</p>
<p><span> </span>[formatter setDateFormat:@"yyyy-MM-dd"];</p>
<p>NSDate *date = [formatter dateFromString:string];</p>
<p>[formatter release];</p>
<p> </p>
<p> </p>
<p>NSDateFormatter *formatter = [[NSDateFormatter alloc] init];</p>
<p>[formatter setTimeZone:[NSTimeZone systemTimeZone]];</p>
<p><span> </span>[formatter setDateFormat:@"yyyy-MM-dd"];</p>
<p>NSString *dateString = [formatter stringFromDate:date];</p>
<p>[formatter release];</p>
<p> </p>
<p>我写的NSDate的几个方法在：<a href="https://github.com/phaibin/MyCategories">https://github.com/phaibin/MyCategories</a></p></p>
