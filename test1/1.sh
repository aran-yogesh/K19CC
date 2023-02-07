#!/bin/bash

function file() {
for file in "$@"; do
if [ -f "$file" ]; then
echo -e "$file is a regular file."
elif [ -d "$file" ]; then
echo -e "$file is a directory."
else
echo -e "$file is another type of file."
fi
ls -l "$file"
done
}

function file_count() {
local file_count=0
for file in "$@"; do
if [ -f "$file" ]; then
((file_count++))
fi
done
echo -e "Number of regular files: $file_count"
}

file "$@"
file_count "$@"
