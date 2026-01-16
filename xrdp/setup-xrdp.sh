#!/bin/bash
sudo apt install openssh-server git xrdp -y

sudo mkdir -p /etc/polkit-1/localauthority/90-mandatory.d
sudo cp 99-xrdp.pkla /etc/polkit-1/localauthority/90-mandatory.d/
sudo cat /etc/polkit-1/localauthority/90-mandatory.d/99-xrdp.pkla

sudo cp startwm.sh /etc/xrdp/startwm.sh
sudo cat /etc/xrdp/startwm.sh

cp .xsession $HOME/.xsession
cat $HOME/.xsession

sudo systemctl restart xrdp xrdp-sesman
