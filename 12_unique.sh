#!/bin/bash

args=$#

if [ $args -lt 1 ]; then
    echo "Usage   : $0 <filename> [-c|-d]"
    echo "Options :"
    echo "          -c  display non-unique words (default)"
    echo "          -d  display unique words only"
    exit
fi

file=$1
distinct=0
if [ $args -gt 1 ]; then
    if [ $2 = "-c" ]; then
        distinct=0
    elif [ $2 = "-d" ]; then
        distinct=1
    else
        echo "[Error] Unknown argument '$2', expected '-c' or '-d'!"
        exit
    fi
fi

words=`cat $file | tr '\t' ' ' | tr -s ' ' | tr ' ' '\n' | sort -u`

if [ $distinct -eq 0 ]; then
    # print non-unique words
    echo -e "Word\t\tCount"
    echo -e "====\t\t===="
    for word in $words
    do
        num=`cat $file | tr ' ' '\n' | grep -F -e $word | wc -l`
        if [ $num -gt 1 ]; then
            echo -e "$word\t\t$num"
        fi
    done
else
    echo "Unique words"
    echo "============"
    for word in $words
    do
        num=`cat $file | tr ' ' '\n' | grep -F -e $word | wc -l`
        if [ $num -eq 1 ]; then
            echo -e "$word"
        fi
    done
fi
