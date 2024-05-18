### Steps

#### 1.Install Java on Slave Machines:

```bash
sudo yum install -y <java-version>
```
#### 2.Generate SSH Key on Jenkins Server and Copy to All App Servers:

```bash
ssh-keygen -t rsa
ssh-copy-id tony@app_server_1_ip
ssh-copy-id steve@app_server_2_ip
ssh-copy-id banner@app_server_3_ip
```

#### 3.Install Necessary Plugins in Jenkins:

SSH
SSH Slaves Plugin
SSH Agent Plugin


#### 4.Add Credentials for App Servers in Jenkins:

Add SSH credentials for tony, steve, and banner.

#### 5.Add New Nodes in Jenkins:

Create nodes with the following details:

App Server 1:

Node name: App_server_1
Type: Permanent Agent
Remote root directory: /home/tony/jenkins
Labels: stapp01
Launch method: Launch agents via SSH
Host: app_server_1_ip
Credentials: App_server_1_cred
Availability: Keep this agent online as much as possible

App Server 2:

Node name: App_server_2
Type: Permanent Agent
Remote root directory: /home/steve/jenkins
Labels: stapp02
Launch method: Launch agents via SSH
Host: app_server_2_ip
Credentials: App_server_2_cred
Availability: Keep this agent online as much as possible

App Server 3:

Node name: App_server_3
Type: Permanent Agent
Remote root directory: /home/banner/jenkins
Labels: stapp03
Launch method: Launch agents via SSH
Host: app_server_3_ip
Credentials: App_server_3_cred
Availability: Keep this agent online as much as possible

#### 6.Verify Nodes are Online and Working:

Navigate to Manage Jenkins > Manage Nodes and Clouds.

Check the status of each node (App_server_1, App_server_2, App_server_3) to ensure they are online.