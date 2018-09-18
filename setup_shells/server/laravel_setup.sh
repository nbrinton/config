#!/bin/bash

# Update
sudo apt-get update

# A Personal Package Archive, or PPA, is an Apt repository hosted on Launchpad. 
# PPAs allow third-party developers to build and distribute packages for Ubuntu 
# outside of the official channels. They're often useful sources of beta software, 
# modified builds, and backports to older releases of the operating system.
# 
# Ondřej Surý maintains the PHP packages for Debian, and offers a PPA for PHP 7.0 
# on Ubuntu. Before doing anything else, log in to your system, and add Ondřej's 
# PPA to the system's Apt sources:
sudo add-apt-repository ppa:ondrej/php


# INSTALL PHP 7

# Note: If your system's locale is set to anything other than UTF-8, adding the 
# PPA may fail due to a bug handling characters in the author's name. As a 
# workaround, you can install language-pack-en-base to make sure that locales 
# are generated, and override system-wide locale settings while adding the PPA:

#sudo apt-get install -y language-pack-en-base
#sudo LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php

sudo apt-get update

# Install php 7.0
sudo apt-get install php7.0

# If you are using MySQL, make sure to re-add the updated PHP MySQL bindings:
sudo apt-get install php7.0-mysql


# Install necessary php modules/extensions
sudo apt-get install libapache2-mod-php7.0
sudo apt-get install php7.0-zip 
sudo apt-get install php7.1-xml
sudo apt-get install php-xml
sudo apt-get install php7.0-gd php7.0-mysql php7.0-dom php7.0-cli php7.0-json php7.0-common php7.0-mbstring php7.0-opcache php7.0-readline
sudo apt-get update


# INSTALL COMPOSER (code below may not work as this is going to be updated.
# Video: https://www.youtube.com/watch?v=l-hM9KG4VSE 
cd ~/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php
php -r "unlink('composer-setup.php');"
sudo mv composer.phar /usr/local/bin/composer
cd ../


