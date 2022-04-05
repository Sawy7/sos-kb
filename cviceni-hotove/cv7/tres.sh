#!/bin/bash

iptables -P OUTPUT DROP
iptables -A OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -p tcp --dport 433 -j ACCEPT
iptables -A OUTPUT -p tcp -d 158.196.109.32 --dport 22 -j ACCEPT # linedu.vsb.cz
