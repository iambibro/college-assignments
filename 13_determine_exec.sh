#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage : $0 <folder>"
    exit
fi

if [ -d $1 -a -r $1 ]; then
    date '+%A, %d %B, %Y'
    list=`ls -l $1`
    list=`echo -e "$list"`
    #echo "$list"
    IFS='
'
    for item in $list
    do
        perm=`echo "$item" | cut -d " " -f 1`
        if [ "$perm" != "" -a "$perm" != "total" ]; then
            true
            isf=`echo "$perm" | cut -c 1`
            if [ $isf = "-" ]; then
                ux=`echo "$perm" | cut -c 4`
                gx=`echo "$perm" | cut -c 7`
                ox=`echo "$perm" | cut -c 10`
                if [ "$ux" = "x" -o "$gx" = "x" -o "$ox" = "x" ]; then
                    echo "'`echo "$item" | tr -s ' ' | cut -d " " -f 9`' is executable"
                fi
            fi
        fi
    done
else
    echo "[Error] Given directory '$1' does not exist or is not readable!"
    exit
fi
