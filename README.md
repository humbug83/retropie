# RetroPie
Personal scripts for e.g. mounting usb-drivers and their stored games  

---

# Script "retrodrive.sh"

The build-in "usb-mount"-function of retropie is nice, but it only copies all roms and data from and onto the internal drive, so if you have a not enough space on the card left, you have to delete files and that`s not really cool. I decided to make a script which mounts the most important folders from the stick to their desired location on the internal disk, so you can run all your games directly from the usb drive. It renames the original folder to *%_org*, so they can always be reversed if no usb stick is connected...automatically.

# Prerequisitions
- usb-drive (size doesn't matter, just enought to store all your games, themes, splashscreens, BIOS, ... ).\
I'm using a 64Gb NTFS-formatted drive. For ntfs-support, install the needed dependency by runnning:\
`sudo apt-get install ntfs-3g`
- specific folder-structure on the drive (maybe some folder/files will be created after first use of emulationstation, so check available files later again if they aren't present during first check):
```
. (usb-drive)
│
└── retro_pi                        # most important folder
    │ 
    ├── emulationstation
    │    ├── es_input.cfg           # links /opt/retropie/configs/all/emulationstation/es_input.cfg
    │    ├── es_settings.cfg        # links /opt/retropie/configs/all/emulationstation/es_settings.cfg
    │    ├── es_systems.cfg         # links /opt/retropie/configs/all/emulationstation/es_systems.cfg
    │    └── gamelists              # links /opt/retropie/configs/all/emulationstation/gamelists/*
    │ 
    ├── retro_home                  # links /home/pi/RetroPie
    │    ├── BIOS                   # contains BIOS-files
    │    ├── roms                   # contains all roms (and scraped inforamtions/images if selected)
    │    ├── splashscreens          # small videos played on boot
    │    └── retropiemenu           # various files
    │ 
    ├── retroarch
    │    ├── autoconfig             # links /opt/retropie/configs/all/retroarch/autoconfig
    │    └── config                 # links /opt/retropie/configs/all/retroarch/config
    │ 
    └── themes                      # themes for emulationstation's frontend
```

---

# Installation

Check if the drive was mounted correctly:
- create a file in the rootdirectory of the drive called "test" (or whatever)
- plug in the usb-drive and run\
`ls $(mount | grep media | awk '{print $3}')`
- if the file is there (in any of the listed usb*-directories), all is fine
- if not, check if the drive is ok or restart the system. If it's a ntfs-drive, be sure you have installed `ntfs-3g`.

> :warning:
If there are 2 or more drives connected, the output also shows more locations, so either you disconnect all other drives except the one you want to use to store the files or you change following part in the next commands regarding your needs:
change `$(mount | grep media | awk '{print $3}')` to e.g `/media/usb0`

Then create the correct file-structure:\
`USB_DRIVE=$(mount | grep media | awk '{print $3}')`\
`mkdir -p ${USB_DRIVE}/retro_pi/retro_home`\
`sudo cp -R /home/pi/RetroPie/* ${USB_DRIVE}/retro_pi/retro_home`\
`sudo cp -R /etc/emulationstation/themes ${USB_DRIVE}/retro_pi/`\
`sudo cp /opt/retropie/configs/all/emulationstation/es_input.cfg ${USB_DRIVE}/retro_pi/emulationstation/`\
`sudo cp /opt/retropie/configs/all/emulationstation/es_settings.cfg ${USB_DRIVE}/retro_pi/emulationstation/`\
`sudo cp /opt/retropie/configs/all/emulationstation/es_systems.cfg ${USB_DRIVE}/retro_pi/emulationstation/`\
`sudo cp -R /opt/retropie/configs/all/emulationstation/gamelists ${USB_DRIVE}/retro_pi/emulationstation/`\
`sudo cp -R /opt/retropie/configs/all/retroarch/autoconfig ${USB_DRIVE}/retro_pi/retroarch/`\
`sudo cp -R /opt/retropie/configs/all/retroarch/config ${USB_DRIVE}/retro_pi/retroarch/`

Then proceed with
- download script
- `sudo vi /etc/rc.local`
- insert `"/path/to/retrodrive.sh" 2>&1 > /dev/null &` above the ".../rpmanager.sh"-line
- save

# Script "structure.sh" (optional)
... combines all commands from above. The more files are already present on the internal drive (roms, scraped images, ...), the longer the copy process will take.

---

# What it does

- checks for specific folder on boot
  - if `retro_home`-folder is present on the drive, the current "/home/pi/RetroPie"-folder on the internal drive will be renamed to **RetroPie_org** so no data gets lost
  - if `themes`-folder is present on the drive, the current "/etc/emulationstation/themes"-folder on the internal drive will be renamed to **themes_org** so no data gets lost
- if no drive is present (or the `retro_pi`-folder on the drive was renamed/removed), all created links will be removed and existing **"\*_org"**-folder(s) restored
- links specific folders containing `*.cfg`-files (joypad settings, es-settings, ...)

---

# To-Do

Include more necessary folders in future releases
