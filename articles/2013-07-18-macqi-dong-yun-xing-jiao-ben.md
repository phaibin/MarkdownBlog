---
title: Mac启动运行脚本
date: 2013-07-18 11:49
tags:
- mac
- 启动
---
参考：<http://www.netingcn.com/tag/mac-os开机自启动脚本>

在/Library/LaunchDaemons下面建立脚本：com.wen.automount.plist，内容为：

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>Label</key>
      <string>com.wen.automount.plist</string>
      <key>ProgramArguments</key>
      <array>
        <string>/Users/leon/auto_mount.sh</string>
      </array>
      <key>KeepAlive</key>
      <false/>
      <key>RunAtLoad</key>
      <true/>
    </dict>
    </plist>

`/Users/leon/auto_mount.sh`对应的是要运行的脚本。

然后通过`sudo launchctl load -w /Library/LaunchDaemons/com.wen.automount.plist`来测试，如果运行正常那启动的时候就可以正常运行了。
