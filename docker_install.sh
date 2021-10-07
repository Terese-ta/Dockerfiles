#!/bin/bash
# Run this as a script
# create an ubuntu-18.04 ec2 instance in aws
sudo hostname docker
sudo apt update -y
sudo apt install docker.io -y
sudo usermod -aG docker ubuntu 
