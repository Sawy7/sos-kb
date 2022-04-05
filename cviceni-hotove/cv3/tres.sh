#!/bin/bash

directory=$1
max_files=$2
extensions=("jpg" "jpeg" "txt" "doc" "xls" "html" "php" "docx" "sh")
ext_len=${#extensions[@]}
cd $directory

if [ $max_files -le 1 ]
then
	echo "Error: Max files value must be greater than 1"
	exit 1
fi

echo "Generating $max_files files in $directory with random extension"

for i in $(seq 1 $max_files)
do
	random=$(($RANDOM % $ext_len))
	touch "$i.${extensions[$random]}"
done
