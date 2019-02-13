#!/bin/bash
numargs=$#
if [ $numargs -lt 1 ]; then
	echo -e "Enter the word to find : \c"
	read wordtofind
else
	wordtofind=$1
fi
if [ $numargs -lt 2 ]; then
	echo -e "Enter the word to replace with : \c"
	read wordtoreplace
else
	wordtoreplace=$2
fi
if [ $numargs -lt 3 ]; then
	echo -e "Enter the input file : \c"
	read inputfile
else
	inputfile=$3
fi

if [ ! -r $inputfile ]; then
	echo "[Error] Input file '$inputfile' not readable or does not exist!"
	exit
fi

# Read the file
numline=1
exec < $inputfile
read line
echo > newfile
while read line;
do
	numword=1
	for word in `echo $line`
	do
		if [ "$wordtofind" == "$word" ]
		then
			echo "'$word' found at line $numline word $numword"
			echo -e "$wordtoreplace \c" >> newfile
		else
			echo -e "$word \c" >> newfile
		fi
		numword=`expr $numword + 1`
	done
	echo >> newfile
	numline=`expr $numline + 1`
done
# Reset the buffer
# exec < `tty`
