---
layout: post
title: 仿射变换
date: 2011-08-31 01:46
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>仿射变换（AffineTransform）是一种二维坐标到二维坐标之间的线性变换，保持二维图形的“平直性”（straightness，即变换后直线还是直线不会打弯，圆弧还是圆弧）和“平行性”（parallelness，其实是指保二维图形间的相对位置关系不变，平行线还是平行线，相交直线的交角不变。仿射变换可以通过一系列的原子变换的复合来实现，包括：平移（Translation）、缩放（Scale）、翻转（Flip）、旋转（Rotation）和剪切（Shear）。剪切也叫错切。</p>
<p>平移变换，将每一点移动到(x+tx, y+ty)，变换矩阵为：<br />[   1    0    tx  ]<br />[   0    1    ty  ]<br />[   0    0    1   ]</p>
<p>缩放变换，将每一点的横坐标放大（缩小）至sx倍，纵坐标放大（缩小）至sy倍，变换矩阵为：<br />[   sx   0    0   ]<br />[   0    sy   0   ]<br />[   0    0    1   ]</p>
<p>旋转变换，目标图形围绕原点顺时针旋转theta弧度，变换矩阵为：<br />[   cos(theta)    -sin(theta)    0   ]<br />[   sin(theta)     cos(theta)    0   ]<br />[       0                0                   1   ]</p>
<p>旋转变换，目标图形以(x, y)为轴心顺时针旋转theta弧度，变换矩阵为：<br />[   cos(theta)    -sin(theta)    x-x*cos+y*sin]<br />[   sin(theta)     cos(theta)    y-x*sin-y*cos ]<br />[       0                 0                  1                       ]<br />相当于两次平移变换与一次原点旋转变换的复合：<br />[1  0  -x][cos(theta)  -sin(theta)  0][1  0  x]<br />[0  1  -y][sin(theta)   cos(theta)  0][0  1  y]<br />[0  0   1][ 0                0                  1][0  0  1]</p>
<p>剪切变换，变换矩阵为：<br />[   1   shx   0   ]<br />[  shy   1    0   ]<br />[   0     0    1   ]<br />相当于一个横向剪切与一个纵向剪切的复合<br />[   1      0    0   ][   1   shx   0   ]<br />[  shy    1    0   ][   0    1     0   ]<br />[   0      0    1   ][   0    0     1   ]</p></p>
