---
layout: post
title: 将自己写的程序发布到iphone上
date: 2011-05-19 22:28
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>原文：http://sites.google.com/site/d8815460/updates/jiangxcodefabudaoiphonezhuangzhishang</p>
<p><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;"><span style="font-size:small;"><strong>Step1</strong></span><br />開啟<strong>應用程式</strong> / <strong>工具程式</strong> / <strong><span style="color:#0033ff;">終端機</span></strong>，開啟終端機後，先確定SDKs的版本，從Developer/Platforms/iPhonOS.platform/Developer/SDKs/看下目錄名稱，並分別輸入以下的語法:</span></p>
<p>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;"> </span></div>
</p>
<table border="1" cellspacing="0">
<tbody>
<tr>
<td style="width:695px;height:26px;"><span style="font-size:12px;">1.cd /Developer/Platforms/iPhoneOS.platform/Developer/SDKs/<span style="color:#ff0033;"><strong>iPhoneOS4.3.sdk<span style="color:#000000;">/</span></strong></span></span></td>
</tr>
<tr>
<td style="width:695px;height:26px;"><span style="font-size:small;"><span style="font-size:12px;">2.sudo vi SDKSettings.plist</span></span></td>
</tr>
<tr>
<td style="width:695px;height:26px;"><span style="font-size:12px;">3.接著輸入密碼</span></td>
</tr>
</tbody>
</table>
<p>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;"> 有關紅色字體部份得視你本身電腦安裝XCode的版本為何。</span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;">
</span><div style="text-align:left;"><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/05/newimage5.jpg" border="0" alt="NewImage.jpg" width="600" height="208" /></div>
</div>
<span style="color:#4c4c4c;font-family:Arial, Helvetica, sans-serif;font-size:medium;"><span style="font-size:15px;"><span>
<div><span><span>
</span></span><hr />
</div></span></span>
<div><span style="font-size:medium;"><strong>Step2</strong></span></div>
<div>接著就可以直接進入 SDKSettings.plist這個文件檔裡面做修正，按下鍵盤<span style="color:#ff0000;">i</span>鍵進行修改，找出下列程式碼並修正如下：</div>
</span></p>
<table border="1" cellspacing="0">
<tbody>
<tr>
<td style="width:333px;height:26px;">原始</td>
<td style="width:335px;height:26px;">修正後</td>
</tr>
<tr>
<td style="width:333px;height:26px;">&lt;key&gt;CODE_SIGNING_REQUIRED&lt;/key&gt;<br />&lt;string&gt;YES&lt;/string&gt;</td>
<td style="width:335px;height:26px;">&lt;key&gt;CODE_SIGNING_REQUIRED&lt;/key&gt;<br />&lt;string&gt;<span style="color:#ff0000;">NO</span>&lt;/string&gt;</td>
</tr>
<tr>
<td style="width:333px;height:26px;">&lt;key&gt;CODE_SIGN_ENTITLEMENTS&lt;/key&gt;<br />&lt;string&gt;&lt;/string&gt;</td>
<td style="width:335px;height:26px;">&lt;key&gt;CODE_SIGN_ENTITLEMENTS&lt;/key&gt;<br />&lt;string&gt;<span style="color:#ff0000;">NO</span>&lt;/string&gt;</td>
</tr>
<tr>
<td style="width:333px;height:26px;">&lt;key&gt;ENTITLEMENTS_REQUIRED&lt;/key&gt;<br />&lt;string&gt;YES&lt;/string&gt;</td>
<td style="width:335px;height:26px;">&lt;key&gt;ENTITLEMENTS_REQUIRED&lt;/key&gt;<br />&lt;string&gt;<span style="color:#ff0000;">NO</span>&lt;/string&gt;</td>
</tr>
</tbody>
</table>
<p><span style="color:#4c4c4c;font-family:Arial, Helvetica, sans-serif;font-size:medium;"><span style="font-size:15px;"><span> </span></span></span>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;">
</span><div style="text-align:left;"><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/05/newimage13.jpg" border="0" alt="NewImage.jpg" width="600" height="578" /></div>
<div style="text-align:left;"><span style="font-size:medium;"><strong>Step3</strong></span></div>
<div style="text-align:left;"><span style="font-size:medium;"><strong>更改完成之後，先按esc鍵後，<span style="color:#ff0000;">接著輸入:wq 保存 </span><span style="color:#000000;"><span style="font-weight:normal;">（當初就是敗在不知道要再按:wq，無法儲存）</span></span></strong></span></div>
<hr />
</div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;"><span style="font-size:medium;"><strong>Step4</strong></span></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">完成後開啟Xcode開發工具，選擇功能表<strong>Window</strong> / <span style="color:#0033ff;"><strong>Organizer</strong></span> 並接上iphone。</span></strong></span></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">
</span></strong></span></span><hr />
</div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong>Step5</strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">當手機亮起綠燈， 表示手機已經成功的連接，這時確認一下自已手機的iOS版本 。</span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong>
</strong></span></span></strong></span><div style="text-align:left;"><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/05/newimage23.jpg" border="0" alt="NewImage.jpg" width="600" height="360" /></div>
<div style="text-align:left;">
<hr />
</div>
<span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong>Step6</strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">點專案名稱，再點<span style="color:#0033ff;"><strong>Info</strong></span>，接著在搜尋框中輸入<span style="color:#993333;"><strong>code</strong></span>，分別將<span style="color:#0033ff;"><strong>Code Singing Identity</strong></span>與<span style="color:#0033ff;"><strong>Any iOS</strong></span>都設成<span style="color:#ff0000;"><strong>Don't Code Sign</strong></span>。</span></strong></span></span></strong></span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">
</span></strong></span></span></strong></span></strong></span></span></strong></span><div style="text-align:left;"><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/05/newimage33.jpg" border="0" alt="NewImage.jpg" width="600" height="500" /></div>
<div style="text-align:left;">
<hr />
</div>
<span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong>Step7</strong></span></span></strong></span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">完成後，接著再找尋<span style="color:#ff0033;"><strong>iOS Deployment Target</strong></span>選項，將iOS的版本設與手機的版本相同。</span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">
</span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span><div style="text-align:left;"><img title="NewImage.jpg" src="http://phaibin.files.wordpress.com/2011/05/newimage43.jpg" border="0" alt="NewImage.jpg" width="600" height="561" /></div>
<div style="text-align:left;">
<hr />
</div>
<span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong>Step8</strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">緊張的時刻到囉!按下那隻大鐵捶。</span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">
</span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span><div style="text-align:left;">
<hr />
</div>
<span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong>Step9</strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></div>
<div><span style="color:#4c4c4c;font-family:Arial,Helvetica,sans-serif;font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;"><strong><span style="font-weight:normal;font-size:15px;"><span style="font-size:medium;"><strong><span style="font-weight:normal;font-size:15px;">過一會當視窗右下出現<span style="color:#ff0033;"><strong>Succeded</strong></span>時，就表示已發佈完成啦!</span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></span></strong></span></span></strong></span></strong></span></span></strong></span></div>
<div></div>
<div><span style="font-family:Arial, Helvetica, sans-serif;font-size:medium;"><span style="font-size:15px;"><span style="color:#ff1f17;"><strong>ps：手机需要越狱，并且安装AppSync补丁</strong></span></span></span></div>
</p></p>
