#!/bin/bash

# set variables
USB_PATH=$(find /media/usb* -name retro_pi)
USB_HOME=${USB_PATH}/home
USB_THEMES=${USB_PATH}/themes

USB_LINK_NAME=usb
RPI_PATH=/home/pi/RetroPie
RPI_THEMES=/etc/emulationstation/themes

# rename existing retropie folder and mount retropie from usb
if [ -d "${USB_HOME}" ];
then
    if [ ! -z "`stat "${RPI_PATH}" | grep Verzeichnis`" ];
    then
        echo "mount usb-\"RetroPie\"-folder"
        echo "... move "${RPI_PATH}" -> "${RPI_PATH}_org""
        sudo mv "${RPI_PATH}" "${RPI_PATH}_org"
        echo "... create link from "${USB_HOME}" -> "${RPI_PATH}""
        sudo ln -s "${USB_HOME}" "${RPI_PATH}"
    else
        echo "link \"${RPI_PATH}\" already exists"
    fi
fi

# rename existing themes folder and mount themes from usb
if [ -d "${USB_THEMES}" ];
then
    if [ ! -z "`stat "${RPI_THEMES}" | grep Verzeichnis`" ];
    then
        echo "mount usb-\"themes\"-folder"
        echo "... move "${RPI_THEMES}" -> "${RPI_THEMES}_org""
        sudo mv "${RPI_THEMES}" "${RPI_THEMES}_org"
        echo "... create link from "${USB_THEMES}" -> "${RPI_THEMES}""
        sudo ln -s "${USB_THEMES}" "${RPI_THEMES}"
    else
        echo "link \"${RPI_THEMES}\" already exists"
    fi
fi

# revert changes if no usb stick with correct structure is connected
if [ ! -d "${USB_HOME}" ] && [ -d "${RPI_PATH}_org" ];
then
    echo "restore \"RetroPie\"-folder"
    echo "... unlink "${RPI_PATH}""
    sudo unlink "${RPI_PATH}"
    echo "... move "${RPI_PATH}_org" -> "${RPI_PATH}""
    sudo mv "${RPI_PATH}_org" "${RPI_PATH}"
else
    if [ ! -z "`stat "${RPI_PATH}" | grep Verzeichnis`" ];
    then
        echo "folder \"${RPI_PATH}\" already restored"
    fi
fi

if [ ! -d "${USB_THEMES}" ] && [ -d "${RPI_THEMES}_org" ];
then
    echo "restore \"themes\"-folder"
    echo "... unlink "${RPI_THEMES}""
    sudo unlink "${RPI_THEMES}"
    echo "... move "${RPI_THEMES}_org" -> "${RPI_THEMES}""
    sudo mv "${RPI_THEMES}_org" "${RPI_THEMES}"
else
    if [ ! -z "`stat "${RPI_THEMES}" | grep Verzeichnis`" ];
    then
        echo "folder \"${RPI_THEMES}\" already restored"
    fi
fi

