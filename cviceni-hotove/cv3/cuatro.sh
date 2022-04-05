#!/bin/bash

directory=$1
max_files=$2
cd $directory

if [ $max_files -le 1 ]
then
	echo "Error: Max files value must be greater than 1"
	exit 1
fi

echo "Generating $max_files files in $directory with random line count"

for i in $(seq 1 $max_files)
do
	line_count=$((1 + $RANDOM % 1000))
	for j in $(seq 1 $line_count)
	do
		echo "Lorem ipsum dolor sit amet." >> $i
	done
done
