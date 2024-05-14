## Task:

During a recent security audit, the application security team of xFusionCorp Industries found security issues with the Apache web server on Nautilus App Server 2 server in Stratos DC. They have listed several security issues that need to be fixed on this server. Please apply the security settings below:

1. On Nautilus App Server 2, it was identified that the Apache web server is exposing the version number.Ensure this server has the appropriate settings to hide the version number of the Apache web server.

2. There is a website hosted under `/var/www/html/ecommerce` on App Server 2. It was detected that the directory `/ecommerce` lists all of its contents while browsing the URL. Disable the directory browser listing in Apache config.

3. Also make sure to restart the Apache service after making the changes.