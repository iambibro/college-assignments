#!/bin/bash
num=$#
if [ $num -ne 2 ]; then
    echo "Usage : $0 <file1> <file2>"
    exit
fi

f1=$1
if [ -f $f1 -a -r $f1 ]; then
    c1=`cat $f1`
else
    echo "[Error] '$f1' is either not a regular file or is not readable!"
    exit
fi

f2=$2
if [ -f $f2 -a -r $f2 ]; then
    c2=`cat $f2`
else
    echo "[Error] '$f2' is either not a regular file or is not readable!"
    exit
fi

rm $f1
rm $f2

echo $c1 > $f2
echo $c2 > $f1

echo "Swap complete!"
