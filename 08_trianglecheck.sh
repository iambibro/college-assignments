echo -e "Enter x1 : \c"
read x1
echo -e "Enter y1 : \c"
read y1
echo -e "Enter x2 : \c"
read x2
echo -e "Enter y2 : \c" 
read y2
echo -e "Enter x3 : \c" 
read x3
echo -e "Enter y3 : \c" 
read y3
# Check whether the points are collinear
# (x1 - x2)(y2 - y3)
res1=`echo "($x1 - $x2)*($y2 - $y3)" | bc`
# (x2 - x3)(y1 - y2)
res2=`echo "($x2 - $x3)*($y1 - $y2)" | bc`
res3=`echo "0.5000000*($res1 - $res2)" | bc`
res4=`echo "$res3 == 0" | bc`
if [ $res4 -eq 1 ]; then
	echo "The points are collinear. No triangle possible!"
	exit
fi
# Check whether the sum of two sides is less than the other
l1=`echo "sqrt(1.00000 * ($x1 - $x2)^2 + ($y1 - $y2)^2)" | bc`
l2=`echo "sqrt(1.00000 * ($x2 - $x3)^2 + ($y2 - $y3)^2)" | bc`
l3=`echo "sqrt(1.00000 * ($x1 - $x3)^2 + ($y1 - $y3)^2)" | bc`
echo "Length of the sides : $l1, $l2, $l3"
s1=`echo "($l1 + $l2) > $l3" | bc`
if [ $s1 -eq 0 ]; then
	echo "Sum of first two sides is less than the other. No triangle possible!"
	exit
fi
s2=`echo "($l2 + $l3) > $l1" | bc`
if [ $s2 -eq 0 ]; then
	echo "Sum of second and third sides is lesser than the first. No triangle possible!"
	exit
fi
s3=`echo "($l3 + $l1) > $l2" | bc`
if [ $s3 -eq 0 ]; then
	echo "Sum of first and third sides is lesser than the second. No triangle possible!"
	exit
fi
# Type of triangle determination
isequi=`echo "$l1 == $l2 == $l3" | bc`
if [ $isequi -eq 1 ]; then
	echo "Given points constitute an equilateral triangle!"
	exit
fi
isiso=`echo "($l1 == $l2) || ($l2 == $l3) || ($l3 == $l1)" | bc`
if [ $isiso -eq 1 ]; then
	echo "Given points constitute an isosceles triangle!"
	exit
fi
echo "Given points constitute a scalen triangle!"
