### Task Question 

The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/cluster present on Storage server in Stratos DC. However, they reported an issue with the recent commits being pushed to this repo. They have asked the DevOps team to revert repo HEAD to last commit. Below are more details about the task:

In /usr/src/kodekloudrepos/cluster git repository, revert the latest commit ( HEAD ) to the previous commit (JFYI the previous commit hash should be with initial commit message ).

Use revert cluster message (please use all small letters for commit message) for the new revert commit.

### Solution

#### Steps

#### 1.Navigate to the Repository Directory:
Open your terminal and change to the directory of the repository:

```bash
cd /usr/src/kodekloudrepos/cluster
```

#### 2.Revert the Latest Commit:
Use the git revert command to undo the latest commit (HEAD). This command will open your default text editor for commit messages:

```bash
git revert HEAD
```
The default text editor will open with a message similar to:

```bash

Revert "Previous commit message"

This reverts commit [commit hash].

# Please enter the commit message for your changes. Lines starting
# with '#' will be ignored, and an empty message aborts the commit.
#
# On branch master
# Your branch is up to date with 'origin/master'.
#
# Changes to be committed:
#       new file:   info.txt
#
# Untracked files:
#       cluster.txt
```
If you do not change the commit message here, proceed with the default message or modify it as necessary.

#### 4.Add Untracked Files (if any):
If you have untracked files that need to be included in the commit, add them using:

```bash
git add .
```

#### 5.Commit the Changes with a Specific Message:
If you skipped modifying the commit message in the text editor, or need to add a specific commit message afterward, use:

```bash
git commit -m "revert cluster"
```

#### 6.Verify the Revert:
Check the git log to ensure that the revert commit has been successfully applied with the correct message:

```bash
git log --oneline
```