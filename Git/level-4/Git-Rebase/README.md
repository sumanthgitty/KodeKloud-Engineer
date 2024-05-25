### Task
The Nautilus application development team has been working on a project repository /opt/cluster.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:

One of the developers is working on feature branch and their work is still in progress, however there are some changes which have been pushed into the master branch, the developer now wants to rebase the feature branch with the master branch without loosing any data from the feature branch, also they don't want to add any merge commit by simply merging the master branch into the feature branch. Accomplish this task as per requirements mentioned.

Also remember to push your changes once done.

### Solution

#### Step 1. Navigate to the repository directory
```bash
cd /usr/src/kodekloudrepos/games
```

#### Step 2: Check out the feature branch
```bash
git checkout feature
```

#### Step 3: Rebase the feature branch onto master
```bash
git rebase master
```
#### Step 4: Resolve any conflicts, if they arise
#### Resolve conflicts in your editor, then:
```bash
git add <resolved_file>
git rebase --continue
```

#### Step 5: Force push the rebased feature branch to the remote repository
```bash
git push origin feature --force
```
Use --force or --force-with-lease to push after a rebase to update the remote branch.