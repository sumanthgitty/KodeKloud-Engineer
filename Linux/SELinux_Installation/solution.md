1. Checking the linux server distro
```
cat /etc/os-release
```

2. Updating the server
```
yum update -y
```

3. Installing SELinux Packages
```
yum install policycoreutils-python -y
yum install setools setools-console setroubleshoot* -y
yum install policycoreutils-devel -y
```

4. Checking SELinux status
```
sestatus
```
OR
```
getenforce
```

5. Changing the selinux status from `enforcing` to `disabled`
```
vi /etc/selinux/config
```

