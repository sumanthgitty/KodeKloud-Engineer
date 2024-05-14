1. SSH into App server 3

```
ssh banner@stapp03
sudo -i
```

2. Create directory

`mkdir -p /devops/data`

3. Create group (devops)

`groupadd devops`

4. Change directory group ownership to devops

`chgrp -R devops /devops/data`

Grant permission `read/write/execute` to group (devops) and no access to `others`

`chmod 770 /devops/data`

