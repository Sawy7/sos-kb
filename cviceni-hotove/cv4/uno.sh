#!/bin/bash

directories=$(du -sb /home/*)
IFS=$'\n' # spliting by newlines, not spaces

for i in $directories
do
	size=$(echo $i | cut -f 1)
	dirname=$(echo $i | cut -f 2)
	if [ $size -gt 1000 ]
	then
		echo "Directory $dirname is more than 1kB. Creating a file..."
		cd $dirname
		touch "BYLA PREKROCENA MAX VELIKOST SLOZKY"
		cd ..
	fi
done
