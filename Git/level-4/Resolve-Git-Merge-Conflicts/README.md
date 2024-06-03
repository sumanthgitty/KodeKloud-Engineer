#### Question

Sarah and Max were working on writting some stories which they have pushed to the repository. Max has recently added some new changes and is trying to push them to the repository but he is facing some issues. Below you can find more details:


SSH into storage server using user max and password Max_pass123. Under /home/max you will find the story-blog repository. Try to push the changes to the origin repo and fix the issues. The story-index.txt must have titles for all 4 stories. Additionally, there is a typo in The Lion and the Mooose line where Mooose should be Mouse.


Click on the Gitea UI button on the top bar. You should be able to access the Gitea page. You can login to Gitea server from UI using username sarah and password Sarah_pass123 or username max and password Max_pass123.


### Solution

#### Steps:

#### 1.SSH into the storage server as user max:

```bash
ssh max@<storage_server_ip>
```
Use the password Max_pass123 when prompted.

#### 2.Navigate to the story-blog repository:

```bash
cd /home/max/story-blog
```

#### 3.Update the story-index.txt file:

Open the story-index.txt file in a text editor.
Ensure that titles are provided for all 4 stories.
Fix the typo in "The Lion and the Mooose" line to "The Lion and the Mouse".
Stage and commit the changes:

```bash
git add story-index.txt
git commit -m "Updated story index with titles and fixed typo"
```

#### 4.Pull changes from the origin repository:

```bash
git pull origin master
```

#### 5.Resolve merge conflicts:

If merge conflicts occur, open the story-index.txt file.
Look for lines marked with <<<<<<< HEAD and >>>>>>> <commit_id>.
Resolve the conflicts by choosing which changes to keep or combining them as needed.
Remove the conflict markers (<<<<<<< HEAD, =======, >>>>>>> <commit_id>).
Save the file.
Stage and commit the resolved changes:

```bash
git add story-index.txt
git commit -m "Resolved merge conflicts"
```

#### 6.Push the changes to the origin repository:

```bash
git push origin master
```

#### 7.Access Gitea UI:

Open a web browser and navigate to the Gitea server.
Click on the Gitea UI button.
Log in to Gitea using the username max and password Max_pass123.

#### 8.Verify the changes:

Once logged in, navigate to the story-blog repository.
Ensure that the changes reflect correctly, including the updated story titles and the resolved merge conflicts.