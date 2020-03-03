# retropie
Scripts for better implementation of various functions.

# "retrodrive.sh"

The build-in "usb-mount"-function of retropie is nice, but it only copies all roms and data from and onto the internal drive, so if you have a not enough space on the card left, you have to delete files and that`s not really cool. I decided to make a script which mounts the most important folders from the stick to their desired location on the internal disk, so you can run all your games directly from the usb drive. It renames the original folder to *%_org*, so they can always be reversed if no usb stick is connected...automatically.

# Prerequisitions
- usb-drive (size doesn't matter, just enought to store all your games, themes, splashscreens, BIOS, ... ). I'm using a 64Gb NTFS-formatted drive.
- for ntfs-support, install: `sudo apt-get install ntfs-3g`
- specific folder-structure on the drive:
```
. (usb-drive)
│
└── retro_pi                        # most important folder
    │ 
    ├── home                        # replaces the "RetroPi"-folder under /home/pi/
    │    │ 
    │    ├── BIOS                   # contains BIOS-files
    │    ├── roms                   # contains all roms (and scraped inforamtions/images if selected)
    │    ├── splashscreens          # small videos played on boot
    │    └── retropiemenu           # various files
    │ 
    └── themes                      # themes for emulatonstation frontend
```

# Installation

to prevent empty folders after creating the links, a few steps are required\
(location "/media/usb/" can vary so please check on which path your usb-drive will be mounted from the system)
- plug in the usb-drive
- `mkdir -p /media/usb/retro_pi/home`
- `mkdir -p /media/usb/retro_pi/themes`
- `sudo cp -R /home/pi/RetroPie/\* /media/usb/retro_pi/home`
- `sudo cp -R /etc/emulationstation/themes/\* /media/usb/retro_pi/themes`
- edit retrodrive.sh and edit USB_PATH according to your local mounted folder
    
then proceed with
- download script
- run `sudo vi /etc/rc.local`
- insert `"/path/to/retrodrive.sh" 2>&1 > /dev/null &` above the ".../rpmanager.sh"-line
- save

# What it does

- checks for specific folder on boot
  - if "home"-folder is present on the drive, the current "/home/pi/RetroPie"-folder on the internal drive will be renamed to **RetroPie_org** so no data gets lost
  - if "thems"-folder is present on the drive, the current "/etc/emulationstation/themes"-folder on the internal drive will be renamed to **themes_org** so no data gets lost
- if no drive is present (or the "retro_pi"-folder on the drive was renamed/removed), all created links will be removed and existing **"\*_org"**-folder(s) restored 
