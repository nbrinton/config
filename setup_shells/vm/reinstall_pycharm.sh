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

myprint "START: Reinstalling PyCharm"

myprint "Changing into /opt/ directory"
cd /opt/
result

myprint "Removing old pycharm directory"
sudo rm -r pycharm/
result

cd -

myprint "Changing into /opt/bin/ directory"
cd /opt/bin/
result

myprint "Removing symbolic link from /opt/bin/"
sudo rm pycharm
result

cd -
myprint "DONE: Now running install_pycharm.sh"
./install_pycharm.sh


