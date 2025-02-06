* * * * * cd /opt/services/project && docker compose -f docker-compose-pro.yml exec  project-app php artisan schedule:run >> /root/schedule.log
#* * * * * /bin/echo "cron works" >> /tmp/file
#Technopay-Mysql-Backup-Production
*/30 * * * * bash /root/backups/project/project-mariadb/backup_project_mariadb.sh && curl -fsS --retry 3 https://hc-ping.com/<token> >> /dev/null 2>&1

#Technopay-Mysql-remove-project-Backup-Production
5 2 * * * bash /root/backups/project/project-mariadb/remove_old_project_mariadb.sh  

#Technopay-mongodb-project-Backup-Production
5 5 * * * bash /root/backups/project/project-mongodb/backup_project_mongo.sh 

#Technopay-mongodb-remove-Backup-Production
7 9 * * * bash /root/backups/project/project-mongodb/remove_old_project_mongo.sh  

 