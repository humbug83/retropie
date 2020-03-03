# retropie
Scripts for better implementation of various functions.

# "stick.sh"

The build-in "usb-mount"-function of retropie is nice, but it only copies all roms and data from and onto the internal drive, so if you have a not enough space on the card left, you have to delete files and that`s not really cool. I decided to make a script which mounts the most important folders from the stick to their desired location on the internal disk, so you can run all your games directly from the usb drive. It renames the original folder to *%_org*, so they can always be reversed if no usb stick is connected...automatically.

# Prerequisitions
- usb-stick (size doesn't matter, just enought to store all your games, themes, splashscreens, BIOS, ... ). I'm using a 64Gb NTFS-formatted stick.
- for ntfs-support, install: `sudo apt-get install ntfs-3g`
- specific folder-structure on the stick:
    - **USB_STICK/retropie_pi/**
      - home
        - BIOS
        - retropiemenu 
        - roms
        - splashscreens
      - themes

# Installation
- download script
- run `sudo vi /etc/rc.local`
- insert `"/path/to/stick.sh" 2>&1 > /dev/null &` above the ".../rpmanager.sh"-line
- save
- done

# What it does

- checks for specific folder on boot
  - if "home"-folder is present on the stick, the current "/home/pi/RetroPie"-folder on the internal drive will be renamed to **RetroPie_org** so no data gets lost
  - if "thems"-folder is present on the stick, the current "/etc/emulationstation/themes"-folder on the internal drive will be renamed to **themes_org** so no data gets lost
- if no stick is present (or the "retro_pi"-folder on the stick was renamed/removed), all created links get removed and existing **"\*_org"**-folder(s) will be restored 
