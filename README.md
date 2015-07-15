# camera-automation
Scripts and extra to run cameras on the flight computer

#### To create a fresh picam image
- Get the [raspbian image](https://www.raspberrypi.org/downloads/) and put it on an SD card following [their instructions](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)
- Re-insert, mount and cd into the new root filesystem
- Run the following commands:
```
wget https://raw.githubusercontent.com/psas/camera-automation/master/install.sh -O tmp/install.sh
sudo sh tmp/install.sh
```
- This will finish with "Done."  Unmount and remove the card from your imaging system.
- Plug SD card into Raspberry Pi.  Make sure you have Internet connectivity for the first time it boots up so that packages can be updated.
- Boot the system and login with default raspbian credentials (pi/raspberry)
- Set a new password when prompted
- Enable Camera when raspi-config comes up (blue background).  Don't reboot when exiting.
- Accept packages to be installed
- Reboot when prompted to expand the filesystem
