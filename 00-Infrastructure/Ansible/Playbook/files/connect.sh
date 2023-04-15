#!/bin/bash
USERNAME=
PASSWORD=
pptpsetup --create vpnconnection --server net.iut.ac.ir --username $USERNAME --password $PASSWORD
pppd call vpnconnection
sleep 5
route add -net 0.0.0.0 netmask 0.0.0.0 ppp0
route add -net  172.16.0.0 netmask 255.255.0.0 ens18
route add -net  172.21.0.0 netmask 255.255.0.0 ens18
route add -net  192.168.0.0 netmask 255.255.0.0 ens18
route add -net  194.146.151.0 netmask 255.255.255.0 ens18
route add -net  176.101.52.0 netmask 255.255.255.0 ens18
route add -net  176.101.51.0 netmask 255.255.255.0 ens18

