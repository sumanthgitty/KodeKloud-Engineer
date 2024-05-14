1. SSH into App Server 2
```
ssh steve@stapp02
sudo -i
```

2. checking files and folders
```
ls -lh /home/usersdata
```

3. Find the file name by user `ammar` & copy with folder structure
```
find /home/usersdata/ -type f -user ammar -exec cp --parents {} /blog \;
```

4. List the copied files in the destination folder
```
ll /blog/home/usersdata
```