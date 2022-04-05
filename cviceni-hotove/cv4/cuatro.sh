#!/bin/bash

backup_dir="/backup"
if ! [ -d $backup_dir ]
then
        mkdir $backup_dir
fi

time_code=$(date +"%Y-%m-%d_%H-%M")

archive_name="$backup_dir/$time_code.gz"
echo "Archiving /etc..."
tar -zcf $archive_name -C / etc
