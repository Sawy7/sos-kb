#!/bin/bash

directory=$1
max_files=$2
cd $directory

if [ $max_files -le 1 ]
then
	echo "Error: Max files value must be greater than 1"
	exit 1
fi

echo "Generating $max_files files in $directory with random size"

for i in $(seq 1 $max_files)
do
	file_size=$(($RANDOM % (1024*2024)))
	fallocate -l $file_size $i
done
