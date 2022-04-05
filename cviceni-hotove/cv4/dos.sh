#!/bin/bash

#Note: Recursive listing is: $(ls -lR /home/* | grep "/" | sed 's/.$//')

directories=$(ls /home)
cd /home

for i in $directories
do
	file_count=$(ls $i | wc -l)
	if [ $file_count -gt 100 ]
	then
		echo "Directory $i has $file_count files (more than 100). Creating a file..."
		cd $i
		touch "BYL PREKROCEN MAX POCET SOUBORU VE SLOZCE"
		cd ..
	fi
done
