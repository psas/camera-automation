# camera-automation
Scripts and extra to run cameras on the flight computer

#### To create a fresh picam image
- Get the raspbian image and dd it to an SD card
- Mount and cd into the new root filesystem on the second partition
- Run the following commands:
```
wget https://github.com/psas/camera-automation/blob/master/install.sh -O tmp/install.sh
sudo sh tmp/install.sh
```
- This gets everything set up.  Make sure you have working Internet access for the first time it boots up so that packages can be updated.
- Boot the system and login with default raspbian credentials (pi/raspberry)
- Set a new password when prompted
- Accept packages to be installed
