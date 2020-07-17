The following playbook is a starting version for checking backups on managed systems.
 - current backup solution is rsync used with zip to create incremental backups of specified folders e.g. /etc
 - it will test the root users crontab whether it has the backup solution set or not
 - in case there is no entry it will add the backup solution crontab entry 
 - it will check whether there is an up to date (< 1 day old) backup (*.zip in our case)
 - in case there is no crontab entry or there is no current backup file it will create one