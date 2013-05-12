---
layout: post
title: 画圆角矩形的算法
date: 2011-06-27 23:06
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>
<p><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/06/newimage31.jpg" border="0" alt="NewImage.jpg" width="91" height="82" /></p>
<p>// Next, we will go around the rectangle in the order given by the figure below.</p>
<p><span> </span>//       minx    midx    maxx</p>
<p><span> </span>// miny    2       3       4</p>
<p><span> </span>// midy   1 9              5</p>
<p><span> </span>// maxy    8       7       6</p>
<p><span> </span>// Which gives us a coincident start and end point, which is incidental to this technique, but still doesn't</p>
<p><span> </span>// form a closed path, so we still need to close the path to connect the ends correctly.</p>
<p><span> </span>// Thus we start by moving to point 1, then adding arcs through each pair of points that follows.</p>
<p><span> </span>// You could use a similar tecgnique to create any shape with rounded corners.</p>
<p><span> </span></p>
<p><span> </span>// Start at 1</p>
<p><span> </span>CGContextMoveToPoint(context, minx, midy);</p>
<p><span> </span>// Add an arc through 2 to 3</p>
<p><span> </span>CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);</p>
<p><span> </span>// Add an arc through 4 to 5</p>
<p><span> </span>CGContextAddArcToPoint(context, maxx, miny, maxx, midy, radius);</p>
<p><span> </span>// Add an arc through 6 to 7</p>
<p><span> </span>CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);</p>
<p><span> </span>// Add an arc through 8 to 9</p>
<p><span> </span>CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);</p>
<p><span> </span>// Close the path</p>
<p><span> </span>CGContextClosePath(context);</p>
<p><span> </span>// Fill &amp; stroke the path</p>
<p><span> </span>CGContextDrawPath(context, kCGPathFillStroke);</p>
</p></p>
