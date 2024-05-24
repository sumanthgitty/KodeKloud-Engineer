### Task 

The Nautilus application development team has been working on a project repository /opt/demo.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with the DevOps team:

There are two branches in this repository, master and feature. One of the developers is working on the feature branch and their work is still in progress, however they want to merge one of the commits from the feature branch to the master branch, the message for the commit that needs to be merged into master is Update info.txt. Accomplish this task for them, also remember to push your changes eventually.

### Solution

#### Steps

#### 1.Navigate to the Repository Directory:

```bash
cd /usr/src/kodekloudrepos/blog
```

#### 2.Checkout to Master Branch:

```bash
git checkout master
```

#### 3.Identify the Commit Hash:

```bash
git log feature --grep="Update info.txt"
```

#### 4.Find the commit hash for the commit with the message "Update info.txt".

Cherry-Pick the Commit:

```bash
git cherry-pick <commit>
```

#### 5.Push Changes to Origin:

```bash
git push origin master
```