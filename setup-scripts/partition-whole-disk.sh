#!/bin/bash

dev=$1

if [ $# -eq 0 ]
then
    read -p "Please specify a device (eg. /dev/sdb): " dev
fi

read -p "This will NUKE $dev. All data on there WILL BE LOST. Press enter to continue..."

# Install gdisk
apt update
apt install gdisk -y

# Run gdisk
(
    echo n
    echo
    echo
    echo
    echo
    echo w
    echo y
    echo
) | gdisk $dev

# Format
mkfs.ext4 $dev\1
