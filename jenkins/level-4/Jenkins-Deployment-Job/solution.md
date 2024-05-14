### Automate Deployment of Web Application

1.Install and Configure httpd on All App Servers:

Manually install httpd on all app servers using the default version available in the yum repository.
Configure httpd to serve on port 8080 on all app servers by editing the httpd configuration file present under /etc/httpd/conf/.

2.Configure Jenkins Job for Automatic Deployment:

Create Jenkins Job:
Name: nautilus-app-deployment
Configuration:
Configure as a Pipeline job.

Set the agent to run on "Storage Server" so you have to create agent node before creating job and set the label to tstor01 and also remote dir to /var/www/html.

Define triggers to poll SCM every minute.

Define stages in the pipeline:

```groovy

pipeline {
    agent {
        label 'ststor01'
    }
    triggers {
        pollSCM('* * * * *') // Poll SCM every minute
    }
    stages {
        stage('Build and Deploy') {
            steps {
                script {
                    // Clone the repository
                    git url: 'http://git.stratos.xfusioncorp.com/sarah/web.git', branch: 'master'
                    
                    // Deploy code to Storage server
                    sh 'cp -r /var/www/html/workspace/nautilus-app-deployment/* /var/www/html/'
                }
            }
        }
    }
}
```

3.Update and Push Changes to Git Repository:

SSH into the Storage Server using sarah's user credentials.
Update the content of the index.html file in the cloned Git repository named web under sarah user's home to "Welcome to the xFusionCorp Industries".
Push the changes to the origin repository in the master branch.

After you update a file, the job will automatically execute.