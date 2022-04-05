#!/bin/bash

iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 433 -j ACCEPT
iptables -A INPUT -p tcp -s 192.168.56.1 --dport 22 -j ACCEPT
