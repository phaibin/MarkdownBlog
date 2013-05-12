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
<p><p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;">Creates a bitmap graphics context.</p></p>

<p><p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;">CGContextRef CGBitmapContextCreate (<br />
void *data,<br />
size_t width,<br />
size_t height,<br />
size_t bitsPerComponent,<br />
size_t bytesPerRow,<br />
CGColorSpaceRef colorspace,<br />
CGBitmapInfo bitmapInfo<br />
);</p>

<p><p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;">data:想樣建立的容器所需的記憶體大小，單位是byte。<br />
width:容器的寬，單位是pixel。<br />
height:容器的寬，單位是pixel。<br />
bitsPerComponent:32-bit pixel format的ARGB， 8 bits per component。<br />
bytesPerRow:一個row多少bytes。<br />
colorspace:容器的色彩的模式：RGB（CGColorSpaceCreateDeviceRGB）,Gray（CGColorSpaceCreateDeviceGray）,CMYK（CGColorSpaceCreateDeviceCMYK）。<br />
bitmapInfo: 描述透明通道的枚举，可以传入CGBitmapInfo或者CGImageAlphaInfo枚举的值
<p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;"></p></p>

<p><p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;">size_t width = size.width;<br />
size_t height = size.height;<br />
size_t bitsPerComponent = 8;<br />
size_t bytesPerRow = width * 4;<br />
size_t dataSize = bytesPerRow * height;<br />
void* data = calloc(1, dataSize);<br />
CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();<br />
mBitmapContext = CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, colorspace, kCGImageAlphaPremultipliedFirst);<br />
CGColorSpaceRelease(colorspace);
<p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;">使用完之后释放：</p>
<p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;"></p></p>

<p><p style="font-size:12px;vertical-align:baseline;border:0 initial initial;margin:0 0 15px;padding:0;"><span> </span>void* data = CGBitmapContextGetData(mBitmapContext);
<span> </span>CGContextRelease(mBitmapContext);
<span> </span>free(data);</p></p></p></p></p>
