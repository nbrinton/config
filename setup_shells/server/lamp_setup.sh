#!/bin/bash

# Update
sudo apt-get update

# Install Apache 2
sudo apt-get install apache2 -y

# Install MySQL 
sudo apt-get install mysql-server php5-mysql

#  Tell MySQL to create its database directory structure where it will store its information. 
sudo mysql_install_db

# Run a simple security script that will remove some dangerous defaults and lock down access to our database system a little bit.
sudo mysql_secure_installation

# Install PHP5 and helper packages
sudo apt-get install php5 libapache2-mod-php5 php5-mcrypt

# Install more optional PHP5 modules



