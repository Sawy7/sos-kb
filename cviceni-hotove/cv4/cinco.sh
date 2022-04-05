#!/bin/bash

#Note: Recursive listing is: $(ls -lR /home/* | grep "/" | sed 's/.$//')

cd /home
directories=$(ls)

for i in $directories
do
	cd $i
	last_shutdown=$(last -x | grep shutdown | head -1 | sed 's/  / /g' | cut -d " " -f 5-8)
	last_startup=$(last -x | grep "system boot" | head -1 | sed 's/  / /g' | cut -d " " -f 6-9)
	echo "System startup: $last_startup" > info
	echo "Last shutdown: $last_shutdown" >> info
	cd ..
done
