#! /bin/bash

#read -p allows a promt before taking input

read -p "This creates multiple empty txt files in the directory you want. So where shall that be?" chosenPath


#changes directory, but stops script if it doesn't work

cd "$chosenPath" || exit 1


#takes another input

read -p "Ok, and how many do you need?" fileAmount



#iterates through a sequence from 1 to "input"

for x in $(seq 1 $fileAmount)
do
	fileName="file${x}.txt"	#gives file with every iteration new number
	touch "$chosenPath"/"$fileName"
done
 
