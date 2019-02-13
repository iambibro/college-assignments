echo -e "Enter the number : \c"
read n
if [ $n -eq 2 ]; then
	echo "Prime factors of the number are : 2"
	exit
fi
i=2
count=0
while [ $i -le `expr $n / 2` ]; do
	rem=`expr $n % $i`
	if [ $rem -eq 0 ]; then
		j=2
		prime=1
		while [ $j -le `expr $i / 2` ]; do
			rem1=`expr $i % $j`
			if [ $rem1 -eq 0 ]; then
				prime=0
				break
			fi
			j=`expr $j + 1`
		done
		if [ $prime -eq 1 ]; then
			if [ $count -eq 0 ]; then
				echo -e "Prime factors of the number are : \c"
			fi
			echo -e "$i \c"
			count=`expr $count + 1`
		fi
	fi
	i=`expr $i + 1`
done
if [ $count -eq 0 ]; then
	echo "No prime factors found for '$n'"
else
	echo
fi
