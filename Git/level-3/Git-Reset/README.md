### Task Question

The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/blog present on Storage server in Stratos DC. This was just a test repository and one of the developers just pushed a couple of changes for testing, but now they want to clean this repository along with the commit history/work tree, so they want to point back the HEAD and the branch itself to a commit with message add data.txt file. Find below more details:

In /usr/src/kodekloudrepos/blog git repository, reset the git commit history so that there are only two commits in the commit history i.e initial commit and add data.txt file.

Also make sure to push your changes.

### Solution

#### Steps

#### 1.Navigate to the Repository Directory:
Open a terminal and change to the directory of the repository:

```bash
cd /usr/src/kodekloudrepos/blog
```

#### 2.Perform a Hard Reset:
Use the git reset --hard command along with the number of commits you want to reset back by:

```bash
git reset --hard HEAD~10
```
This command will move the HEAD and the branch pointer back by 10 commits, effectively removing the last 10 commits from the commit history.

#### 3.Push the Changes:
Finally, push the changes to the remote repository:

```bash
git push --force origin master
```
With the --force option added to the git push command, it will forcefully update the remote branch with the changes from the local branch, even if the histories don't match.
Replace master with the name of the branch if it's different.

#### 4.# Confirm Changes:
Pull the latest changes from the remote repository to ensure synchronization:

```bash
git pull origin master
```
#### 5.View Commit History:
Use the git log command to view the updated commit history:

```bash
git log
```
