#!/bin/bash

iptables -P OUTPUT ACCEPT
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 433 -j ACCEPT
iptables -A OUTPUT -p tcp -s 192.168.56.1 --dport 22 -j ACCEPT
iptables -A OUTPUT -p all -j DROP
