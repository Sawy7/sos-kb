#!/bin/bash

directory=$1
cd $directory

file_count=$((1001 + $RANDOM % 1000))
echo "Generating $file_count random files in $directory"

for i in $(seq 1 $file_count)
do
	printf -v file_name "%03d.txt" $(($RANDOM % 1000))
	touch $file_name
done
