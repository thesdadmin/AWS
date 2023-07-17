#!/bin/bash
## Create LAMP server with specific PHP version 7.4 on AWS Linux2. 
sudo yum update -y
sudo amazon-linux-extras enable php7.4
sudo yum clean metadata
sudo amazon-linux-extras install epel -y 
sudo yum install https://dev.mysql.com/get/mysql80-community-release-el7-5.noarch.rpm 
sudo yum install mysql-community-server

sudo yum install -y httpd 
sudo systemctl enable httpd
sudo systemctl is-enabled httpd

sudo usermod -a -G apache ec2-user
sudo chown -R ec2-user:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
