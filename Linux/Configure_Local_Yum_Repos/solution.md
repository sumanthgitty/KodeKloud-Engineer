1. SSH into the Backup server
```
ssh clint@stbkp01
sudo -i
```

2. Check for any yum repository available
```
yum repolist
```

3. In absence of none, create a local repo in `/etc/yum.repos.d/`
```
vi /etc/yum.repos.d/local_yum.repo

Insert the following

[local_yum]

name=local_yum

baseurl=file:///packages/downloaded_rpms/

enabled = 1

gpgcheck = 0
```

4. Save and check the repo created
```
esc + :wq
yum repolist
```

5. Install httpd as per task
```
yum install httpd -y
```

6. Validate installation to the local repo
```
yum list httpd
```