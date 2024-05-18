### Steps

#### 1.Access Jenkins and Gitea UIs:

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.
Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123.

# Also add necessary plugins like git, pipeline, SSH, SSH on agent in jenkins and Restart the jenkins.

#### 2.Install Java on Storage Server and Add Slave Node in Jenkins :

Go to Jenkins UI.
Navigate to "Manage Jenkins" > "Manage Nodes and Clouds" > "New Node".
Set the node name as Storage Server.
Configure the node as follows:
Remote root directory: /var/www/html
Labels: ststor01
Save the configuration.

#### 3.Clone Repository:

Ensure that the web_app repository is cloned on the Storage Server under /var/www/html.

#### 4.Install Apache:

Ensure that Apache is installed and running on all App Servers, listening on port 8080.

#### 5.Create Jenkins Pipeline Job:

Go to Jenkins UI.
Click on "New Item" to create a new pipeline job.
Enter the name as devops-webapp-job.
Choose "Pipeline" and click "OK".

Configure the pipeline as follows:
Agent: Select ststor01 from the labels dropdown.

Parameters:
Add a string parameter named BRANCH.
Choices: master, feature
Description: "Select branch to deploy"

Pipeline Script:
```groovy

pipeline {
    agent {
        label 'ststor01'
    }
    
    parameters {
        choice(name: 'BRANCH', choices: ['master', 'feature'], description: 'Select branch to deploy')
    }
    
    stages {
        stage ('Deploy') {
            steps {
                script {
                    if (params.BRANCH == 'master') {
                        git branch: 'master', url: 'http://git.stratos.xfusioncorp.com/sarah/web_app.git'
                    } else if (params.BRANCH == 'feature') {
                        git branch: 'feature', url: 'http://git.stratos.xfusioncorp.com/sarah/web_app.git'
                    }
                    sh 'cp -r /var/www/html/workspace/datacenter-webapp-job/* /var/www/html/'
                }
            }
        }
    }
}

```
Save the configuration.

#### 6.Verify Deployment:

Access the LB server URL (https://<LBR-URL>) to ensure the website is accessible without any sub-directory.