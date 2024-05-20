### Task Question

The Nautilus development team started with new project development. They have created different Git repositories to manage respective project's source code. One of the repositories /opt/news.git was created recently. The team has given us a sample index.html file that is currently present on jump host under /tmp directory. The repository has been cloned at /usr/src/kodekloudrepos on storage server in Stratos DC.

Copy sample index.html file from jump host to storage server under cloned repository at /usr/src/kodekloudrepos/news, further add/commit the file and push to the master branch.

### Solution

#### 1.Copy the index.html File:
Use the scp command to copy the index.html file from the jump host to the storage server. Assuming the file is located at /tmp/index.html on the jump host and you are logged in to the storage server, run:

```bash
sudo su                         #because file is owned by root
scp /tmp/index.html user@Storage_ip:/usr/src/kodekloudrepos/news/
```

#### 2.Navigate to the Repository:
After copying the file, navigate to the cloned repository on the storage server:

```bash
cd /usr/src/kodekloudrepos/news
```

#### 3.Add and Commit the File:

Add the index.html file to the staging area and commit it to the repository:

```bash
git add index.html
git commit -m "Add index.html file"
git push origin master
```

By following these steps, you will copy the sample index.html file from the jump host to the storage server under the cloned repository at /usr/src/kodekloudrepos/news, add, commit, and push the file to the master branch of the Git repository.