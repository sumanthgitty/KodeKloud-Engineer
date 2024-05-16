### 1.Access Jenkins and Gitea UIs:

Click on the Jenkins button on the top bar to access the Jenkins UI.
Log in using the username admin and password Adm!n321.

Similarly, click on the Gitea button on the top bar to access the Gitea UI.
Log in using the username sarah and password Sarah_pass123.

### 2.Push Dockerfile to Git Repository:

Ensure the Dockerfile is present in the sarah/web repository.

If not already pushed, push the Dockerfile to the origin repository using git add commit and push command.

### 3.Install necessary plugin and setup agent 

install plugin ssh, ssh on agent, git, pipeline etc.

setup agent node called app-3 with the label and remote dir because we need to run pipeline job in appserver3. 

### 4.Create Jenkins Pipeline Job:

In Jenkins, navigate to the dashboard and click on "New Item".
Enter the name node-app for the pipeline job and select "Pipeline" as the job type.
Configure Pipeline Job:

Configure the pipeline job as follows:

Set it to deploy the app on App Server 3.

Define two stages: Build and Deploy (ensure case sensitivity).
Use the following pipeline script:

```groovy

pipeline {
    agent {
        label 'stapp03'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t stregi01.stratos.xfusioncorp.com:5000/node-app:latest .'
                    
                    // Push Docker image to registry
                    sh 'docker push stregi01.stratos.xfusioncorp.com:5000/node-app:latest'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Create and run Docker container
                    sh 'docker run -d --name node-app -p 8080:8080 stregi01.stratos.xfusioncorp.com:5000/node-app:latest'
                }
            }
        }
    }
}
```
Save and Run the Job:

Save the job configuration.

Trigger the node-app pipeline job manually or let it run automatically.

### 6.Verify Deployment:

Monitor the build process in the Jenkins UI to ensure successful execution.

Verify that the container named node-app is running on App Server 3.
Test the app's accessibility by accessing it via http://<App Server 3 IP>:8080 or curl stapp03:8080 from the jump server.

This completes the setup and deployment of the Node.js application using Jenkins pipeline on App Server 3.