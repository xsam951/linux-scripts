#!/bin/bash
# file search


read -p "What is the name of the file you are looking for? " fileName

echo "searching the system..."

search=`find / -name "$fileName" 2>/dev/null`	# the 2>/dev/null surpresses error messages

if [ -n "$search" ]	# -n checks if a string is not empty	
then
	echo "The file $fileName exists."
else
	echo "The file $fileName does not exist."
fi
