### Task Question

The Nautilus development team shared with the DevOps team requirements for new application development, setting up a Git repository for that project. Create a Git repository on Storage server in Stratos DC as per details given below:

Install git package using yum on Storage server.

After that, create/init a git repository named /opt/blog.git (use the exact name as asked and make sure not to create a bare repository).

### Solution

#### steps

1.Install Git:

```bash
sudo yum install git -y
```

2.Create the Git repository:

```bash
cd /opt/
git init blog.git
```