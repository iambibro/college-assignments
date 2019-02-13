#!/bin/bash

echo -e"Enter the no of terms : \c"
read n
a=0
b=1
i=1
while [ $i -le $n ]; do
    echo -e"$a \c"
    c=`expr $a + $b`
    a=$b
    b=$c
    i=`expr $i + 1`
done
echo
