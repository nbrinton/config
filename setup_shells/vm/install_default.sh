
#!/bin/bash

# Notes:
# -Resolution is 1360 x 768 (16:9) -- 1366 x 768 host
# -Ubuntu iso (if lost) is found at:
# --> http://www.ubuntu.com/download/
# --> http://www.ubuntu.com/download/desktop/thank-you?country=US&version=14.04.4&architecture=amd64

# IDE Notes:
# Prior to running this script, use Firefox to download the IntelliJ and Eclipse .tar.gz files

# Eclipse and JDK Notes:
# In order to work, Eclipse requires the installation of JDK 8 (citations below)
# 
# http://tipsonubuntu.com/2016/07/31/install-oracle-java-8-9-ubuntu-16-04-linux-mint-18/
# https://bugs.archlinux.org/task/49848

# VM-Settings:
# - 1 processor, 2-cores
# - 30 GB of alloted disk space
# - 8 GB memory
# - 


# Helper functions

# Print to screen and results file
function myprint {
	echo $1
	echo $1 >> $results
}

# Print the results of the previous command (OK for good and FAIL for bad)
function result {
	if [ $? -eq 0 ]; then
		myprint "OK"
	else
		myprint "FAIL"
	fi
}

results="install_summary.txt"
installs=( "git" "gitk" "vim" "vim-gnome" "kwrite" "emacs24" "xclip" "default-jdk" "valgrind" "konsole" "ksnapshot" "dolphin" "gimp" "wget" "doxygen" "libncurses5-dev" "libreadline6" "libreadline6-dev" "python-pip" "sqlite3" )

echo "STARTED -- Installing default programs"
echo "STARTED -- Installing default programs" > $results

for i in "${installs[@]}"
do
	myprint "Installing "$i
	sudo apt-get install $i -y
	result
done

# Install Eclipse
#sudo apt-get install eclipse-platform -y

myprint "Installing JDK 9 and JDK 8"
sudo apt-get update
result

sudo apt-get install software-properties-common
result

sudo add-apt-repository ppa:webupd8team/java
result

sudo apt-get update
result

sudo apt-get install oracle-java9-installer
result

sudo apt-get install oracle-java8-installer
result

# Install JDK 8 (necessary to run eclipse)
#echo "Installing JDK 8"
#echo "Installing JDK 8" >> $results
#sudo add-apt-repository ppa:webupd8team/java
#if [ $? -eq 0 ]; then
#	echo "OK"
#	echo "OK" >> $results
#else
#	echo "FAIL"
#	echo "FAIL" >> $results
#fi
#sudo apt update; sudo apt install oracle-java8-installer
#if [ $? -eq 0 ]; then
#	echo "OK"
#	echo "OK" >> $results
#else
#	echo "FAIL"
#	echo "FAIL" >> $results
#fi
#sudo apt install oracle-java8-set-default
#if [ $? -eq 0 ]; then
#	echo "OK"
#	echo "OK" >> $results
#else
#	echo "FAIL"
#	echo "FAIL" >> $results
#fi

# Install Atom
myprint "Installing Atom Code Editor"

sudo add-apt-repository ppa:webupd8team/atom
result

sudo apt-get update
result

sudo apt-get install atom
result

# Update Packages (Is this a good order?)
myprint "Installing updates"
sudo apt-get update -y
result

# Install virtualenv
myprint "Instaling virtualenv"
sudo pip install virtualenv
result

myprint "FINISHED -- Installing default programs"


