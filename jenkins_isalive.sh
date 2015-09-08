#!/bin/bash
PATH=/home/jenkins/maven221/bin:/usr/java/jdk1.6.0_45/bin:/usr/java/jdk1.6.0_45/jre/bin:/usr/kerberos/sbin:/usr/kerberos/bin:/home/jenkins/maven221/bin:/usr/java/jdk1.6.0_45/bin:/usr/java/jdk1.6.0_45/jre/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin
result=`ps -ef|sed '/grep/d'|grep jenkins.war`
echo $result
if [[ x$result == x ]];
then
	service jenkins restart
else
        echo "jenkins is alive!"
fi
