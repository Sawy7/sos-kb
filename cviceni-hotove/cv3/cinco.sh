#!/bin/bash

directory=$1
max_files=$2
min_nums=$3
max_nums=$4
cd $directory

if [ $max_files -le 1 ]
then
	echo "Error: Max files value must be greater than 1"
	exit 1
fi

echo "Generating $max_files files in $directory with random number of numbers between $min_nums and $max_nums"

for i in $(seq 1 $max_files)
do
	num_count=$((1 + $RANDOM % 1000))
	for j in $(seq 1 $num_count)
	do
		number=$(($min_nums + $RANDOM % ($max_nums - $min_nums + 1)))
		echo -n "$number " >> $i
	done
done
