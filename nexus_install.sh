#!/bin/bash
# Install and start nexus as a service 
# This script works on RHEL 7 & 8 OS 
sudo su -
cd /opt
# 1.Install prerequisit: JAVA, git, unzip

yum install wget git nano unzip -y

yum install java-11-openjdk-devel java-1.8.0-openjdk-devel -y
yum install tar wget -y

# 2. Download nexus software and extract it (unzip)

wget http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz 

tar -zxvf nexus-3.15.2-01-unix.tar.gz
mv /opt/nexus-3.15.2-01 /opt/nexus

#3. As a good security practice, Nexus is not advised to run nexus service as a root user, so create a new user called nexus and grant sudo access to manage nexus services as follows.

useradd nexus

#4 Give sudo access to nexus user

sudo echo "nexus ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/nexus

or

visudo
nexus ALL=(ALL) NOPASSWD: ALL

#5 Change the owner and group permissions to /opt/nexus and /opt/sonatype-work directories.

chown -R nexus:nexus /opt/nexus
chown -R nexus:nexus /opt/sonatype-work
sudo chmod -R 775 /opt/nexus
sudo chmod -R 775 /opt/sonatype-work

#6 Open /opt/nexus/bin/nexus.rc file and  uncomment run_as_user parameter and set as nexus user.

vi /opt/nexus/bin/nexus.rc
run_as_user="nexus"

#7 Create nexus as a service

ln -s /opt/nexus/bin/nexus /etc/init.d/nexus

#8 Switch as a nexus user and start the nexus service as follows.

su - nexus

#9 Enable and start the nexus services
sudo systemctl enable nexus
sudo systemctl start nexus

35.174.19.3:8081

userName  --- ADMIN
Password   ADMIN123

<<Troubleshooting
---------------------
nexus service is not starting?

a)make sure  to change the ownership and group to /opt/nexus and /opt/sonatype-work directories and permissions (775) for nexus user.
b)make sure you are trying to start nexus service with nexus user.
c)check java is installed or not using java -version command.
d) check the nexus.log file which is availabe in  /opt/sonatype-work/nexus3/log  directory.

Unable to access nexus URL?
-------------------------------------
a)make sure port 8081 is opened in security groups in AWS ec2 instance.

Troubleshooting
