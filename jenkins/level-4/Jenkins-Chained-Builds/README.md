### Task Question

The DevOps team was looking for a solution where they want to restart the Apache service on all app servers if the deployment goes fine on these servers in Stratos Datacenter. After having a discussion, they came up with a solution to use Jenkins chained builds so that they can use a downstream job for services which should only be triggered by the deployment job. So as per the requirements mentioned below configure the required Jenkins jobs.

Create a Jenkins job named nautilus-app-deployment and configure it to pull changes from the master branch of web repository on Storage server under /var/www/html directory, which is already a local git repository tracking the origin web repository. Since /var/www/html on Storage server is a shared volume so changes should auto reflect on all apps.

Create another Jenkins job named manage-services and make it a downstream job for nautilus-app-deployment job. Things to take care about this job are:

a. This job should restart httpd service on all app servers.

b. Trigger this job only if the upstream job i.e. nautilus-app-deployment is stable.