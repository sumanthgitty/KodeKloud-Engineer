1. SSH into App server2 as root user

2. Use the `find` command to execute the task
```
find /var/www/html/beta -type f -name '*.js' -exec cp --parents {} /beta \;
```

3. Validate task
```
ll /beta
```