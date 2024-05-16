### Step 1: Update Index.html and Push to Master

SSH into the Storage Server.
Navigate to the directory where the index.html file is located on storage server (/var/www/html).

Update the content of the index.html file to "Welcome to xFusionCorp Industries".

Add and commit your changes:
```bash

git add index.html
git commit -m "Update index.html"

```
Push your changes to the master branch of the origin repository:
```bash

git push origin master
```

### Step 2: Install Jenkins Plugins and Java on Storage Server

Access the Jenkins UI and log in using your credentials.
Navigate to "Manage Jenkins" > "Manage Plugins".
Install the necessary plugins: SSH, SSH Agents, Pipeline, Git, etc.
Next, SSH into the Storage Server.
Install Java on the Storage Server since we want the job to run on storage server:
``` bash

yum search java*
sudo yum install java
```

### Step 3: Configure Jenkins Agent

Access the Jenkins UI and log in.
Navigate to "Manage Jenkins" > "Manage Nodes and Clouds" > "New Node".
Set the following configurations:
Node Name : ststor01
Remote Directory: /var/www/html
Labels: ststor01
Usage: Only build jobs with label expressions matching this node
Save the configuration.

### Step 4: Create Jenkins Pipeline Job

In Jenkins, navigate to the dashboard and click on "New Item".

Enter a name for your pipeline job (e.g., deploy-job) and select "Pipeline" as the job type.

Configure the pipeline script as follows:

```groovy

pipeline {
    agent {
        label 'ststor01'
    }

    stages {
        stage ('Deploy') {
            steps {
                script {
                    git branch: "master", url: "http://git.stratos.xfusioncorp.com/sarah/web.git"

                    sh 'cp -r /var/www/html/workspace/deploy-job/* /var/www/html'
                }
            }
        }

        stage ('Test') {
            steps {
                // Test if website accessible or not
                script {

                    def response = sh(script: 'curl -s -o /dev/null -w "%{http_code}" http://stlb01:8091', returnStdout: true).trim()
                    if (response == '200') {
                        echo "website is accessible"
                    } else {
                        echo "website is not accessible"
                    } 
                }
            }
        }
    }
}

```
Save the job configuration.

### Step 5: Run the Jenkins Pipeline Job

Trigger the deploy-job pipeline manually or let it run automatically.
Monitor the build process in the Jenkins UI to ensure successful execution.

### Step 6: Verify Website Accessibility

Access the Jenkins UI and navigate to the deploy-job build.
Check the console output to ensure that the pipeline stages were executed successfully.

Additionally, you can test the accessibility of the website by running the following command from the jump host:
```bash
curl http://stlb01:8091
```
Ensure that the website loads without errors.