#! /bin/bash
#Would you like an other file?


#asking for yes
read -p "Would you like to create a file?" yesNo


#if "yes" than a file is created
if [ "$yesNo" = "yes" ]
then
	touch file1.txt	
else
	echo "What?!, Bye!"	#if not, promt + end of script	
	exit 1
fi

#an other input (yes/no)
read -p "Would you like to create an other file?" yesNo2

x=2	#file1 already exists. We start from 2


#while loops starts with a "yes"
while [ "$yesNo2" = "yes" ]
do
	#touch apperently can't work with a mixed format, so a variable is declared
	fileName="file${x}.txt"
	touch $fileName
	((x++))			#the next filename must be +1
	
	#the question must be inside the loop aswell
	read -p "Would you like to create an other file?" yesNo2
done

echo "Pleasure working with you."
