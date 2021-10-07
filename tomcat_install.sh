#!/bin/bash
# TOMCAT.SH
# This script will install tomcat9 on rhel7&8
sudo yum install java-1.8.0-openjdk-devel -y
cd /opt
sudo yum install git wget -y

sudo wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.52/bin/apache-tomcat-9.0.52.tar.gz

sudo tar -xvf apache-tomcat-9.0.52.tar.gz
sudo rm -rf apache-tomcat-9.0.52.tar.gz
sudo mv apache-tomcat-9.0.52 tomcat9
sudo chmod 777 -R /opt/tomcat9
sudo sh /opt/tomcat9/bin/startup.sh
# create a soft link to start and stop tomcat
sudo ln -s /opt/tomcat9/bin/startup.sh /usr/bin/tomcat-start
sudo ln -s /opt/tomcat9/bin/shutdown.sh /usr/bin/tomcat-stop
sudo tomcat-stop
sudo tomcat-start
#========
