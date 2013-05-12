---
layout: post
title: AddressBook使用
date: 2011-06-29 06:40
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>显示AddressBook：</p>
<p><span> </span>ABPeoplePickerNavigationController *ppnc = [[ABPeoplePickerNavigationController alloc] init];</p>
<p><span> </span>ppnc.peoplePickerDelegate = self;</p>
<p><span> </span>[self presentModalViewController:ppnc animated:YES];</p>
<p><span> </span>[ppnc release];</p>
<p>ABPeoplePickerNavigationControllerDelegate包含3个方法：</p>
<p> </p>
<p>- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker;</p>
<p>- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person;</p>
<p>- (BOOL)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker shouldContinueAfterSelectingPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier;</p>
<p> </p>
<p>当用户在AddressBook点击取消后触发peoplePickerNavigationControllerDidCancel方法，用户负责关闭AddressBook。</p>
<p>当用户点击了一个用户后触发- (BOOL)peoplePickerNavigationController:shouldContinueAfterSelectingPerson:方法，返回YES显示用户的详细信息，返回NO什么都不做，用户负责后续的处理。</p>
<p>当用户在详细信息里面点击了一个条目触发- (BOOL)peoplePickerNavigationController:shouldContinueAfterSelectingPerson:property:identifier:方法。返回YES执行默认行为，返回NO什么也不做，由用户负责处理。</p>
<p>property代表点击的哪个部分的信息，比如电话，地址等等，identifier代表点击的条目在property中的位置，比如电话有很多个条目，identifier就是电话中的第几个条目。</p>
<p>获取点击的文字的方法：</p>
<p>
<p>
<p>ABMultiValueRef phonePro = ABRecordCopyValue(person, property);</p>
<p>int idx = ABMultiValueGetIndexForIdentifier(phonePro, identifier);</p>
<p>NSString *text = (NSString*)ABMultiValueCopyValueAtIndex(phonePro, idx);</p>
<p>CFRelease(phonePro);</p>
<p>[text release];</p>
</p>
<p>phonePro为property这个部分的所有信息，ABMultiValueGetIndexForIdentifier根据identifier取得这个部分的索引，然后用这个索引取得点击的文字。</p>
</p></p>
