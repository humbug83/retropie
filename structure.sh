#!/bin/bash
USB_DRIVE=$(mount | grep media | awk '{print $3}')

echo "Creating folder structure ..."
mkdir -p ${USB_DRIVE}/retro_pi/retro_home
mkdir -p ${USB_DRIVE}/retro_pi/emulationstation
mkdir -p ${USB_DRIVE}/retro_pi/retroarch
echo "...done!"

echo "Start copying folders and files..."
echo " ... copy folder retropie ..."
sudo cp -R /home/pi/RetroPie/* ${USB_DRIVE}/retro_pi/retro_home

echo " ... copy folder themes ..."
sudo cp -R /etc/emulationstation/themes ${USB_DRIVE}/retro_pi/

echo " ... copy folder gamelists ..."
sudo cp -R /opt/retropie/configs/all/emulationstation/gamelists ${USB_DRIVE}/retro_pi/emulationstation/

echo " ... copy folder autoconfig ..."
sudo cp -R /opt/retropie/configs/all/retroarch/autoconfig ${USB_DRIVE}/retro_pi/retroarch/

echo " ... copy folder config ..."
sudo cp -R /opt/retropie/configs/all/retroarch/config ${USB_DRIVE}/retro_pi/retroarch/

echo " ... copy config files ..."
sudo cp /opt/retropie/configs/all/emulationstation/es_input.cfg ${USB_DRIVE}/retro_pi/emulationstation/
sudo cp /opt/retropie/configs/all/emulationstation/es_settings.cfg ${USB_DRIVE}/retro_pi/emulationstation/
sudo cp /opt/retropie/configs/all/emulationstation/es_systems.cfg ${USB_DRIVE}/retro_pi/emulationstation/
echo "Done!"
