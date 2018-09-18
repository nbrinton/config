#!/bin/bash


# NOTE: this shell script requires that you already manually downloaded the 
# PyCharm community edition from their website because trying to use wget
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

myprint "START: Installing PyCharm"

path=`pwd`

myprint "Changing into /opt/ directory"
cd /opt/
result

myprint "Checking for old version"
exists=`ls pycharm`
if [ $? -eq 0 ]; then
	myprint "Old version found, reinstalling PyCharm"
	cd $path
	./reinstall_pycharm.sh
	exit
fi

myprint "Creating pycharm directory"
sudo mkdir pycharm
result

myprint "Changing into pycharm directory"
cd pycharm
result

myprint "Copying pycharm tar file into /opt/pycharm/ directory"
sudo cp ~/Downloads/pycharm*.tar.gz /opt/pycharm/
if [ $? -eq 0 ]; then
	myprint "OK"
else
	myprint "FAIL"
	myprint "pycharm .tar.gz file not found"
	myprint "Cleaning up and exiting"
	cd /opt/
	sudo rm -r pycharm
	exit
fi

myprint "Extracting tar file"
tarfilename=`ls`
sudo tar -xvf $tarfilename
result

sudo rm $tarfilename
result

myprint "Creating symbolic link from this executable to /opt/bin/"
cd /opt/
directoryname=`ls pycharm`
sudo ln -s /opt/pycharm/$directoryname/bin/pycharm.sh /opt/bin/pycharm
result

myprint "DONE"
