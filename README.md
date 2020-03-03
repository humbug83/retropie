# retropie
Scripts for better implementation of various functions.

# "stick.sh"

The build-in "usb-mount"-function of retropie is nice, but it only copies all roms and data from and onto the internal drive, so if you have a not enough space on the card left, you have to delete files and that`s not really cool. I decided to make a script which mounts the most important folders from the stick to their desired location on the internal disk, so you can run all your games directly from the usb drive. It renames the original folder to *%_org*, so they can always be reversed if no usb stick is connected...automatically.

# Prerequisitions
- usb-stick (size doesn`t matter, just enought to store all your games, themes, splashscreens, BIOS, ... ). I use a 64Gb NTFS-formatted stick.
- for ntfs-support, install: `sudo apt-get install ntfs-3g`
- specific folder-structure on the stick:
  - USB_STICK/retropie_pi/home
      - BIOS
      - retropiemenu 
      - roms
      - splashscreens
  - USB_STICK/retropie_pi/themes
    

Runs at startup and does following:

- removes existing symlinks in every rom-directory if they are dead
- (if usb-device is connected) creates symlinks in every rom-directory, pointing at the correspondending rom-directory on the usb-drive
- 
Installation:
