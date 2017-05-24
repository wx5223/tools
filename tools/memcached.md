# memcached

## install

<http://blog.csdn.net/whereismatrix/article/details/50485570>

	$ brew install memcached

## start

	$ memcached -d -p 11211 -u nobody -c 1024 -m 64
	$ memcached -h

	$ telnet localhost 11211