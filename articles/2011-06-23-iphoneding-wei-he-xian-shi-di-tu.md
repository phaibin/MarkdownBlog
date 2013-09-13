---
layout: post
title: iphone定位和显示地图
date: 2011-06-23 08:37
categories:
- iphone
tags: []
published: true
comments: true
---
定位用到CoreLocation库，添加一个CLLocationManager，然后实现CLLocationManagerDelegate协议，初始化CLLocationManager的方法：

    - (void) viewDidLoad {
    lm = [[CLLocationManager alloc] init];
    if ([lm locationServicesEnabled]) {
    lm.delegate = self;
    lm.desiredAccuracy = kCLLocationAccuracyBest;
    lm.distanceFilter = 1000.0f;
    [lm startUpdatingLocation];
    }
    }

desiredAccuracy指定定位的精度，distanceFilter表示移动多少米才会更新。
然后在两个事件中处理位置信息：
 
locationManager:didUpdateToLocation:fromLocation:
locationManager:didFailWithError:
 
    - (void) locationManager: (CLLocationManager *) manager didUpdateToLocation: (CLLocation *) newLocation  fromLocation: (CLLocation *) oldLocation{
    NSString *lat = [[NSString alloc] initWithFormat:@"%g",
    newLocation.coordinate.latitude];
    latitudeTextField.text = lat;
     
    NSString *lng = [[NSString alloc] initWithFormat:@"%g",
    newLocation.coordinate.longitude];
    longitudeTextField.text = lng;
     
    NSString *acc = [[NSString alloc] initWithFormat:@"%g",
    newLocation.horizontalAccuracy];
    accuracyTextField.text = acc;
     
    [acc release];
    [lat release];
    [lng release];
    }
    
latitude是经度，longitude是纬度，horizontalAccuracy是精确度，单位是米。
 
显示地图需要用到MapKit库。初始化：

    mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.mapType = MKMapTypeHybrid;

mapType代表地图的类型，是卫星图或者是普通地图

显示地图：

    MKCoordinateSpan span;
    span.latitudeDelta = .005;
    span.longitudeDelta = .005;
    MKCoordinateRegion region;
    region.center = newLocation.coordinate;
    region.span = span;
    [self.mapView setRegion:region animated:YES];
    CLLocationCoordinate2D coords = {newLocation.coordinate.latitude, newLocation.coordinate.longitude};
    MyAnnotation *mk = [[MyAnnotation alloc] initWithCoordinate:coords title:@"我家" subTitle:@"地址"];
    [self.mapView addAnnotation: mk]; 
    [mk release];
    [self.mapView selectAnnotation:mk animated:YES];

MKCoordinateRegion用来指定地图显示的位置和大小，MKCoordinateSpan表示显示的经纬度的跨度。

MyAnnotation是实现MKAnnotation的一个类，表示地图上的一个图钉，title和subTitle是显示在图钉旁边的文字。
