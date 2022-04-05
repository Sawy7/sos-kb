#!/bin/bash

for i in $(seq 1 50)
do
	username="user$i"
        useradd -m -s /bin/bash -c "User created by my script" -p $(echo "default" | openssl passwd -1 -stdin) $username
	echo "User $username created successfully"
	chage -M 1 $username
	echo "└─ Set password expiration and warning"
	setquota -u $username 50M 250M 0 0 /home
	echo "└─ Set quota"
done
