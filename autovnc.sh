#!/bin/bash

# Check Root Permission
if [ $(id -u) -ne 0 ]; then exec sudo bash "$0" "$@"; exit; fi

cd /tmp

# Download VNC Install Script(Latest version of 2024/02/08)
wget https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-7.10.0-Linux-x64.deb -O vnc.deb

# Install VNC
dpkg -i vnc.deb
systemctl enable vncserver-x11-serviced.service

# Cleanup
rm -rf vnc.deb

# Reboot
echo "Reboot the System now"
