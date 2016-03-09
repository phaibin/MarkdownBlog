---
layout: post
title: 建立Bitmap Context
date: 2011-07-05 00:14
categories:
- iphone
tags: []
published: true
comments: true
---
Creates a bitmap graphics context.

    CGContextRef CGBitmapContextCreate (
    void *data,
    size_t width,
    size_t height,
    size_t bitsPerComponent,
    size_t bytesPerRow,
    CGColorSpaceRef colorspace,
    CGBitmapInfo bitmapInfo
    );

- data:想樣建立的容器所需的記憶體大小，單位是byte。
- width:容器的寬，單位是pixel。
- height:容器的寬，單位是pixel。
- bitsPerComponent:32-bit pixel format的ARGB， 8 bits per component。
- bytesPerRow:一個row多少bytes。
- colorspace:容器的色彩的模式：RGB（CGColorSpaceCreateDeviceRGB）,Gray（CGColorSpaceCreateDeviceGray）,CMYK（CGColorSpaceCreateDeviceCMYK）。
- bitmapInfo: 描述透明通道的枚举，可以传入CGBitmapInfo或者CGImageAlphaInfo枚举的值

      size_t width = size.width;
      size_t height = size.height;
      size_t bitsPerComponent = 8;
      size_t bytesPerRow = width * 4;
      size_t dataSize = bytesPerRow * height;
      void* data = calloc(1, dataSize);
      CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
      mBitmapContext = CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, colorspace, kCGImageAlphaPremultipliedFirst);
      CGColorSpaceRelease(colorspace);

使用完之后释放：

    void* data = CGBitmapContextGetData(mBitmapContext); CGContextRelease(mBitmapContext); free(data);