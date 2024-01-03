#!/bin/bash

# Check Root Permission
if [ $(id -u) -ne 0 ]; then exec sudo bash "$0" "$@"; exit; fi

cd /tmp

# Download VNC Install Script(Latest version of 2024/01/03)
wget https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-7.8.0-Linux-x64-ANY.tar.gz

# Extract VNC Script
mv VNC-Server-7.8.0-Linux-x64-ANY.tar.gz vnc.tar.gz
tar -xvf vnc.tar.gz

# Install VNC
cd VNC-Server-7.8.0-Linux-x64
chmod +x vncinstall
./vncinstall
systemctl enable vncserver-x11-serviced.service

# Setting Auth Method
vnclicensewiz
echo 'Authentication=VncAuth' >> /root/.vnc/config.d/vncserver-x11
vncpasswd -service

# Cleanup
rm -rf /tmp/vnc.tar.gz
rm -rf /tmp/VNC-Server-7.8.0-Linux-x64

# Reboot
echo "Reboot the System now"
