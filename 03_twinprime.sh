#!/bin/sh

echo -e "Enter the limit : \c"
read n
i=2
old=2
while [ $i -le $n ]; do
	check=$i
	j=2
	prime=1
	while [ $j -le `expr $check / 2` ]; do
		rem=`expr $check % $j`
		if [ $rem -eq 0 ]; then
			prime=0
			break
		fi
		j=`expr $j + 1`
	done
	if [ $prime -eq 1 ]; then
		if [ `expr $check - $old` -eq 2 ]; then
			echo "$old and $check are twin primes"
		fi
		old=$check
	fi
	i=`expr $i + 1`
done
