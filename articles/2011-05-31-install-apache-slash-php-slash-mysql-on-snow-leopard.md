---
layout: post
title: Install Apache/PHP/MySQL on Snow Leopard
date: 2011-05-31 01:00
categories:
- iphone
tags: []
published: true
comments: true
---
<p><p>原文：http://maestric.com/doc/mac/apache_php_mysql_snow_leopard</p>
<p> </p>
<h2 style="font-weight:inherit;font-style:inherit;font-size:36px;font-family:inherit;vertical-align:baseline;font:normal normal normal 36px/36px neue_sans_bold, Trebuchet, 'Trebuchet MS', Helvetica, sans-serif;width:790px;color:#3d3d3d;margin:72px 0 23px;padding:9px 0 0;"><a id="apache" name="apache">Apache</a></h2>
<div class="level2" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Start Apache</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">sudo apachectl start
</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Check it's working: <a class="urlextern" title="http://localhost/" rel="nofollow" href="http://localhost/">http://localhost/</a></p>
</div>
<h2 style="font-weight:inherit;font-style:inherit;font-size:36px;font-family:inherit;vertical-align:baseline;font:normal normal normal 36px/36px neue_sans_bold, Trebuchet, 'Trebuchet MS', Helvetica, sans-serif;width:790px;color:#3d3d3d;margin:72px 0 23px;padding:9px 0 0;"><a id="php" name="php">PHP</a></h2>
<div class="level2" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">In <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">/etc/apache2/httpd.conf</code>, uncomment this line:</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">LoadModule php5_module        libexec/apache2/libphp5.so
</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Restart Apache</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">sudo apachectl restart
</pre>
</div>
<h3 style="font-weight:inherit;font-style:inherit;font-size:24px;font-family:inherit;vertical-align:baseline;width:790px;text-align:left;text-decoration:underline;border:0 initial initial;margin:72px 0 23px;padding:0;"><a id="fix_a_warning_appearing_in_phpinfo" name="fix_a_warning_appearing_in_phpinfo">Fix a warning appearing in phpinfo()</a></h3>
<div class="level3" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Create <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">/etc/php.ini</code> and make it writable</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">cd /etc
sudo cp php.ini.default php.ini
sudo chmod 666 php.ini
</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">In <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">php.ini</code>, find this line:</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">;date.timezone =
</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Uncomment it and insert your time zone (<a class="urlextern" title="http://php.net/manual/en/timezones.php" rel="nofollow" href="http://php.net/manual/en/timezones.php">http://php.net/manual/en/timezones.php</a>)</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">date.timezone =America/Vancouver
</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Restart Apache</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">sudo apachectl restart
</pre>
</div>
<h2 style="font-weight:inherit;font-style:inherit;font-size:36px;font-family:inherit;vertical-align:baseline;font:normal normal normal 36px/36px neue_sans_bold, Trebuchet, 'Trebuchet MS', Helvetica, sans-serif;width:790px;color:#3d3d3d;margin:72px 0 23px;padding:9px 0 0;"><a id="mysql" name="mysql">MySQL</a></h2>
<div class="level2" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<ul style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0 0 0 24px;">
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;"><a class="urlextern" title="http://dev.mysql.com/downloads/mysql/5.1.html#macosx-dmg" rel="nofollow" href="http://dev.mysql.com/downloads/mysql/5.1.html#macosx-dmg">Download the MySQL package</a> for Mac OS X.5 (32 or 64 bits depending on your machine)</div>
</li>
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">Install everything in the package in this order: mysql, the startup item, the preference pane.</div>
</li>
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">Start MySQL in the preference pane.</div>
</li>
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">Test it's working:</div>
</li>
</ul>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">/usr/local/mysql/bin/mysql
</pre>
</div>
<h3 style="font-weight:inherit;font-style:inherit;font-size:24px;font-family:inherit;vertical-align:baseline;width:790px;text-align:left;text-decoration:underline;border:0 initial initial;margin:72px 0 23px;padding:0;"><a id="fix_mysql.sock_location_in_php.ini" name="fix_mysql.sock_location_in_php.ini">Fix mysql.sock location in php.ini</a></h3>
<div class="level3" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<ul style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0 0 0 24px;">
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">In <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">/etc/php.ini</code>, replace the three occurences of <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">/var/mysql/mysql.sock</code> by <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">/tmp/mysql.sock</code></div>
</li>
</ul>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">pdo_mysql.default_socket=/tmp/mysql.sock
mysql.default_socket = /tmp/mysql.sock
mysqli.default_socket = /tmp/mysql.sock</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Restart Apache</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">sudo apachectl restart
</pre>
</div>
<h2 style="font-weight:inherit;font-style:inherit;font-size:36px;font-family:inherit;vertical-align:baseline;font:normal normal normal 36px/36px neue_sans_bold, Trebuchet, 'Trebuchet MS', Helvetica, sans-serif;width:790px;color:#3d3d3d;margin:72px 0 23px;padding:9px 0 0;"><a id="extra" name="extra">Extra</a></h2>
<h3 style="font-weight:inherit;font-style:inherit;font-size:24px;font-family:inherit;vertical-align:baseline;width:790px;text-align:left;text-decoration:underline;border:0 initial initial;margin:72px 0 23px;padding:0;"><a id="activate_php_short_tags" name="activate_php_short_tags">Activate PHP short tags</a></h3>
<div class="level3" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">In <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">/etc/php.ini</code>, under <code style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0 4px 2px;">Language Options</code>, change</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">short_open_tag = Off</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">to</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">short_open_tag = On</pre>
<p style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0;">Restart Apache</p>
<pre style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:'Courier New', Courier;vertical-align:baseline;width:775px;margin:0 0 24px -5px;padding:12px 10px;">sudo apachectl restart
</pre>
</div>
<h2 style="font-weight:inherit;font-style:inherit;font-size:36px;font-family:inherit;vertical-align:baseline;font:normal normal normal 36px/36px neue_sans_bold, Trebuchet, 'Trebuchet MS', Helvetica, sans-serif;width:790px;color:#3d3d3d;margin:72px 0 23px;padding:9px 0 0;"><a id="reference" name="reference">Reference</a></h2>
<div class="level2" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;">
<ul style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;width:790px;border:0 initial initial;margin:0 0 24px;padding:0 0 0 24px;">
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;"><a class="urlextern" title="http://wordpress.org/support/topic/306878" rel="nofollow" href="http://wordpress.org/support/topic/306878">http://wordpress.org/support/topic/306878</a></div>
</li>
<li class="level1">
<div class="li" style="font-weight:inherit;font-style:inherit;font-size:16px;font-family:inherit;vertical-align:baseline;border:0 initial initial;margin:0;padding:0;"><a class="urlextern" title="http://stackoverflow.com/questions/1293484/easiest-way-to-activate-php-and-mysql-on-mac-os-10-6-snow-leopard" rel="nofollow" href="http://stackoverflow.com/questions/1293484/easiest-way-to-activate-php-and-mysql-on-mac-os-10-6-snow-leopard">http://stackoverflow.com/questions/1293484/easiest-way-to-activate-php-and-mysql-on-mac-os-10-6-snow-leopard</a></div>
</li>
</ul>
</div></p>
