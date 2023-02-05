#!/bin/bash

#reading data from the user

read -p 'enter file name: ' filename

if [ -e $filename ]
then
echo File exist
else
echo file doesnot exist
fi

if [ -s $filename ]
then
echo the given file is not empty
else
echo the given file is empty
fi
