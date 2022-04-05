#!/bin/bash

echo "This wizard will install the ISC DHCP Server and walk you through very basic configuration."
read -p "Press any key to continue..."
printf "\n"

apt update
apt install isc-dhcp-server -y

dhcpd_config="/etc/dhcp/dhcpd.conf"
dhcpd_default_config="/etc/default/isc-dhcp-server"

#################################################
#                                               #
#    This is how sample config looks like:      #
#                                               #
#################################################
# subnet 192.168.56.0 netmask 255.255.255.0 {   #
#   range 192.168.56.10 192.168.56.20;          #
#   option routers 192.168.56.100;              #
# }                                             #
#################################################

printf "\n"
read -p "Enter domain name [example.org]: " domain_name
if [[ ! -z $domain_name ]]
then
    sed -i "s/option domain-name \"example.org\";/option domain-name \"$domain_name\";/g" $dhcpd_config
fi

read -p "Enter name servers separated by ', ' [8.8.8.8, 8.8.4.4]: " name_servers
if [[ ! -z $name_servers ]]
then
    sed -i "s/option domain-name-servers ns1.example.org, ns2.example.org;/option domain-name-servers $name_servers;/g" $dhcpd_config
else
    sed -i "s/option domain-name-servers ns1.example.org, ns2.example.org;/option domain-name-servers 8.8.8.8, 8.8.4.4;/g" $dhcpd_config
fi

read -p "Enter default lease time [600]: " lease_time
if [[ ! -z $lease_time ]]
then
    sed -i "s/default-lease-time 600;/default-lease-time $lease_time;/g" $dhcpd_config
fi

read -p "Enter max lease time [7200]: " max_lease_time
if [[ ! -z $max_lease_time ]]
then
    sed -i "s/max-lease-time 7200;/max-lease-time $max_lease_time;/g" $dhcpd_config
fi

read -p "Is this DHCP server authoritative? [y/N]: " is_authoritative
if [[ $is_authoritative == "y" || $is_authoritative == "Y" ]]
then
    sed -i "s/#authoritative;/authoritative;/g" $dhcpd_config
elif [[ $is_authoritative != "n" && $is_authoritative != "N" ]]
then
    echo "This options is not recognised. Going with default: 'No'."
fi

printf "\n#DHCPD Wiz Custom Config\n" >> $dhcpd_config

read -p "Enter subnet address [192.168.56.0]: " subnet_address
printf "\nsubnet " >> $dhcpd_config
if [[ ! -z $subnet_address ]]
then
    printf "$subnet_address" >> $dhcpd_config
else
    printf "192.168.56.0" >> $dhcpd_config
fi
printf " " >> $dhcpd_config

read -p "Enter netmask [255.255.255.0]: " netmask
printf "netmask " >> $dhcpd_config
if [[ ! -z $netmask ]]
then
    printf "$netmask" >> $dhcpd_config
else
    printf "255.255.255.0" >> $dhcpd_config
fi
printf " {\n" >> $dhcpd_config

read -p "Enter starting address [192.168.56.10]: " starting_address
printf "\trange " >> $dhcpd_config
if [[ ! -z $starting_address ]]
then
    printf "$starting_address" >> $dhcpd_config
else
    printf "192.168.56.10" >> $dhcpd_config
fi
printf " " >> $dhcpd_config

read -p "Enter last address [192.168.56.20]: " last_address
if [[ ! -z $last_address ]]
then
    printf "$last_address" >> $dhcpd_config
else
    printf "192.168.56.20" >> $dhcpd_config
fi
printf ";\n" >> $dhcpd_config

read -p "Enter routers separated by ', ' []: " routers
if [[ ! -z $routers ]]
then
    printf "\toption routers $routers;\n" >> $dhcpd_config
fi
printf "}\n" >> $dhcpd_config

read -p "Enter interfaces on which this will run separated by ', ' [enp0s8]: " ipv4interfaces   
if [[ ! -z $ipv4interfaces ]]
then
    sed -i "s/INTERFACESv4=\"\"/INTERFACESv4=\"$ipv4interfaces\"/g" $dhcpd_default_config
else
    sed -i "s/INTERFACESv4=\"\"/INTERFACESv4=\"enp0s8\"/g" $dhcpd_default_config
fi

systemctl start isc-dhcp-server

echo "All changes done!"
echo "Note: This script is to be executed only once."
