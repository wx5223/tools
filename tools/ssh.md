# iterm2-ssh

##1. 新建一个expect脚本 login.exp

```
#!/usr/bin/expect

if { [llength $argv] < 4 } {
    puts "Usage:  $argv0 ip port user passwd"
    exit 1
}

set ip [lindex $argv 0]
set port [lindex $argv 1]
set user [lindex $argv 2]
set passwd [lindex $argv 3]
set timeout 30

spawn ssh -q -l$user -p$port $ip
expect {
    "(yes/no)?" {
        send "yes\r";exp_continue
    }
    "assword:" {
        send "$passwd\r"
    }
    "FATAL" {
        puts "\nCONNECT ERROR: $ip occur FATAL ERROR!!!\n"
        exit 1
    }
    "No route to host" {
        puts "\nCONNECT ERROR: $ip No route to host!!!\n"
        exit 1
    }
}
#puts "\n--> Connected: $ip, pls enjoy yourself!\n"
interact
```

##2. 将expect脚本copy到$PATH下（例如/usr/local/bin）

	$ cp login.exp /usr/local/bin/login.exp
	$ chmod +x /usr/local/bin/login.exp
	
##3. 在iterm2中设置登录脚本，用command+o的方式呼出profiles，点击Edit Profiles

![]()