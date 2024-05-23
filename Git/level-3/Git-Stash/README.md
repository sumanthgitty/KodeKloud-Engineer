### Task Question

The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/games present on Storage server in Stratos DC. One of the developers stashed some in-progress changes in this repository, but now they want to restore some of the stashed changes. Find below more details to accomplish this task:

Look for the stashed changes under /usr/src/kodekloudrepos/games git repository, and restore the stash with stash@{1} identifier. Further, commit and push your changes to the origin.

### Solution

#### 1.Navigate to the Repository Directory:
Open a terminal and change to the directory of the repository:

```bash
cd /usr/src/kodekloudrepos/games
```

#### 2.List Stashed Changes:
View the list of stashed changes to identify the one you want to restore:

```bash
git stash list
```

#### 3.Apply Stashed Changes:
Apply the stashed changes identified by stash@{1}:

```bash
git stash apply stash@{1}
```

#### 4.Commit Changes:
Commit the applied changes:

```bash
git commit -m "Restored stashed changes"
```

#### 5.Push Changes to Origin:
Finally, push the changes to the remote repository:

```bash
git push origin master
```

Replace master with the appropriate branch name if it's different.