#!/bin/sh

echo -e "Enter the number to check : \c"
read n
max=1
min=1
while [ `expr $max \* 10` -le $n ]; do
	max=`expr $max \* 10`
done
palindrome=1
while [ $max -gt $min ]; do
	msb=`expr $n / $max`
	msb=`expr $msb % 10`
	lsb=`expr $min \* 10`
	lsb=`expr $n % $lsb`
	lsb=`expr $lsb / $min`
	if [ $msb -ne $lsb ]; then
		palindrome=0
		break
	fi
	max=`expr $max / 10`
	min=`expr $min \* 10`
done
if [ $palindrome -eq 1 ]; then
	echo "$n is a palindrome"
else
	echo "$n is not a palindrome"
fi
