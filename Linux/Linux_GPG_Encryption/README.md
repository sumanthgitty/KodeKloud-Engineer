# Linux GPG Encryption

GPG, or GnuPG, stands for GNU Privacy Guard. The GPG Project provides the tools and libraries to allows users to interface with a GUI or command line to integrate encryption with emails and operating systems like Linux.
GPG includes the tools you need to use public-key encryption and digital signatures on your Linux system.

## Task:

We have confidential data that needs to be transferred to a remote location, so we need to encrypt that data. We also need to decrypt data we received from a remote location in order to understand its content.

On storage server in Stratos Datacenter, we have private and public keys stored `/home/*_key.asc`. Use those keys to perform the following actions.
Encrypt `/home/encrypt_me.txt` to `/home/encrypted_me.asc`.
Decrypt `/home/decrypt_me.asc` to `/home/decrypted_me.txt`.
(Passphrase for decryption and encryption is kodekloud).