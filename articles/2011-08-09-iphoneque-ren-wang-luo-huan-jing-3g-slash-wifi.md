---
layout: post
title: iPhone确认网络环境 3G/WIFI
date: 2011-08-09 03:16
categories:
- iphone
tags: []
published: true
comments: true
---
原文：<http://www.yifeiyang.net/iphone-web-development-skills-of-the-article-4-make-sure-the-network-environment-3gwifi/>

开发Web等网络应用程序的时候，需要确认网络环境，连接情况等信息。如果没有处理它们，是不会通过Apple的审查的。

###Reachability

Apple 的 例程 [Reachability](http://developer.apple.com/iphone/library/samplecode/Reachability/index.html) 中介绍了取得/检测网络状态的方法。在你的程序中使用 Reachability 只须将该例程中的 Reachability.h 和 Reachability.m 拷贝到你的工程中。

然后将 SystemConfiguration.framework 添加进工程：

Reachability 中定义了3种网络状态。

    // the network state of the device for Reachability 1.5.
    typedef enum {
        NotReachable = 0,
        ReachableViaCarrierDataNetwork,
        ReachableViaWiFiNetwork
    } NetworkStatus;
    // the network state of the device for Reachability 2.0.
    typedef enum {
    NotReachable = 0,
    ReachableViaWiFi,
    ReachableViaWWAN
    } NetworkStatus;

- NotReachable  无连接
- ReachableViaCarrierDataNetwork （ReachableViaWWAN）使用3G/GPRS网络
- ReachableViaWiFiNetwork (ReachableViaWiFi) 使用WiFi网络

比如检测某一特定站点的接续状况，可以使用下面的代码：

    Reachability *r = [Reachability reachabilityWithHostName:@“www.apple.com”];
    switch ([r currentReachabilityStatus]) {
        case NotReachable:
            // 没有网络连接
            break;
        case ReachableViaWWAN:
            // 使用3G网络
            break;
        case ReachableViaWiFi:
            // 使用WiFi网络
            break;
    }

###检测当前网络环境

程序启动时，如果想检测可用的网络环境，可以像这样。

    // 是否wifi
    + (BOOL) IsEnableWIFI {
        return ([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
    }
    // 是否3G 
    + (BOOL) IsEnable3G {
    return ([[Reachability reachabilityForInternetConnection] currentReachabilityStatus] != NotReachable);
    }

###连接状态实时通知

网络连接状态的实时检查，通知在网络应用中也是十分必要的。接续状态发生变化时，需要及时地通知用户。

    // MyAppDelegate.h

    @class Reachability;
    @interface MyAppDelegate : NSObject <UIApplicationDelegate> {
    Reachability *hostReach;
    }

    @end

    // MyAppDelegate.m 

    - (void)reachabilityChanged: (NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass: [Reachability class]]);
    NetworkStatus status = [curReach currentReachabilityStatus];

    if (status == NotReachable) {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"AppName""
    message:@"NotReachable" delegate:nil
    cancelButtonTitle:@"YES" otherButtonTitles:nil];
    [alert show];
    [alert release];
    }
    }

    - (void)applicationDidFinishLaunching:(UIApplication *)application {
    // ...

    // 监测网络情况
    [[NSNotificationCenter defaultCenter] addObserver:self
    selector:@selector(reachabilityChanged:)
    name: kReachabilityChangedNotification
    object: nil];
    hostReach = [[Reachability reachabilityWithHostName:@"www.google.com"] retain];
    [hostReach startNotifer];
    // ...
    }