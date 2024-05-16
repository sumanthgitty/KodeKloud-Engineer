#### 1.Update index.html on dev branch:

Navigate to the /home/natasha/mr_job directory.
Update the content of index.html file on the dev branch from "Welcome to Nautilus Group!" to "Welcome to xFusionCorp Industries!".
Push the changes to the origin repository.

#### 2.Merge Pull Request:

Login to the Gitea server.
Find the pull request titled "My First PR" under the mr_job repository.
Merge the pull request.

#### 3.Install Necessary Plugins and Java on App Server 3:

Access App Server 3.
Install required Jenkins plugins such as SSH, SSH Agent, Git, Pipeline, etc.
Install Java on App Server 3.

#### 4.Configure Jenkins Agent on App Server 3 with label and remote directory:

Add a Jenkins agent for App Server 3.
Label the agent as stapp03.

#### 5.Configure Jenkins Pipeline Job:

Create a Jenkins pipeline job named nginx-container.
Configure the pipeline with two stages: Build and Deploy.
```bash

pipeline {
    agent {
        label 'stapp03'
    }

    stages {
        stage('Build') {
            steps {
                script{
                    git branch: 'master', url: "git url"

                    sh 'docker build -t stregi01.stratos.xfusioncorp.com:5000/nginx:latest .'
                    sh 'docker push stregi01.stratos.xfusioncorp.com:5000'
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d --name nginx-app -p 8080:8080 stregi01.stratos.xfusioncorp.com:5000/nginx:latest'
                }
            }
        }
    }
}

```

In the Build stage, clone the sarah/mr_job repository and build the Docker image stregi01.stratos.xfusioncorp.com:5000/nginx:latest using the Dockerfile present in the repository's root.

Push the built image to the image registry server.

In the Deploy stage, create a container named nginx-app using the built image, ensuring that the container's port is mapped to the host port 8080 and running the container in detached mode.

#### 6.Test the Application:

Ensure that at least one successful build is recorded in the job history.
Test the application using the command curl http://stapp03:8080 from the jump host.