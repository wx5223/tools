# proxychains-ng
## install
[官方地址](https://github.com/rofl0r/proxychains-ng)

	$ brew install proxychains-ng
	$ vim /usr/local/etc/proxychains.conf
	
### sip
由于OSX 10.11 的 SIP 特性,brew安装的话，由于没有写入权限，必须暂时关闭 SIP，安装成功之后再打开 SIP。具体方法见 [这里](http://osxdaily.com/2015/10/05/disable-rootless-system-integrity-protection-mac-os-x/)

	$ csrutil status
	
Configuration:
--------------

proxychains looks for config file in following order:

1.	file listed in environment variable PROXYCHAINS_CONF_FILE or
	provided as a -f argument to proxychains script or binary.
2.	./proxychains.conf
3.	$(HOME)/.proxychains/proxychains.conf
4.	$(sysconfdir)/proxychains.conf  **

** usually /etc/proxychains.conf

in my mac /usr/local/etc/proxychains.conf

Usage Example:

	$ proxychains telnet targethost.com

in this example it will run telnet through proxy(or chained proxies)
specified by proxychains.conf

Usage Example:

	$ proxychains -f /etc/proxychains-other.conf telnet targethost2.com

in this example it will use different configuration file then proxychains.conf
to connect to targethost2.com host.

Usage Example:

	$ proxyresolv targethost.com

in this example it will resolve targethost.com through proxy(or chained proxies)
specified by proxychains.conf


