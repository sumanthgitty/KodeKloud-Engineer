### Task Question

The Nautilus application development team has been working on a project repository /opt/official.git. This repo is cloned at /usr/src/kodekloudrepos on storage server in Stratos DC. They recently shared the following requirements with DevOps team:

Create a new branch datacenter in /usr/src/kodekloudrepos/official repo from master and copy the /tmp/index.html file (present on storage server itself) into the repo. Further, add/commit this file in the new branch and merge back that branch into master branch. Finally, push the changes to the origin for both of the branches.

### Solution

#### steps

#### Step 1: Navigate to the repository directory
```bash
cd /usr/src/kodekloudrepos/official
```

#### Step 2: Create and checkout the new branch from master
```bash
git checkout master
git pull origin master
git checkout -b datacenter
```

#### Step 3: Copy the index.html file into the repository
```bash
cp /tmp/index.html .
```

#### Step 4: Add and commit the file in the new branch
```bash
git add index.html
git commit -m "Add index.html file to datacenter branch"
```

#### Step 5: Merge the new branch back into master
```bash
git checkout master
git merge datacenter
```
#### Step 6: Push changes to the remote repository for both branches
```bash
git push origin master
git push origin datacenter
```