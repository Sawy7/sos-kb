#!/bin/bash

interface_down=$(ip a | grep -oP 'enp.*(?=:.*state DOWN)')

echo "Setting up interface $interface_down"
echo "New IP will be dynamic"

printf "\n# VirtualBox Host-only\n" >> /etc/network/interfaces
printf "allow-hotplug $interface_down\n" >> /etc/network/interfaces
printf "iface $interface_down inet dhcp\n" >> /etc/network/interfaces
ifup $interface_down

echo "Note: This script is to be executed only once."
