# Building and Deploying Nginx Docker Image using Jenkins Pipeline

## Step 1: Prepare the App Server 2

1. **Install Java on App Server 2:**
   - SSH into App Server 2.
   - Install Java using the following commands:
     ```sh
     sudo apt update
     sudo apt install openjdk-11-jdk -y
     ```

## Step 2: Configure Jenkins

1. **Install Necessary Plugins:**
   - From the Jenkins dashboard, go to `Manage Jenkins` > `Manage Plugins`.
   - Click on the `Available` tab and search for the following plugins:
     - `Git`
     - `SSH Agent`
     - `Pipeline`
   - Select the plugins and click on `Install without restart`.

2. **Add Credentials for App Server 2:**
   - Go to `Manage Jenkins` > `Manage Credentials` > `(global)` > `Add Credentials`.
   - Select `SSH Username with password`.
   - Enter the following details:
     - **Username:** `tony`
     - **Password:** `your_password_for_app_server_2`
   - Click `OK` to save the credentials.

3. **Add App Server 2 as a Jenkins Agent:**
   - Go to `Manage Jenkins` > `Manage Nodes and Clouds` > `New Node`.
   - Enter the details for App Server 2:
     - **Node Name:** `App_server_2`
     - **Type:** `Permanent Agent`
     - **Remote Root Directory:** `/home/tony/jenkins`
     - **Labels:** `stapp02`
     - **Launch method:** `Launch agents via SSH`
     - **Host:** `app_server_2_ip`
     - **Credentials:** Select the SSH credentials added in Jenkins.
     - **Availability:** `Keep this agent online as much as possible`
   - Save the configuration.

## Step 3: Create Jenkins Pipeline Job

1. **Create Pipeline Job:**
   - Go to the Jenkins dashboard, click on `New Item`.
   - Enter `nginx-container` as the name, select `Pipeline`, and click `OK`.

2. **Configure the Pipeline:**
   - In the pipeline configuration, scroll down to the `Pipeline` section.
   - Select `Pipeline script` and enter the following script:
     ```groovy
     pipeline {
         agent {
             label 'stapp02'
         }

         stages {
             stage('Build') {
                 steps {
                     git branch: 'master', url: 'http://git.stratos.xfusioncorp.com/sarah/web.git'

                     sh 'docker build -t stregi01.stratos.xfusioncorp.com:5000/nginx:latest .'
                     sh 'docker push stregi01.stratos.xfusioncorp.com:5000/nginx:latest'
                 }
             }
         }
     }
     ```

3. **Save and Build:**
   - Click `Save` to apply the configuration.
   - Trigger the build by clicking `Build Now`.

To verify if the task has been completed successfully, you can use the curl command to check if the Docker image is running as expected. Here's how you can do it:

# Run the curl command to check if the Docker container is running
curl -I http://app_server_2_ip:8080