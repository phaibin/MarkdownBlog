---
layout: post
title: Bitbucket加入本地版本库的方法
date: 2012-03-13 15:29
categories:
- RoR
tags: []
published: true
comments: true
---
- Create a repo on Bitbucket
- Change the origin url in the local repo

      git remote set-url origin [Bitbucket url to your repo]

- Push the code back

      git push origin master


