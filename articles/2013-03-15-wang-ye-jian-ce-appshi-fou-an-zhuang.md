---
layout: post
title: 网页检测app是否安装
date: 2013-03-15 11:50
categories:
- iphone
tags: []
published: true
comments: true
---
参考：<http://blog.csdn.net/hundsong/article/details/6623500>

有的时候从手机浏览器打开网页，点击里面的链接希望跳转到相应的app，可以把链接改成应用的url schema。但是如果没有装应用，就是弹出一个非常链接的对话框，这时候就需要检测链接是否合法，当不合法的时候跳转到另外下载的地址。

下面的代码就是这个作用：

	<a id="applink1" href="fb://">Open scheme(mtcmtc) defined in iPhone with parameters </a>
	
	<script type="text/javascript">
	// To avoid the "protocol not supported" alert, fail must open another app.
	var appstore = "itms://itunes.apple.com/us/app/facebook/id284882215?mt=8&uo=6";
	function applink(fail){
	  return function(){
	    var clickedAt = +new Date;
	    setTimeout(function(){
	          // To avoid failing on return to MobileSafari, ensure freshness!
	          if (+new Date - clickedAt < 2000){
	            window.location = fail;
	          }
	        }, 25);
	  };
	}
	document.getElementById("applink1").onclick = applink(appstore);
	</script>

关键的就是setTimeout方法，在25ms超时之后跳转到别的地址。
