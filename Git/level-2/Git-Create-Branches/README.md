### Task Question

Nautilus developers are actively working on one of the project repositories, /usr/src/kodekloudrepos/news. Recently, they decided to implement some new features in the application, and they want to maintain those new changes in a separate branch. Below are the requirements that have been shared with the DevOps team:

On Storage server in Stratos DC create a new branch xfusioncorp_news from master branch in /usr/src/kodekloudrepos/news git repo.

### Solution

#### steps

Navigate to the Repository Directory:

```bash
cd /usr/src/kodekloudrepos/news
```

Ensure You Are on the master Branch:

```bash
git checkout master
```
Create the New Branch xfusioncorp_news from the master Branch:

```bash
git checkout -b xfusioncorp_news
```

Additionally you can Push the New Branch to the Remote Repository:

```bash
git push origin xfusioncorp_news
```