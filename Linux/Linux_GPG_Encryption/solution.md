1. SSH into the storage server.
```
ssh natasha@ststor01
sudo -i
```

2. cd into /home directory.
```
cd /home/
ll
```

3. Import gpg Private & Public Key.
```
gpg --import public_key.asc
gpg --import private_key.asc
```

4. Verify the imported keys.
```
gpg --list-keys
gpg --list-secret-keys
```

5. Encrypt the file `encrypt_me.txt` to asc in the same folder path.
```
gpg --encrypt -r kodekloud@kodekloud.com --armor < encrypt_me.txt  -o encrypted_me.asc
```

6. Decrypt `decrypt_me.asc` to txt using the given passphrase, within the same folder path.
```
gpg --decrypt decrypt_me.asc > decrypted_me.txt
```

7. Check the encrypted and decrypted files in `/home`, and validate the files by `cat` to display the output.
```
ll
cat decrypted_me.txt
cat decrypt_me.asc
cat encrypt_me.txt
cat encrypted_me.asc
```

