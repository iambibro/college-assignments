#!/bin/sh
echo -e "Enter the number of elements : \c"
read n
i=0
while [ $i -lt $n ]; do
	echo -e "Element $i : \c"
	read el
	elements[$i]=$el
	i=`expr $i + 1`
done
echo "Input given : ${elements[@]}"
i=0
while [ $i -lt $n ]; do
	j=0
	k=1
	flag=0
	while [ $j -lt `expr $n - $i - 1` ]; do
		val1=${elements[$j]}
		val2=${elements[$k]}
		res=`echo "$val1 > $val2" | bc`
		if [ $res -eq 1 ]; then
			val=${elements[$j]}
			elements[$j]=${elements[$k]}
			elements[$k]=$val
			flag=1
		fi
		j=`expr $j + 1`
		k=`expr $k + 1`
	done
	if [ $flag -eq 0 ]; then
		break
	fi
	i=`expr $i + 1`
done
echo "Array { ${elements[@]} } sorted after $i passes!"
