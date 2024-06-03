### Question

A new developer just joined the Nautilus development team and has been assigned a new project for which he needs to create a new repository under his account on Gitea server. Additionally, there is some existing data that need to be added to the repo. Below you can find more details about the task:

Click on the Gitea UI button on the top bar. You should be able to access the Gitea UI. Login to Gitea server using username max and password Max_pass123.


a. Create a new git repository story_news under max user.

b. SSH into storage server using user max and password Max_pass123 and clone this newly created repository under user max home directory i.e /home/max.

c. Copy all files from location /usr/itadmin to the repository and commit/push your changes to the master branch. The commit message must be "add stories" (must be done in single commit).

d. Create a new branch max_demo from master.

e. Copy a file story-index-max.txt from location /tmp/stories/ to the repository. This file has a typo, which you can fix by changing the word Mooose to Mouse. Commit and push the changes to the newly created branch. Commit message must be "typo fixed for Mooose" (must be done in single commit).

### Solution

#### Steps

#### 1.Create a new repository on Gitea:

Log in to Gitea with the username max and password Max_pass123.
Click on the "+" icon on the top right corner and select "New Repository".
Fill in the repository details:
Repository name: story_news
Description (optional): Add a description if needed.
Visibility: Set as per your requirement (Public or Private).
Initialize this repository with a README: Uncheck this option.
Click on "Create Repository" to create the new repository.

#### 2.Clone the repository on the storage server:

SSH into the storage server as user max using the provided credentials.
Clone the newly created repository into the user's home directory:

```bash
cd /home/max
git clone <repository_url>
```

#### 3.Copy files to the repository and commit/push:

Copy all files from /usr/itadmin to the cloned repository directory.
Commit the changes with the message "add stories":
```bash
cd story_news
git add .
git commit -m "add stories"
git push origin master
```

#### 4.Create a new branch max_demo from master:

``` bash
git checkout -b max_demo master
```

#### 5.Copy a file and fix the typo:

Copy the file story-index-max.txt from /tmp/stories/ to the repository directory.
Fix the typo by changing "Mooose" to "Mouse" in the file.
Commit the changes with the message "typo fixed for Mooose":

```bash
git add story-index-max.txt
git commit -m "typo fixed for Mooose"
git push origin max_demo
```