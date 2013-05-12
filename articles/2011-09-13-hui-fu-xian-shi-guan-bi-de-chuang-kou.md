---
layout: post
title: 恢复显示关闭的窗口
date: 2011-09-13 09:02
categories:
- Cocoa
tags:
- cocoa
published: true
comments: true
---
<p><p>在Interface Builder中，将主窗口的"Release When Closed"选项取消掉。然后在delegate里实现如下方法：</p>
[code lang="objc"]<br />
- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag<br />
{
	if (flag) {<br />
		return NO;<br />
	} else {<br />
		[myWindow makeKeyAndOrderFront:self];<br />
		return YES;	<br />
	}<br />
}
[/code] </p>
