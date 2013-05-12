---
layout: post
title: 从实现iPhone的OAuth封装看国内互联网和开放平台（转）
date: 2011-10-24 09:20
categories:
- 生活
tags: []
published: true
comments: true
---
<p><p>原文：<a href="http://blog.csdn.net/arthurchenjs/article/details/6567563">http://blog.csdn.net/arthurchenjs/article/details/6567563</a></p>
<p>由于工作需要，我最近接触了现在开放平台基本都会使用的OAuth协议。我相信OAuth是很强大的，但是，终于我还是切身的领教了中国互联网的的强大之处。</p>
<p>我的目的是制作一个iphone平台比较通用的OAuth库封装，通过简单的配置URL和key等参数，就可以快速的支持其开放平台，包括界面也是由我来完成。原先以为都是有开源封库的，只要简单的在做一层wrapper，开放几个接口应该就可以了。可惜的是想法是美好的，现实是残酷，道路也肯定是曲折的。</p>
<h2>我看到的OAuth</h2>
<p>说实话，我没有比较好的研究过OAuth这个协议，大致上来说，OAuth协议的目的是让第三方在不接触到用户的账号和密码情况下可以访问第一方的资源。这想起来真是太强大了。</p>
<p>OAUTH认证授权就三个步骤，三句话可以概括：</p>
<p>1.         获取未授权的Request Token</p>
<p>2.         获取用户授权的Request Token</p>
<p>3.         用授权的Request Token换取Access Token</p>
<p>当应用拿到Access Token后，就可以有权访问用户授权的资源了。大家肯能看出来了，这三个步骤不就是对应OAUTH的三个URL服务地址嘛。一点没错，上面的三个步骤中，每个步骤分别请求一个URL，并且收到相关信息，并且拿到上步的相关信息去请求接下来的URL直到拿到Access Token。</p>
<h2>开源项目</h2>
<p>很幸运，网络上开源项目有Objective-C版本的，我好不客气的checkout了，没有很深入的研究内部的代码，不过看到代码主要还是对数据结构的封装，对URLRequest的封装，还有一些加密的处理。小做修改，就可以将其中桌面版的移植到手机版本的。不过我马上发现新浪的代码也是使用OAuthConsumer这份代码。我毫不犹豫的投入到新浪的怀抱中。</p>
<h2>新浪微博</h2>
<p>l  <strong>新浪的判断机制</strong></p>
<p>新浪微博被认为是行业翘楚，其代码和api应该不会差到哪。例子的程序跑的挺好，可是后来看到其中一段代码和注释，我真的凌乱了。</p>
<p> </p>
<p>/*********************************************************************************************************</p>
<p>I am fully aware that this code is chock full 'o flunk. That said:</p>
<p> </p>
<p>- first we check, using standard DOM-diving, for the pin, looking at both the old and new tags for it.</p>
<p>- if not found, we try a regex for it. This did not work for me (though it did work in test web pages).</p>
<p>- if STILL not found, we iterate the entire HTML and look for an all-numeric 'word', 7 characters in length</p>
<p> </p>
<p>Ugly. I apologize for its inelegance. Bleah.</p>
<p>*********************************************************************************************************/</p>
<p>- (NSString *) locateAuthPinInWebView: (UIWebView *) webView {</p>
<p>NSString *pin;</p>
<p>NSString                   *html = [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerText"];</p>
<p>NSLog(@"html:%@", [webView stringByEvaluatingJavaScriptFromString:@"document.body.innerHTML"]);</p>
<p> </p>
<p>if (html.length == 0) return nil;</p>
<p> </p>
<p>const char                *rawHTML = (const char *) [html language="UTF8String"][/html];</p>
<p>int                             length = strlen(rawHTML), chunkLength = 0;</p>
<p> </p>
<p>for (int i = 0; i &lt; length; i++) {</p>
<p>if (rawHTML[i] &lt; '0' || rawHTML[i] &gt; '9') {</p>
<p>if (chunkLength == 6) {</p>
<p>char                            *buffer = (char *) malloc(chunkLength + 1);</p>
<p> </p>
<p>memmove(buffer, &amp;rawHTML[i - chunkLength], chunkLength);</p>
<p>buffer[chunkLength] = 0;</p>
<p> </p>
<p>pin = [NSString stringWithUTF8String: buffer];</p>
<p>free(buffer);</p>
<p>return pin;</p>
<p>}</p>
<p>chunkLength = 0;</p>
<p>} else</p>
<p>chunkLength++;</p>
<p>}</p>
<p>return nil;</p>
<p>}</p>
<p> </p>
<p>这段代码我也没细品，但是基本可以看出是在网页的html代码中找到一串数字，找到了就认为是授权pin码，我的天啊，算了，人家也道歉了。可是我真不知道怎么来做这个协议了。</p>
<p>后来才发现，其实只要取到verifier就可以了，这是直接在url里面就有，不用去html里面扣。</p>
<p> </p>
<p>l  <strong>新浪支持的XAuth</strong><strong>协议</strong></p>
<p>什么是XAuth呢? 我没有去考据究竟XAuth是谁的创造, 它几乎搬了大部分OAuth的内容, 不过解决了一个什么问题呢? 解决了一个 "OAuth认证必须跳转到第一方去输入密码" 的问题(美其名曰提升用户体验)。我真不知道说什么了, 第三方是可以得到用户密码的, 那它是不是直接把OAuth的第一大feature给咔嚓掉了——那basic auth不能满足你么?</p>
<p> </p>
<p>l  <strong>OAuth</strong><strong>提供两种认证方式</strong></p>
<p>在新浪的文档中，我还注意到了这一段话：OAuth提供两种认证方式：query-string和http headers。我们推荐使用http header进行认证。</p>
<p>也许是这段话，腾讯微博做出了选择，让我悲剧了好长一段时间，终于向企鹅大哥妥协了。</p>
<h2>腾讯微博</h2>
<p>很快，调通了新浪微博后，我就开始腾讯的历程了。可是怎么都是不能授权成功，第一步获取token就失败了。后来我在FAQ中找到一段话：</p>
<p> </p>
<p><em>请带上所有OAuth需要的参数，并按照规范传输（暂不支持Header方式传参，请通过GET,POST方式），腾讯微博授权协议在OAuth 【RFC 5849】 标准基础上开发。第一步需带上回调URL（oauth_callback参数）,不是在第二步（非同于基他微博OAuth授权）。回调url需根据[RFC3986] 所定义的百分号机制进行URL转义。</em></p>
<p> </p>
<p>我真的怀疑腾讯为了和新浪不兼容才不支持header方式传参的。就因为这一条，我最后还是选择了腾讯的封装，而弃用了新浪的封装。</p>
<p> </p>
<p>另一个问题是：在请求request_token时传递oauth_callback参数, 因为写测试没用到callback, 所以肯定库会帮我填上oob(out-of-bound), 不过让我很崩溃的是, 给我跳转到了一个这样一个地方:</p>
<p><a href="https://open.t.qq.com/oauth_html/oob?oauth_token=xxxxx&amp;oauth_verifier=xxxxxx">https://open.t.qq.com/oauth_html/oob?oauth_token=xxxxx&amp;oauth_verifier=xxxxxx</a></p>
<p>结果是NOT FOUND了。</p>
<p> </p>
<p>然后我又看到了下一条说明：</p>
<p> </p>
<p><em>桌面应用，手机应用，因为没有callback_url（oauth_callback参数），所以在第一步传CALLBACK时请用oauth_callback=null代替，不然得不到 PIN码。“null”串不区分大小写。</em></p>
<p> </p>
<p>还有腾讯的不同之处还有是拦截url中的oauth_verifier=xxxxxx的部分来继续操作。相比新浪的，也是靠谱一点，可是也就是因为这个，后面豆瓣和网易我都没能都支持。</p>
<p> </p>
<h2>搜狐微博</h2>
<p>搜狐微博的支持似乎比较弱，但是中规中规中矩的，除了界面比较丑陋，没有针对手机适配，其他的很容易就走通了流程了。</p>
<h2>网易微博</h2>
<p>开始我尝试了网易微博的授权，没能成功。</p>
<p>首先我发现的明显的一个不按照标准的地方是authorization步骤, 它提供了两个接口, 一个是/oauth/authorize, 一个是/oauth/authenticate, 首先我先申明这两个单词我一直搞不清, 不过在网易给OAuth的分工中, 它们的工程师是这么定义的: authorize不处理callback, 直接展示verifier的页面; 另一个, authenticate则处理callback. (至于给第二个传oob会怎么样, 有没有返回oauth_callback_confirmed, 我都没有细看了)。</p>
<p>另外小提一下, 它在回调你的callback地址的时候, 传的参数名是oauth_token, 不过相信我, 我觉得那是oauth_verifier。</p>
<p>后来仔细研究了网易的协议后，我才发现，其实并不是每一个都需要verifier。那怎么来确定是否同意授权，只要重定向了，就可以认为用户已经授权，直接去换取accesstoeken就可以了。因为这样豆瓣的问题也同样的解决了。</p>
<p>还有，网易需要把重定向url加到在请求授权url时一起加上，他才不管你在header里已经传了。</p>
<p>最后还需要加上client_type=mobile,真是麻烦。</p>
<p>还有，网易的demo代码真是不知道说什么了。不过算了，毕竟人家也是贡献出来的。整个网易的objective-C代码就是把腾讯的demo改改，然后就拿出来了。不过出现了和我一样的问题，但是可能不知道重定向url的问题，出现了手动输入pin的界面，这是我做库所不能接受的，所以没有采纳。</p>
<h2>豆瓣</h2>
<p>开始豆瓣我也没有能够成功，他总是不会重定向到我的URL，转而跳转到其授权的界面。这大概是我使用腾讯封装导致的结果。可是我还真没好好的确认这个流程了。</p>
<p>后来才发现，只要在请求网页地址的时候，需要吧重定向地址加到url，这样才会正确重定向，并且和网易一样，没有verifier，直接请求就可以成功了。</p>
<p>豆瓣没有Objective-C的代码，没有参考，很久都没有解决，最后是解决网易的时候也一起解决的。</p>
<h2>人人网</h2>
<p>人人网使用的OAuth2.0，2.0的协议我没有好好的看过，因为现在只有人人支持2.0所以我偷懒的直接使用了人人的代码，所以，结果是2.0现在只支持人人授权。</p>
<p>人人的代码是直接冲facebooksdk改改就拿来用的，也是有时候看看也觉得真是的，一点都不专业。</p>
<h2>一点感触</h2>
<p>已经不记得是在什么地方看到一篇文章, 作者一上来第一句话就是 "从OAuth可以看出一个互联网企业的技术力", 虽然稍微有些偏激, 但多多少少有值得认同的地方。</p>
<p>OAuth的应用越来越广泛, 互联网企业拿着互联网开发的新年开发着自己的平台, 这是一件很好的事情.从开发角度来说,不得不承认OAuth并不简单, 我也并不精通OAuth, 偷懒了用了别人的库或多或少出现了些问题.。我依然比较郁闷的是, OAuthConsumer本身自己就支持一大堆国外的OAuth, 并且在我看来代码都是没有什么问题的, 到了国内, 标准就不是标准了,标准只是参考, 各家各户按照自己的理解在做。</p>
<p>国内的互联网环境真的是相当有特色的，对此，面对需求和计划，我只能说，先实现功能吧，代码写成什么样先不说了。</p>
<p>国内的开发环境也是比较混乱，因为基本都是代码抄来抄去，有时候并没有真正的去实现，可以想象，服务端的协议制作应该也是一样的，做协议的总是不能够静下心来做事。</p>
<p>由于时间比较紧，我承认我偷懒使用了很多现有的代码。也因为这样，让这个库的功能还不是那么完整，还有很多不是能够比较好的支持。中间百般折腾，给我造成了很多的困扰，自此，也就是支持新浪，腾讯，搜狐，网易，豆瓣和人人的授权。其他的还需要改进。</p></p>
