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

myprint "START: Reinstalling Eclipse"

myprint "Changing into /opt/ directory"
cd /opt/
result

myprint "Removing old eclipse directory"
sudo rm -r eclipse
result

cd -

myprint "Changing into /opt/bin/ directory"
cd /opt/bin/
result

myprint "Removing symbolic link from this executable path to /opt/bin/"
sudo rm eclipse
result

cd -
myprint "DONE: Running install_eclipse.sh"
./install_eclipse.sh

