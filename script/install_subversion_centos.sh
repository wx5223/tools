#!/bin/bash

echo -n Account:
read account
echo -n Password:
read -s password
echo
yum -y install subversion
mkdir -p /var/svn/svnrepos
svnadmin create /var/svn/svnrepos

echo 'svn repo create success'
cp /var/svn/svnrepos/conf/svnserve.conf /var/svn/svnrepos/conf/svnserve.conf.bak
sed -i 's/# anon-access = read/anon-access = none/g' /var/svn/svnrepos/conf/svnserve.conf
sed -i 's/# auth-access = write/auth-access = write/g' /var/svn/svnrepos/conf/svnserve.conf
sed -i 's/# password-db = passwd/password-db = passwd/g' /var/svn/svnrepos/conf/svnserve.conf
sed -i 's/# authz-db = authz/authz-db = authz/g' /var/svn/svnrepos/conf/svnserve.conf

#echo '### config ###' > /var/svn/svnrepos/conf/svnserve.conf
#echo 'anon-access = none' >> /var/svn/svnrepos/conf/svnserve.conf
#echo 'auth-access = write' >> /var/svn/svnrepos/conf/svnserve.conf
#echo 'password-db = passwd' >> /var/svn/svnrepos/conf/svnserve.conf
#echo 'authz-db = authz' >> /var/svn/svnrepos/conf/svnserve.conf
#echo 'realm = /var/svn/svnrepos' >> /var/svn/svnrepos/conf/svnserve.conf
echo '### config ###' >> /var/svn/svnrepos/conf/passwd
echo "$account = $password" >> /var/svn/svnrepos/conf/passwd
echo '### config ###' >> /var/svn/svnrepos/conf/authz
echo '[/]' >> /var/svn/svnrepos/conf/authz
echo "$account=rw" >> /var/svn/svnrepos/conf/authz

echo "write config files"

svnserve -d -r /var/svn/svnrepos

echo "success"
