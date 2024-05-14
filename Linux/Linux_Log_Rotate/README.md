## Task:

The Nautilus DevOps team is ready to launch a new application, which they will deploy on app servers in Stratos Datacenter. They are expecting significant traffic/usage of haproxy on app servers after that. This will generate massive logs, creating huge log files. To utilise the storage efficiently, they need to compress the log files and need to rotate old logs. Check the requirements shared below:

1. In all app servers install haproxy package.

2. Using logrotate configure haproxy logs rotation to monthly and keep only 3 rotated logs.

(If by default log rotation is set, then please update configuration as needed)