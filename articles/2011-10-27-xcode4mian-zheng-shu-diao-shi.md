---
layout: post
title: XCode4免证书调试
date: 2011-10-27 13:04
categories:
- iphone
tags:
- iphone
- xcode
published: true
comments: true
---
网上搜了很多，大致都是相同的，但是有几个是自己亲自试验过的呢。今天研究了一下午，终于搞成功了，也把自己的经验分享一下。不得不说，这些搞破解的真是太牛叉了，为什么这里整一下，那里整一下，就可以了呢。

环境：Lion10.7.2 + XCode4.1/4.2

1. 生成证书，这个没什么好研究的，跟别人的教程一样： 

    - 应用程序-> 实用工具->钥匙串访问
    - 菜单：钥匙串访问->证书助理->创建证书
    - 输入证书名称:iPhone Developer(请原样输入，不要试图自己乱改名字)，并选择覆盖默认值 ，其他默认（**这个名字其实是可以随意填的，而我恰好必须改别的名字，因为我装有真实的证书，真实的证书会把这个证书覆盖掉**）
    - 点击继续
    - 序列号填1，有效期365（不要试图超过365），点击继续
    - 输入电子邮件，随便乱填，点击继续
    - 2048\RSA，点击继续
    - 保持默认(1级2级打钩，3级‘签名’打钩)，点击继续
    - 勾选代码签名，继续
    - 不勾选基本约束扩展，继续
    - 默认(RFC822为上面填的邮箱地址)，继续
    - 默认(登录)，继续 。至此证书创建完毕。


2. **这步本来是执行一个脚本，可以免了**

3. **这步本来是建立一个python脚本，也可以免了**

4. 修改`/Developer/Platforms/iPhoneOS.platform/Info.plist`文件，在第一个&lt;dict>下面加上：

        <key>PROVISIONING_PROFILE_ALLOWED</key> 
        <string>NO</string> 
        <key>PROVISIONING_PROFILE_REQUIRED</key> 
        <string>NO</string>

    搜索`XCiPhoneOSCodeSignContext`，全部替换为`XCCodeSignContext`

5. 打开自己的项目，把"Code Signing Identity"设为刚才建立的证书（**我不管叫“iphone developer"还是其他的名字，这里都不会列出来，只会列出合法的证书，但是我可以点击other，手动输入证书的名字**）

6. 新建一个Entitlements文件（New File -> iPhone OS -> Code Signing -> Entitlements），保存为Entitlements.plist，加入属性Can be debugged，值为YES

7. 项目属性中找到`Code Signing Entitlements`，值设为`xxx/Entitlements.plist`（xxx是项目的名字，也就是Entitlements文件的路径）

这样就可以真机调试了，archive也可以。但是archive之后点share还是列不出之前建的证书，而且还不如手动输入证书的名字。于是导出ipa暂时还不能用。但是可以把archive包解开，把里面的app拖到itunes里面生成ipa。这样的ipa可以直接发给别人安装。

