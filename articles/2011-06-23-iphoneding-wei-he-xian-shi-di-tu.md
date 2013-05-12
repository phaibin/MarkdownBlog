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
<p><p>定位用到CoreLocation库，添加一个CLLocationManager，然后实现CLLocationManagerDelegate协议，初始化CLLocationManager的方法：</p>
<p style="font:12px 'Heiti SC Light';margin:0;">- (void) viewDidLoad {</p>
<p style="font:12px 'Heiti SC Light';margin:0;">lm = [[CLLocationManager alloc] init];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">if ([lm locationServicesEnabled]) {</p>
<p style="font:12px 'Heiti SC Light';margin:0;">lm.delegate = self;</p>
<p style="font:12px 'Heiti SC Light';margin:0;">lm.desiredAccuracy = kCLLocationAccuracyBest;</p>
<p style="font:12px 'Heiti SC Light';margin:0;">lm.distanceFilter = 1000.0f;</p>
<p style="font:12px 'Heiti SC Light';margin:0;">[lm startUpdatingLocation];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">}</p>
<p style="font:12px 'Heiti SC Light';margin:0;">}</p>
<p style="font:12px 'Heiti SC Light';margin:0;">desiredAccuracy指定定位的精度，distanceFilter表示移动多少米才会更新。</p>
<p style="font:12px 'Heiti SC Light';margin:0;">然后在两个事件中处理位置信息：</p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p style="font:12px 'Heiti SC Light';margin:0;">locationManager:didUpdateToLocation:fromLocation:</p>
<p style="font:12px 'Heiti SC Light';margin:0;">locationManager:didFailWithError:</p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p style="font:12px 'Heiti SC Light';margin:0;">- (void) locationManager: (CLLocationManager *) manager didUpdateToLocation: (CLLocation *) newLocation  fromLocation: (CLLocation *) oldLocation{</p>
<p style="font:12px 'Heiti SC Light';margin:0;">NSString *lat = [[NSString alloc] initWithFormat:@"%g",</p>
<p style="font:12px 'Heiti SC Light';margin:0;">newLocation.coordinate.latitude];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">latitudeTextField.text = lat;</p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p style="font:12px 'Heiti SC Light';margin:0;">NSString *lng = [[NSString alloc] initWithFormat:@"%g",</p>
<p style="font:12px 'Heiti SC Light';margin:0;">newLocation.coordinate.longitude];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">longitudeTextField.text = lng;</p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p style="font:12px 'Heiti SC Light';margin:0;">NSString *acc = [[NSString alloc] initWithFormat:@"%g",</p>
<p style="font:12px 'Heiti SC Light';margin:0;">newLocation.horizontalAccuracy];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">accuracyTextField.text = acc;</p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p style="font:12px 'Heiti SC Light';margin:0;">[acc release];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">[lat release];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">[lng release];</p>
<p style="font:12px 'Heiti SC Light';margin:0;">}</p>
<p style="font:12px 'Heiti SC Light';margin:0;">latitude是经度，longitude是纬度，horizontalAccuracy是精确度，单位是米。</p>
<p style="font:12px 'Heiti SC Light';margin:0;"> </p>
<p>显示地图需要用到MapKit库。初始化：</p>
<p> </p>
<p>mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];<br />mapView.mapType = MKMapTypeHybrid;</p>
<p>mapType代表地图的类型，是卫星图或者是普通地图</p>
<p>显示地图：</p>
<p> </p>
<p>MKCoordinateSpan span;<br /> span.latitudeDelta = .005;<br /> span.longitudeDelta = .005;<br /> MKCoordinateRegion region;<br /> region.center = newLocation.coordinate;<br /> region.span = span;<br /> [self.mapView setRegion:region animated:YES];<br /> CLLocationCoordinate2D coords = {newLocation.coordinate.latitude, newLocation.coordinate.longitude};<br /> MyAnnotation *mk = [[MyAnnotation alloc] initWithCoordinate:coords title:@"我家" subTitle:@"地址"];<br /> [self.mapView addAnnotation: mk];<span> <br /></span> [mk release];<br /> [self.mapView selectAnnotation:mk animated:YES];</p>
<p>MKCoordinateRegion用来指定地图显示的位置和大小，MKCoordinateSpan表示显示的经纬度的跨度。</p>
<p>MyAnnotation是实现MKAnnotation的一个类，表示地图上的一个图钉，title和subTitle是显示在图钉旁边的文字。</p>
<p> </p>
<p> </p>
<p> </p>
<p> </p></p>
