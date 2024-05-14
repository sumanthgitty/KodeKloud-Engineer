1. Give permission to the file
```
sudo chmod 777 /tmp/nautilus.txt.gpg
```

2. Secure Copy to /tmp directory of App Server 1.
```
sudo scp /tmp/nautilus.txt.gpg tony@stapp01:/tmp
```

3. SSH into App Server 1
```
ssh tony@stapp01
```

4. Copy the file from /tmp directory to /home/webdata
```
sudo cp /tmp/nautilus.txt.gpg /home/webdata
```