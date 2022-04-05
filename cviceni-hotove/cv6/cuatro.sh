#!/bin/bash

for i in $(seq 1 50)
do
	username="user$i"
        useradd -m -s /bin/bash -c "User created by my script" -p "" $username
	echo "User $username created successfully"
	chage -E0 $username
	echo "└─ Expired user (cannot login now)"
	setquota -u $username 50M 250M 0 0 /home
	echo "└─ Set quota"
done
