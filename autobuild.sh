#!/bin/bash 
DATE=$(date +%Y%m%d%H%M)
WAR_NAME=###
PATH_NAME=###
Jenkins_Job_Name=/home/jenkins/workspace/pe-$PATH_NAME
TomcatCache=/usr/local/tomcat7/work
echo =============================备份war包======================
cp $Jenkins_Job_Name/$WAR_NAME-web/target/$PATH_NAME.war /data/war_bak/$PATH_NAME.war_$DATE
echo =============================开始重新部署======================
mv /home/jenkins/workspace/pe-$PATH_NAME/$WAR_NAME-web/target/$PATH_NAME.war /var/www/webapps/$PATH_NAME.war
PID=`ps aux|grep /data/tomcat7/bin/|grep -v grep |awk '{print $2}'`
if [ -n "$PID" ]; then
    echo 原tomcat进程ID: $PID
    kill $PID
    rm -rf /data/tomcat7/webapps/$PATH_NAME
    rm -rf $TomcatCache
fi
sleep 10
sh /data/tomcat7/bin/startup.sh
PID=`ps aux|grep /data/tomcat7/bin/|grep -v grep |awk '{print $2}'`
echo 当前tomcat进程ID: $PID
echo  =============================部署完毕======================
