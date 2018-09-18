#!/bin/bash


# NOTE: this shell script requires that you already manually downloaded the 
# intellij community edition from their website because trying to use wget
# to download it gives a 403 "permission denied" error.


# Helper functions
function myprint {
	echo $1
#	echo $1 >> realpath $results
}

# Print the results of the previous command (OK for good and FAIL for bad)
function result {
	if [ $? -eq 0 ]; then
		myprint "OK"
	else
		myprint "FAIL"
	fi
}

myprint "START: Installing IntelliJ"

result="intellij_install_results.txt"
path=`pwd`

myprint "Changing into /opt directory"
cd /opt/
result

myprint "Checking for old version"
exists=`ls intellij`
if [ $? -eq 0 ]; then
	myprint "Old version found, reinstalling IntelliJ"
	cd $path
	./reinstall_intellij.sh
	exit
fi

myprint "Creating intellij directory"
sudo mkdir intellij
result

myprint "Changing into intellij directory"
cd intellij
result

myprint "Copying intellij tar file into /opt/intellij directory"
sudo cp ~/Downloads/ideaIC*.tar.gz /opt/intellij
if [ $? -eq 0 ]; then
	myprint "OK"
else
	myprint "FAIL"
	myprint "IntelliJ .tar.gz file not found"
	myprint "Cleaning up and exiting"
	cd /opt/
	sudo rm -r intellij
	exit
fi

myprint "Extracting tar file"
tarfilename=`ls`
sudo tar -xvf $tarfilename
result

sudo rm $tarfilename
result

myprint "Creating symbolic link for the executable to the /opt/bin/ directory"
cd /opt/
directoryname=`ls intellij`
sudo ln -s /opt/intellij/$directoryname/bin/idea.sh /opt/bin/ideaIC
result

myprint "DONE"


