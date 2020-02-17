#!/bin/bash

# - connected usb device must be fat32
# - structure: usb_root/nes # usb_root/snes # etc ...

USB_PATH=/media/usb
ROM_PATH=/home/pi/RetroPie/roms
EMUS=`ls $ROM_PATH`

# check if usb devices is connected and not empty
if [[ `ls $USB_PATH | wc -l` = "0" ]]; then

    # remove existing but not working links to avoid growing amount of dead links
    for LINK_EXIST in `find $ROM_PATH -maxdepth 2 -mindepth 2 -type l`; do 
        unlink $LINK_EXIST; 
    done

    # create links for any existing emulator on this system to any connected usb device up to device #X
    for NUM in {0..4}; do
        if [ ! -z "`ls $USB_PATH$NUM`" ]; then
            for EMU in $EMUS; do
                FOLDER=`find $USB_PATH$NUM -maxdepth 1 -mindepth 1 -type d -name $EMU`
                if [ ! -z "$FOLDER" ]; then ln -s $FOLDER $ROM_PATH/$EMU/00$NUM\_usb; fi
            done
        fi
    done
else
    echo "A usb-device is already connected!"
fi

# restarts emulationstation so possible links to usb devices can be listed
# kill $(pgrep -f "/opt/retropie/supplementary/emulationstation") && emulationstation &