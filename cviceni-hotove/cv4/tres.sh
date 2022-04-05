#!/bin/bash

#Note: Recursive listing is: $(ls -lR /home/* | grep "/" | sed 's/.$//')

backup_dir="/backup"
if ! [ -d $backup_dir ]
then
	mkdir $backup_dir
fi

cd /home
directories=$(ls)

for i in $directories
do
	cd $i
	backup_file_count=$(ls | grep ".backup" | wc -l)
	if [ $backup_file_count -ge 1 ]
 	then
		echo "Found some *.backup files in $i. Moving..."
 		mv *.backup $backup_dir
 	fi
	cd ..
done
