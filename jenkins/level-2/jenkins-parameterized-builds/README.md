## Jenkins Parameterized Builds

### Problem

A new DevOps Engineer has joined the team and he will be assigned some Jenkins related tasks. Before that, the team
wanted to test a simple parameterized job to understand basic functionality of parameterized builds. He is given a
simple parameterized job to build in Jenkins. Please find more details below:

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.

1. Create a parameterized job which should be named as parameterized-job


2. Add a string parameter named Stage; its default value should be Build.


3. Add a choice parameter named env; its choices should be Development, Staging and Production.


4. Configure job to execute a shell command, which should echo both parameter values (you are passing in the job).


5. Build the Jenkins job at least once with choice parameter value Development to make sure it passes.

Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when
   installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins
   UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the
   UI page.


2. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share
   it with us for review in case your task is marked incomplete. You may also consider using a screen recording software
   such as loom.com to record and share your work.
