#!/bin/bash

# backup script



# get user input | source directory
read -p "Which directory do you want to backup? " source_dir



# check if source directory exists
if [ -d "$source_dir" ] 	# checks existence and if it is a directory
then
	
	# checks for read permissions
	if [ -r "$source_dir" ]
	then
		:
	else
		echo "You don't have the right permissions. Please correct that."
		exit 1
	fi
	: 			# does nothing
else
	echo "No such directory"
	exit 1
fi




# get user input for destination directory
read -p "Where shall it be saved? " dest_dir



# newly creating a destination
backup_dir="${dest_dir}_backup_$(date +%Y%m%d)"




# check if destination directory exists and than copy | else create it, than copy
if [ -d "$dest_dir" ]
then
	# check if it is empty
	if [ $(ls -A "$dest_dir" | wc -l) -le 2 ]  		# checks if there are more than 2 files inside (. & .. are counted...)
	then
		# copy files to destination directory
		cp -R "$source_dir"/* "$dest_dir" > /dev/null 2>&1	# > /dev/null surpresses error messages | 2>&1 surpresses normal output

		
		# check for correctness of copying 
		if diff -q "$source_dir" "$dest_dir" > /dev/null 2>&1	# -q checks for correctness without telling what is wrong
		then
			echo "Copying Successful!"
		else 
			echo "Something went wrong..."
		fi	

	else
		# create new directory and copy in it
		mkdir -p "$backup_dir"
		cp -R "$source_dir"/* "$backup_dir" > /dev/null 2>&1
		echo "The directory wasn't empty so a new one  was created."
		
		# check for correctness of copying 
		if diff -q "$source_dir" "$backup_dir" > /dev/null 2>&1
		then
			echo "Copying Successful!"
		else 
			echo "Something went wrong..."
		fi	
	fi
else
	# create new directory and copy in it
	mkdir -p "$backup_dir"
	cp -R "$source_dir"/* "$backup_dir" > /dev/null 2>&1
	echo "The directory didn't exist so a new one was created."

	# check for correctness of copying 
	if diff -q "$source_dir" "$backup_dir" > /dev/null 2>&1
	then
		echo "Copying Successful!"
	else 
		echo "Something went wrong..."
	fi	

fi




