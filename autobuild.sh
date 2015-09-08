#!/bin/bash 
DATE=$(date +%Y%m%d%H%M)
WAR_NAME=###
PATH_NAME=###
StartTomcat=/usr/local/tomcat7/bin/startup.sh
TomcatCache=/usr/local/tomcat7/work
echo =============================备份war包======================
cp /var/www/webapps/$WAR_NAME.war /data/war_bak/$PATH_NAME.war_$DATE
echo =============================开始重新部署======================
rm -rf /usr/local/tomcat7/webapps/$PATH_NAME
mv  PATH-TO-WAR/$WAR_NAME.war /var/www/webapps/$PATH_NAME.war
ps aux|grep /usr/local/tomcat7/bin/|grep -v grep |awk '{print $2}'|xargs kill
rm -rf $TomcatCache
sleep 5
$StartTomcat
echo =============================部署完毕======================
