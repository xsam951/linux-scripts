#! /bin/bash
# comparing numbers in size

echo "Enter the first number:"
read x
echo "Enter the second number:"
read y

if [ "$x" -gt "$y" ]
then
	echo "The first number is greater than the second number."
elif [ "$x" -eq "$y" ]
then
	echo "The numbers are equal."
else
	echo "The second number is greater than the first number."
fi
