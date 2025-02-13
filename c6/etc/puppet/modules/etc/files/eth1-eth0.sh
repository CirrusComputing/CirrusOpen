#!/bin/sh

# this file is historic: the work is done by nodes.pp

# Switch the main network interface to eth0

cd /etc/sysconfig/network-scripts

cat >> ifcfg-eth0 <<EOF
DNS1="10.100.2.12"
GATEWAY="10.100.2.1"
IPADDR="10.100.2.5"
NETMASK="255.255.255.0"
MTU="1500"
TYPE="Ethernet"
EOF

sed -i '/DNS1/d'    ifcfg-eth1
sed -i '/GATEWAY/d' ifcfg-eth1
sed -i '/IPADDR/d'  ifcfg-eth1
sed -i '/NETMASK/d' ifcfg-eth1
sed -i '/MTU/d'     ifcfg-eth1

# when we reboot we will come up using eth0.


#look in anaconda: how does it config this?
#NM_CONTROLLED="no"

#nagios will tell us when it is up
