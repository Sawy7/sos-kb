#!/bin/bash

interface_down=$(ip a | grep -oP 'enp.*(?=:.*state DOWN)')

echo "Setting up interface $interface_down"
echo "New static IP: 192.168.56.99"

printf "\n# VirtualBox Host-only\n" >> /etc/network/interfaces
printf "allow-hotplug $interface_down\n" >> /etc/network/interfaces
printf "iface $interface_down inet static\n" >> /etc/network/interfaces
printf "\taddress 192.168.56.99/24\n" >> /etc/network/interfaces
ifup $interface_down

echo "Note: This script is to be executed only once."
