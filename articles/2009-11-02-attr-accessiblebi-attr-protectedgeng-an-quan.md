---
layout: post
title: attr_accessible比attr_protected更安全
date: 2009-11-02 14:38
categories:
- RoR
tags: []
published: true
comments: true
---
<p><p>原文：<a title="http://somethinglearned.com/articles/2006/05/23/best-practices-a-strong-case-for-redacted-part-1" href="http://somethinglearned.com/articles/2006/05/23/best-practices-a-strong-case-for-redacted-part-1">http://somethinglearned.com/articles/2006/05/23/best-practices-a-strong-case-for-redacted-part-1</a></p>  <p><a href="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/attr_accessibleattr_protected_CDD0/image_2.png"><img title="image" border="0" alt="image" src="http://images.cnblogs.com/cnblogs_com/phaibin/WindowsLiveWriter/attr_accessibleattr_protected_CDD0/image_thumb.png" width="425" height="472" /></a> </p>  <p>对于上面的模型，要求：</p>  <p>1：用户不能给自己管理员权限</p>  <p>2：只有管理员或者项目的所有者才可以删除一个项目</p>  <p>那么上面的代码是否完整？</p>  <p>答案是不完整。</p>  <p><b>attr_protected</b>(*attributes)：</p>  <p>在这个宏定义之后的属性不能用块赋值，也就是不能用new(attributes)，update_attributes(attributes)或attributes=(attributes)来赋值，对这些属性的块赋值会被忽略，只能直接对这些属性来赋值。这是为了保护一些敏感属性，防止恶意用户通过URL或表单来改写。</p>  <p><b>attr_accessible</b>(*attributes)：</p>  <p>指定一个属性的白名单，这些属性可以通过块赋值来赋值，是attr_protected的反义词，其他属性只能直接用属性来赋值。</p>  <p>你知道我们的模型里面有多少方法可以通过块赋值进行调用么？你知道User模型有一个“project_ids=”方法么（由has_many宏提供）？它接受一个整数数组来指定属于用户的项目id，然后会更新存在的Project记录来指向新的所有者。</p>  <p>所以我们可以简单地通过URL参数来更新它：    <br />user[project_ids][]=5</p>  <p>所以最好用attr_assessible来代替attr_protected，它体现了一条基本的安全准则：</p>  <p><em>everything should be implicitly denied unless explicitly allowed</em>.</p></p>
