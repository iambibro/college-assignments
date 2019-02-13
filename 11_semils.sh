#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage : $0 <folder>"
    exit
fi

if [ -d $1 -a -r $1 ]; then
    cd $1
    echo "`echo * | tr ' ' '\n'`"
else
    echo "[Error] '$1' is not a directory or is not readable!"
fi
