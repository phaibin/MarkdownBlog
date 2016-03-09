---
layout: post
title: 用WatiN测试网站
date: 2009-11-26 16:34
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>在网页里面用WatiN总是报“<em>The CurrentThread needs to have it's ApartmentState set to ApartmentState.STA to be able to automate Internet Explorer.”</em>错误，解决办法就是在Page标记中加入：AspCompat=&quot;true&quot;。</p>  <p>一个操纵JS弹出框点击的例子：</p>  <blockquote>   <pre><span style="color:#2b91af;">IE </span>ie = <span style="color:blue;">new </span><span style="color:#2b91af;">IE</span>(“http://………”);
ie.Button(<span style="color:#2b91af;">Find</span>.ByClass(<span style="color:#a31515;">&quot;edit style01 forcountry&quot;</span>).And(<span style="color:#2b91af;">Find</span>.ByValue(<span style="color:#a31515;">&quot;Save&quot;</span>))).ClickNoWait();
WatiN.Core.DialogHandlers.<span style="color:#2b91af;">ConfirmDialogHandler </span>approveConfirmDialog = <span style="color:blue;">new </span>WatiN.Core.DialogHandlers.<span style="color:#2b91af;">ConfirmDialogHandler</span>();
<span style="color:blue;">using </span>(<span style="color:blue;">new </span>WatiN.Core.DialogHandlers.<span style="color:#2b91af;">UseDialogOnce</span>(ie.DialogWatcher, approveConfirmDialog))
{
<span style="color:green;">    </span>approveConfirmDialog.WaitUntilExists(10);
    approveConfirmDialog.OKButton.Click();
}
ie.WaitForComplete();</pre>
</blockquote></p>

<p><pre>&#160;</pre></p>

<p><p>比较重要的是按钮要用ClickNoWait()方法，如果用Click方法，调用测试的页面会一直没有反应。还有DialogHandler的WaitUntilExists方法，里面要有参数，表示等待的时间。</p></p>
