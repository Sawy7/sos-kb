#!/bin/bash

iptables -P INPUT ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 433 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.56.1 --dport 22 -j ACCEPT
iptables -A INPUT -p all -j DROP
