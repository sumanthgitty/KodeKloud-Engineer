### Task Question

One of the DevOps engineers was working on to create a Dockerfile for Nginx. We need to build an image using that Dockerfile. The deployment must be done using a Jenkins pipeline. Below you can find more details about the same.



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


Similarly, click on the Gitea button on the top bar to access the Gitea UI. Login using username sarah and password Sarah_pass123. There is a repository named sarah/web in Gitea.


Create/configure a Jenkins pipeline job named nginx-container, configure it to run on server App Server 2.


The pipeline can have just one stage named Build. (name is case sensitive)


In the Build stage, build an image named stregi01.stratos.xfusioncorp.com:5000/nginx:latest using the Dockerfile present under the Git repository. stregi01.stratos.xfusioncorp.com:5000 is the image registry server. After building the image push the same to the image registry server.