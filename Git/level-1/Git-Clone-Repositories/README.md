### Task Question

DevOps team created a new Git repository last week; however, as of now no team is using it. The Nautilus application development team recently asked for a copy of that repo on Storage server in Stratos DC. Please clone the repo as per details shared below:

The repo that needs to be cloned is /opt/news.git

Clone this git repository under /usr/src/kodekloudrepos directory. Please do not try to make any changes in the repo.

### Solution

#### 1.Navigate to the Target Directory:
Open a terminal or connect to the Storage server via SSH, then navigate to the /usr/src/kodekloudrepos directory:

```bash
cd /usr/src/kodekloudrepos
```
#### 2.Clone the Repository:
Use the git clone command to clone the repository from /opt/news.git:

```bash
git clone /opt/news.git
```
#### 3.Verify Clone:
After the cloning process is complete, you can verify that the repository has been cloned successfully by listing the contents of the /usr/src/kodekloudrepos directory:

```bash
ls -l
```