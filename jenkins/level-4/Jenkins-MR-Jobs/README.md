### Task Question

There is a repository named sarah/mr_job in Gitea, which is cloned on the Storage server under /home/natasha/mr_job directory.

Update the index.html file under dev branch, and change its content from Welcome to Nautilus Group! to Welcome to xFusionCorp Industries!. Remember to push your changes to the origin repository.


After pushing the required changes, login to the Gitea server and you will find a pull request with title My First PR under mr_job repository. Merge this pull request.


Create/configure a Jenkins pipeline job named nginx-container, configure a pipeline as per details given below and run the pipeline on server App Server 1.


The pipeline must have two stages Build and Deploy (names are case sensitive).

In the Build stage, first clone the sarah/mr_job repository, then build an image named stregi01.stratos.xfusioncorp.com:5000/nginx:latest using the Dockerfile present under the root of the repository. stregi01.stratos.xfusioncorp.com:5000 is the image registry server. After building the image push the same to the image registry server.

In the Deploy stage, create a container named nginx-app using the image you built in the Build stage. Make sure to map container port to the host port 8080 and run the container in detached mode.

Make sure to build a successful job at least once so that you have at least one successful build # in the job history. Further, you can test the app using command curl http://stapp01:8080 from the jump host.
