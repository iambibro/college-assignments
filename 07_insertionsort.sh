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
i=1
# 1. Take an element under consideration
# 2. Compare it with the elements before it and
#    find its preferable position in the array
# 4. Then insert it there shifting elements in
#    the middle to the right
while [ $i -lt $n ]; do
	baki=`expr $i - 1`
	val1=${elements[$i]}				# Pull the element
	while [ $baki -ge 0 ]; do
		val2=${elements[$baki]}			# Pull the element to compare
		res=`echo "$val1 < $val2" | bc`		# Compare
		tgt=`expr $baki + 1`
		if [ $res -eq 1 ]; then			# If it's true, then copy the comaparison 
			elements[$tgt]=$val2		# element to next
		else
			break				# Since i-1th elements are already sorted,
		fi					# violation of greater than means the position
							# is already found
		baki=`expr $baki - 1`
	done
	tgt=`expr $baki + 1`				# Insert the element to the next location
	elements[$tgt]=$val1				# of the first lesser or equal element
	i=`expr $i + 1`
done
echo "${elements[@]}"
