#!/bin/bash

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

myprint "START: Uninstalling Eclipse"

myprint "Changing into /opt/ directory"
cd /opt/
result

myprint "Removing eclipse directory and sub-directories"
sudo rm -r intellij
result

myprint "Changing into /opt/bin/ directory"
cd /opt/bin/
result

myprint "Removing symbollic link from /opt/bin/"
sudo rm -rf eclipse
result

myprint "DONE"
