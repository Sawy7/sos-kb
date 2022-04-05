#!/bin/bash

for i in $(seq 1 50)
do
	username="user$i"
	deluser --force --remove-all-files $username &> /dev/null
done

echo "Sucessfully deleted all 50 users"

delgroup scriptusers &> /dev/null
echo "Deleted group"
