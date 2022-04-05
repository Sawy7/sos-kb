#!/bin/bash

printf "\n# VirtualBox Local\nauto enp0s8\niface enp0s8 inet static\n\taddress 192.168.56.99/24" >> /etc/network/interfaces
ifup enp0s8
