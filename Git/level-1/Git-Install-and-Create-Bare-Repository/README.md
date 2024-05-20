### Task Question

The Nautilus development team shared requirements with the DevOps team regarding new application development.—specifically, they want to set up a Git repository for that project. Create a Git repository on Storage server in Stratos DC as per details given below:



Install git package using yum on Storage server.


After that create a bare repository /opt/official.git (make sure to use exact name).

### Solution 

#### 1.Install Git using yum:
Connect to your Storage server via SSH (ssh user@ip) and run the following command to install Git:

```bash
sudo yum install git -y
```

#### 2.Create the Bare Repository:
Once Git is installed, you can create a bare repository using the git init command with the --bare option. Navigate to the /opt directory and run the following command:

```bash
cd /opt
git init --bare official.git
```

#### 3.Verify Repository Creation:
You can verify that the bare repository has been created by listing the contents of the /opt directory:

```bash
ls -l /opt
```
You should see the official.git directory listed, indicating that the bare repository has been successfully created.