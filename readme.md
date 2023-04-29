# This repo is for install Real VNC server automatically on any linux.
## I tested this script on x86_64 Lubuntu System.

## Usage
This script has to run with root user.
First, make your own password for root user.

```
sudo passwd root
```

Now download the script and grant execute permission with chmod.
```
wget https://raw.githubusercontents.com/kuper0201/autovnc/main/autovnc.sh
chmod +x autovnc.sh
```

Enter root user.
```
su
```

Run script.
```
./autovnc.sh
```

While the script is running, it will ask you for VNC Server password.

When the script is done, it will reboot the system automatically.
