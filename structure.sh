#!/bin/bash
echo "Creating folder structure ..."
mkdir -p $(mount | grep media | awk '{print $3}')/retro_pi/retro_home
mkdir -p $(mount | grep media | awk '{print $3}')/retro_pi/emulationstation
mkdir -p $(mount | grep media | awk '{print $3}')/retro_pi/retroarch
echo "...done!"
echo "Start copying folders and files..."
echo " ... copy folder retropie ..."
sudo cp -R /home/pi/RetroPie/* $(mount | grep media | awk '{print $3}')/retro_pi/retro_home
echo " ... copy folder themes ..."
sudo cp -R /etc/emulationstation/themes $(mount | grep media | awk '{print $3}')/retro_pi/
echo " ... copy folder gamelists ..."
sudo cp -R /opt/retropie/configs/all/emulationstation/gamelists $(mount | grep media | awk '{print $3}')/retro_pi/emulationstation/
echo " ... copy folder autoconfig ..."
sudo cp -R /opt/retropie/configs/all/retroarch/autoconfig $(mount | grep media | awk '{print $3}')/retro_pi/retroarch/
echo " ... copy folder config ..."
sudo cp -R /opt/retropie/configs/all/retroarch/config $(mount | grep media | awk '{print $3}')/retro_pi/retroarch/
echo " ... copy config files ..."
sudo cp /opt/retropie/configs/all/emulationstation/es_input.cfg $(mount | grep media | awk '{print $3}')/retro_pi/emulationstation/
sudo cp /opt/retropie/configs/all/emulationstation/es_settings.cfg $(mount | grep media | awk '{print $3}')/retro_pi/emulationstation/
sudo cp /opt/retropie/configs/all/emulationstation/es_systems.cfg $(mount | grep media | awk '{print $3}')/retro_pi/emulationstation/
echo "Done!"
