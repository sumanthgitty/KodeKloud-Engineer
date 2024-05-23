### Task Question 

The Nautilus application development team was working on a git repository /usr/src/kodekloudrepos/blog present on Storage server in Stratos DC. One of the developers mistakenly created a couple of files under this repository, but now they want to clean this repository without adding/pushing any new files. Find below more details:

Clean the /usr/src/kodekloudrepos/blog git repository without adding/pushing any new files, make sure git status is clean.

### solution 

#### Steps

#### 1.Navigate to the Repository Directory:
Open a terminal and change to the directory of the repository:

```bash
cd /usr/src/kodekloudrepos/blog
```

#### 2.Clean Untracked Files:
Run the git clean -f command to remove untracked files. Adding the -n flag first will perform a dry run and show which files would be deleted without actually deleting them:

```bash
git clean -n  # Dry run (optional)
git clean -f  # Perform the clean operation
```
This will remove any untracked files in the repository.

#### 3.Verify Git Status:
After running git clean, check the status of the repository to ensure that it is clean:

```bash
git status
```
The output should indicate that there are no untracked files or changes to be committed.