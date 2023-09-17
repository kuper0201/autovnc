#!/bin/bash

cd /tmp

# Download VNC Install Script
wget https://downloads.realvnc.com/download/file/vnc.files/VNC-Server-7.6.0-Linux-x64-ANY.tar.gz

# Extract VNC Script
mv VNC-Server-7.6.0-Linux-x64-ANY.tar.gz vnc.tar.gz
tar -xvf vnc.tar.gz

pwd
# Install VNC
cd VNC-Server-7.6.0-Linux-x64
chmod +x vncinstall
./vncinstall
systemctl enable vncserver-x11-serviced.service

# Setting Auth Method
vnclicensewiz
echo 'Authentication=VncAuth' >> /root/.vnc/config.d/vncserver-x11
vncpasswd -service

# Cleanup
rm -rf /tmp/vnc.tar.gz
rm -rf /tmp/VNC-Server-7.6.0-Linux-x64

# Reboot
echo "Rebooting System..."
reboot
