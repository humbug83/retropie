# retropie
Scripts for better implementation of various functions

# "mount_usb_at_start.sh"

The system mounts every usb-device at /dev/usbX

Runs at startup and does following:

- removes existing symlinks in every rom-directory if they are dead
- (if usb-device is connected) creates symlinks in every rom-directory, pointing at the correspondending rom-directory on the usb-drive
- 
Installation:
