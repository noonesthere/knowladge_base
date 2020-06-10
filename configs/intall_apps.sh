#!/bin/bash

### Update packages ###
apt-get update

### Install  soft ###
apt-get install htop iotop git ssh  smartmontools -y


### Reinstall packegets ###
apt-get -f install -y

### Delete guest sessions ###
echo "allow-guest=false" >>/usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf
