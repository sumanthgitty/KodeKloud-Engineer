### Task Question

The Nautilus application development team is working on to develop a Node app. They are still in the development phase however they want to deploy and test their app on a containerized environment and using a Jenkins pipeline. Please find below more details to complete this task.


Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123.

There is a repository named sarah/web in Gitea, which is cloned on the Storage server under /home/sarah/web directory.


A Dockerfile is already present under the git repository, please push the same to the origin repo if not pushed already.


Create a jenkins pipeline job named node-app and configure it as below:


Configure it to deploy the app on App Server 3

The pipeline must have two stages Build and Deploy (names are case sensitive)


In the Build stage, build an image named stregi01.stratos.xfusioncorp.com:5000/node-app:latest using the Dockerfile present under the Git repository. stregi01.stratos.xfusioncorp.com:5000 is the image registry server. After building the image push the same to the image registry server.


In the Deploy stage, create a container named node-app using the image you build it the Build stage. Make sure to map the container port with host port 8080.