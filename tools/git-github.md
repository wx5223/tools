# git & github
## config ssh key
1、check the ssh keys

	$ cd ~/.ssh
	$ ls
	
2、backup old ssh keys

3、create ssh keys

	$ ssh-keygen -t rsa -C "wx5223@gmail.com" 
	Generating public/private rsa key pair.
	Enter file in which to save the key (/Users/shawn/.ssh/id_rsa): github_id_rsa
	Enter passphrase (empty for no passphrase): 
	Enter same passphrase again: 
	Your identification has been saved in id_rsa.
	Your public key has been saved in id_rsa.pub.
	The key fingerprint is:
	*****
	
4、add ssh pub key to github

5、check github connection
	
	$ ssh -T git@github.com
	Warning: Permanently added the RSA host key for IP address '192.30.255.113' to the list of known hosts.
	Enter passphrase for key '/Users/shawn/.ssh/id_rsa': 
	Hi wx5223! You've successfully authenticated, but GitHub does not provide shell access.

## git command
1、 set git username & email

	$ git config --global user.name ShawnWang
	$ git config --global user.email wx5223@gmail.com
	
2、git clone
	
	$ git clone git@github.com:wx5223/tools.git
	$ git remote add origin git@github.com:wx5223/tools.git
	$ git add .
	$ git status
	$ git config --list
	$ git branch
	$ git push origin master
	$ git pull origin master
	
### other todo


	git branch //查看项目分支
	git checkout -b host//添加一个名为host的分支
	git checkout master //切换到主干
	git merge host //合并分支host到主干
	git branch -d host //删除分支host

	

