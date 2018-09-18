#!/bin/bash


# NOTE: this shell script requires that you already manually downloaded the 
# eclipse edition from their website prior to running

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

myprint "START: Installing Eclipse"

myprint "Changing into /opt/ directory"
cd /opt/
result

myprint "Checking for old version"
exists=`ls eclipse`
if [ $exists == "eclipse" ]; then
	myprint "Old version found, reinstalling Eclipse"
	cd -
	./reinstall_eclipse.sh
	exit
fi

myprint "Creating eclipse directory"
sudo mkdir eclipse
result

myprint "Changing into eclipse directory"
cd eclipse
result

myprint "Copying eclipse tar file into /opt/eclipse/ directory"
sudo cp ~/Downloads/eclipse*.tar.gz /opt/eclipse/
if [ $? -eq 0 ]; then
	myprint "OK"
else
	myprint "FAIL"
	myprint "Eclipse .tar.gz file not found"
	myprint "Cleaning up and exiting"
	cd /opt/
	sudo rm -r eclipse
	exit
fi

myprint "Extracting tar file"
tarfilename=`ls`
sudo tar -xvf $tarfilename
result

sudo rm $tarfilename

myprint "Creating symbolic link from this executable to /opt/bin/"
sudo ln -s /opt/eclipse/eclipse/eclipse /opt/bin/eclipse
result

myprint "DONE"


