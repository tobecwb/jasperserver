#!/bin/sh

# set environment
. /home/jasper/jasperreports-server-cp-7.8.0/scripts/setenv.sh

# start postgresql
/home/jasper/jasperreports-server-cp-7.8.0/postgresql/scripts/ctl.sh start
sleep 5

# start tomcat
rm -f /home/jasper/jasperreports-server-cp-7.8.0/apache-tomcat/temp/catalina.pid
export JAVA_HOME=/home/jasper/jasperreports-server-cp-7.8.0/java
/home/jasper/jasperreports-server-cp-7.8.0/apache-tomcat/bin/catalina.sh run
