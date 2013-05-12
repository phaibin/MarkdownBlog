---
layout: post
title: 禁用windows server 2008 域密码复杂性要求策略
date: 2010-12-20 10:48
categories:
- 疑难杂症
tags: []
published: true
comments: true
---
<p>具体步骤如下：</p>

<p>1.Start–Programs–Administrative Tools–Group Policy Management 展开组策略管理器</p>

<p>选择 Forest–Domains- Your Domain–Group Policy Objects–Default Domain Policy，右键选择Edit,点击:</p>

<p>Computer Configuration–Policies–Windows Settings–Security Settings–Account Policies-Password Policy</p>

<p>2.设置以下几项：</p>

<p>Password must meet complexity requirements（密码必须符合复杂性要求) 设置为disabled</p>

<p>Minimun password length(最小密码长度) 设置为0，如果默认用6，则新的密码不能少于6位</p>

<p>以下两个可选</p>

<p>Minimum password age（密码最短使用期限）改为0，默认是1，也就是说你两个不同密码设置间隔必须是1天</p>

<p>Enforce password history (强制密码历史) 改为0，默认在域控上时24，独立服务器为0，设置24就是表示设置24次密码不能重复，目的是为了防止用户使用旧密码从而降低系统安全性。</p>

<p>强制密码历史和密码最短使用期限结合使用，要使强制密码历史有效，比如将密码最短使用期限设置为0以上，</p>

<p>设置完成后，在start–run 运行cmd,输入：gpupdate /force 强制刷新组策略，刷新完成后即可重设一个简单密码。</p>
