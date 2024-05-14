### nautilus-app-deployment Job:

#### Steps:

##### 1.Generate SSH Key Pair:

```bash

ssh-keygen -t rsa -b 4096 -C "jenkins@jenkins-server"
ssh-copy-id user@server1
ssh-copy-id user@server2
ssh-copy-id user@server3
```

##### 2.Configure Jenkins:

Install necessary plugins.
Add Git credentials.
Create Jenkins agent node for storage and set remote dir to /var/www/html and also add label.

##### 3.Create Jenkins Job:

Configure as a Pipeline job.

Set agent to run on "Storage Server".
Define stages in the pipeline:

```groovy

pipeline {
    agent {
        label 'Storage Server'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'http://git.stratos.xfusioncorp.com/sarah/web.git'
            }
        }
        stage('Deploy') {
            steps {
                sh 'cp -r /var/www/html/workspace/devops-webapp-job/* /var/www/html/'
            }
        }
    }
}
```
Test and Run the Job.

### manage-services Job:

#### Steps:

##### 1.Configure as a Freestyle project.

Set as downstream job of nautilus-app-deployment.
Configure Build Triggers:

Add build trigger to only execute when upstream job is stable.

##### 2.Define Build Steps:

Add build step to execute shell commands.
```
ssh user@server1 'sudo systemctl restart httpd'
ssh user@server2 'sudo systemctl restart httpd'
ssh user@server3 'sudo systemctl restart httpd'
```
##### 3.Save the job configuration.
Trigger the job manually or let it run automatically when the nautilus-app-deployment job completes successfully.