#!/bin/bash

#echo "correct bash location"

# Install whois
sudo apt-get install whois

# Install git 
sudo apt-get install git -y

# Install gitk
sudo apt-get install gitk -y

# Install vim
sudo apt-get install vim -y
sudo apt-get install vim-gnome -y

# Install JDK
sudo apt-get install default-jdk -y

# Install Valgrind
sudo apt-get install valgrind -y

# Install zip and unzip
sudo apt-get install zip unzip

# Update Packages (Is this a good order?)
sudo apt-get update -y
