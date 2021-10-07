#!/bin/bash
# Author: Prof Legah
# date: 25/08/2020
# Installing Jenkins on RHEL 7/8, CentOS 7/8 or Amazon Linux OS
# You can execute this script as user-data when launching your EC2 VM.
cd /opt
sudo su - 
# 1. Install Java and other pre-requisits
# jenkins-install.h
yum -y install unzip wget tree git
wget -c --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.rpm
yum install jdk-8u131-linux-x64.rpm -y
# 2. Add Jenkins Repository and  Install

 rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

  cd /etc/yum.repos.d/

  curl -O https://pkg.jenkins.io/redhat-stable/jenkins.repo
  yum -y install jenkins --nobest
  systemctl start jenkins
  systemctl enable jenkins
  systemctl status jenkins
