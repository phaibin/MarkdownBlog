---
layout: post
title: map中Annotation的动画效果
date: 2012-12-11 11:49
categories:
- iphone
tags:
- iphone
published: true
comments: true
---
如果用MKPinAnnotationView，可以用animatesDrop属性来控制动画落下的效果。但是要自定义annotation的样式只能用MKAnnotationView，
这样需要在delegate方法
    - (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
中来控制：
    MKAnnotationView *aV;
    for (aV in views) { 
        CGRect endFrame = aV.frame;  
        aV.frame = CGRectMake(aV.frame.origin.x, aV.frame.origin.y - 300, aV.frame.size.width, aV.frame.size.height);  
        [UIView beginAnimations:nil context:NULL]; 
        [UIView setAnimationDuration:0.45]; 
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut]; 
        [aV setFrame:endFrame]; 
        [UIView commitAnimations];
    }
用控制动画一个一个落下的效果，在给mapview加annotation的时候加一个延迟：
    [mapView performSelector:@selector(addAnnotation:) withObject:annotation afterDelay:0.2*i];
