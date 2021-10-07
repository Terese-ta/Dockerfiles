#!/bin/bash
# Author: Landmark Technology
# CentOs or REHEL 7/8
#  Install JAVA pre-requisite
cd /opt
yum -y install unzip wget git
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
yum install jdk-8u131-linux-x64.rpm -y

#Download the SonarqQube Server software. 
$ cd /opt
$ wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-7.8.zip
sudo unzip sonarqube-7.8.zip
sudo mv sonarqube-7.8.zip sonarqube
<<add
#As a good security practice, SonarQuber Server is not advised to run sonar service as a root user, so create a new user called sonar and grant sudo access to manage nexus services as follows
add

$ sudo useradd sonar

# Grand sudo access to sonar user

$ sudo echo "sonar ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/sonar

sudo chown -R sonar:sonar /opt/sonarqube/
sudo chmod -R 775 /opt/sonarqube/
# start sonarqube as sonar user
sudo su - sonar  
cd /opt/sonarqube/bin/linux-x86-64/ 
sh sonar.sh start
sh /opt/sonarqube/bin/linux-x86-64/sonar.sh start
