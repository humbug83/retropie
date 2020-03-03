#!/bin/bash

# ANCHOR variables
# usb files
USB_PATH=$(find /media/usb* -name retro_pi)
USB_HOME=${USB_PATH}/retro_home
USB_THEMES=${USB_PATH}/themes
USB_CONFIG=${USB_PATH}/retroarch/config
USB_AUTOCONFIG=${USB_PATH}/retroarch/autoconfig
USB_GAMELISTS=${USB_PATH}/emulationstation/gamelists
USB_CFG_INPUT=${USB_PATH}/emulationstation/es_input.cfg
USB_CFG_SETTINGS=${USB_PATH}/emulationstation/es_settings.cfg
USB_CFG_SYSTEM=${USB_PATH}/emulationstation/es_systems.cfg

# retropie files
RPI_EMU_PATH=/etc/emulationstation
RPI_PATH=/opt/retropie/configs/all
RPI_HOME=/home/pi/RetroPie
RPI_THEMES=${RPI_EMU_PATH}/themes
RPI_CFG_SYSTEM=${RPI_EMU_PATH}/es_systems.cfg
RPI_CONFIG=${RPI_PATH}/retroarch/config
RPI_AUTOCONFIG=${RPI_PATH}/retroarch/autoconfig
RPI_GAMELISTS=${RPI_PATH}/emulationstation/gamelists
RPI_CFG_INPUT=${RPI_PATH}/emulationstation/es_input.cfg
RPI_CFG_SETTINGS=${RPI_PATH}/emulationstation/es_settings.cfg

# SECTION MOUNT
# ANCHOR retropie home
if [ -d "${USB_HOME}" ];
then
    if [ ! -z "`stat "${RPI_HOME}" | grep Verzeichnis`" ];
    then
        echo "mount usb-\"RetroPie\"-folder"
        echo "... move "${RPI_HOME}" -> "${RPI_HOME}_org""
        sudo mv "${RPI_HOME}" "${RPI_HOME}_org"
        echo "... create link from "${USB_HOME}" -> "${RPI_HOME}""
        sudo ln -s "${USB_HOME}" "${RPI_HOME}"
    else
        echo "already exists - link \"${RPI_HOME}\""
    fi
fi

# ANCHOR themes
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
        echo "already exists - link \"${RPI_THEMES}\""
    fi
fi

# ANCHOR config
if [ -d "${USB_CONFIG}" ];
then
    if [ ! -z "`stat "${RPI_CONFIG}" | grep Verzeichnis`" ];
    then
        echo "mount usb-\"config\"-folder"
        echo "... move "${RPI_CONFIG}" -> "${RPI_CONFIG}_org""
        sudo mv "${RPI_CONFIG}" "${RPI_CONFIG}_org"
        echo "... create link from "${USB_CONFIG}" -> "${RPI_CONFIG}""
        sudo ln -s "${USB_CONFIG}" "${RPI_CONFIG}"
    else
        echo "already exists - link \"${RPI_CONFIG}\""
    fi
fi

# ANCHOR autoconfig
if [ -d "${USB_AUTOCONFIG}" ];
then
    if [ ! -z "`stat "${RPI_AUTOCONFIG}" | grep Verzeichnis`" ];
    then
        echo "mount usb-\"autoconfig\"-folder"
        echo "... move "${RPI_AUTOCONFIG}" -> "${RPI_AUTOCONFIG}_org""
        sudo mv "${RPI_AUTOCONFIG}" "${RPI_AUTOCONFIG}_org"
        echo "... create link from "${USB_AUTOCONFIG}" -> "${RPI_AUTOCONFIG}""
        sudo ln -s "${USB_AUTOCONFIG}" "${RPI_AUTOCONFIG}"
    else
        echo "already exists - link \"${RPI_AUTOCONFIG}\""
    fi
fi

# ANCHOR gamelist
if [ -d "${USB_GAMELISTS}" ];
then
    if [ ! -z "`stat "${RPI_GAMELISTS}" | grep Verzeichnis`" ];
    then
        echo "mount usb-\"gamelist\"-folder"
        echo "... move "${RPI_GAMELISTS}" -> "${RPI_GAMELISTS}_org""
        sudo mv "${RPI_GAMELISTS}" "${RPI_GAMELISTS}_org"
        echo "... create link from "${USB_GAMELISTS}" -> "${RPI_GAMELISTS}""
        sudo ln -s "${USB_GAMELISTS}" "${RPI_GAMELISTS}"
    else
        echo "already exists - link \"${RPI_GAMELISTS}\""
    fi
fi

# ANCHOR cfg input
if [ -f "${USB_CFG_INPUT}" ];
then
    if [ ! -z "`stat "${RPI_CFG_INPUT}" | grep reg`" ];
    then
        echo "mount usb-\"cfg_settings\"-file"
        echo "... move "${RPI_CFG_INPUT}" -> "${RPI_CFG_INPUT}_org""
        sudo mv "${RPI_CFG_INPUT}" "${RPI_CFG_INPUT}_org"
        echo "... create link from "${USB_CFG_INPUT}" -> "${RPI_CFG_INPUT}""
        sudo ln -s "${USB_CFG_INPUT}" "${RPI_CFG_INPUT}"
    else
        echo "already exists - file \"${RPI_CFG_INPUT}\""
    fi
fi

# ANCHOR cfg settings
if [ -f "${USB_CFG_SETTINGS}" ];
then
    if [ ! -z "`stat "${RPI_CFG_SETTINGS}" | grep reg`" ];
    then
        echo "mount usb-\"cfg_settings\"-file"
        echo "... move "${RPI_CFG_SETTINGS}" -> "${RPI_CFG_SETTINGS}_org""
        sudo mv "${RPI_CFG_SETTINGS}" "${RPI_CFG_SETTINGS}_org"
        echo "... create link from "${USB_CFG_SETTINGS}" -> "${RPI_CFG_SETTINGS}""
        sudo ln -s "${USB_CFG_SETTINGS}" "${RPI_CFG_SETTINGS}"
    else
        echo "already exists - file \"${RPI_CFG_SETTINGS}\""
    fi
fi

# ANCHOR cfg system
if [ -f "${USB_CFG_SYSTEM}" ];
then
    if [ ! -z "`stat "${RPI_CFG_SYSTEM}" | grep reg`" ];
    then
        echo "mount usb-\"cfg_systems\"-file"
        echo "... move "${RPI_CFG_SYSTEM}" -> "${RPI_CFG_SYSTEM}_org""
        sudo mv "${RPI_CFG_SYSTEM}" "${RPI_CFG_SYSTEM}_org"
        echo "... create link from "${USB_CFG_SYSTEM}" -> "${RPI_CFG_SYSTEM}""
        sudo ln -s "${USB_CFG_SYSTEM}" "${RPI_CFG_SYSTEM}"
    else
        echo "already exists - file \"${RPI_CFG_SYSTEM}\""
    fi
fi
# !SECTION

# SECTION RESTORE
# ANCHOR retropie home
if [ ! -d "${USB_HOME}" ] && [ -d "${RPI_HOME}_org" ];
then
    echo "restore \"RetroPie\"-folder"
    echo "... unlink "${RPI_HOME}""
    sudo unlink "${RPI_HOME}"
    echo "... move "${RPI_HOME}_org" -> "${RPI_HOME}""
    sudo mv "${RPI_HOME}_org" "${RPI_HOME}"
else
    if [ ! -z "`stat "${RPI_HOME}" | grep Verzeichnis`" ];
    then
        echo "already restored - folder \"${RPI_HOME}\""
    fi
fi

# ANCHOR themes
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
        echo "already restored - folder \"${RPI_THEMES}\""
    fi
fi

# ANCHOR autoconfig
if [ ! -d "${USB_AUTOCONFIG}" ] && [ -d "${RPI_AUTOCONFIG}_org" ];
then
    echo "restore \"autoconfig\"-folder"
    echo "... unlink "${RPI_AUTOCONFIG}""
    sudo unlink "${RPI_AUTOCONFIG}"
    echo "... move "${RPI_AUTOCONFIG}_org" -> "${RPI_AUTOCONFIG}""
    sudo mv "${RPI_AUTOCONFIG}_org" "${RPI_AUTOCONFIG}"
else
    if [ ! -z "`stat "${RPI_AUTOCONFIG}" | grep Verzeichnis`" ];
    then
        echo "already restored - folder \"${RPI_AUTOCONFIG}\""
    fi
fi

# ANCHOR config
if [ ! -d "${USB_CONFIG}" ] && [ -d "${RPI_CONFIG}_org" ];
then
    echo "restore \"config\"-folder"
    echo "... unlink "${RPI_CONFIG}""
    sudo unlink "${RPI_CONFIG}"
    echo "... move "${RPI_CONFIG}_org" -> "${RPI_CONFIG}""
    sudo mv "${RPI_CONFIG}_org" "${RPI_CONFIG}"
else
    if [ ! -z "`stat "${RPI_CONFIG}" | grep Verzeichnis`" ];
    then
        echo "already restored - folder \"${RPI_CONFIG}\""
    fi
fi

# ANCHOR gamelist
if [ ! -d "${USB_GAMELISTS}" ] && [ -d "${RPI_GAMELISTS}_org" ];
then
    echo "restore \"gamelist\"-folder"
    echo "... unlink "${RPI_GAMELISTS}""
    sudo unlink "${RPI_GAMELISTS}"
    echo "... move "${RPI_GAMELISTS}_org" -> "${RPI_GAMELISTS}""
    sudo mv "${RPI_GAMELISTS}_org" "${RPI_GAMELISTS}"
else
    if [ ! -z "`stat "${RPI_GAMELISTS}" | grep Verzeichnis`" ];
    then
        echo "already restored - folder \"${RPI_GAMELISTS}\""
    fi
fi

# ANCHOR cfg input
if [ ! -f "${USB_CFG_INPUT}" ] && [ -f "${RPI_CFG_INPUT}_org" ];
then
    echo "restore \"cfg_input\"-folder"
    echo "... unlink "${RPI_CFG_INPUT}""
    sudo unlink "${RPI_CFG_INPUT}"
    echo "... move "${RPI_CFG_INPUT}_org" -> "${RPI_CFG_INPUT}""
    sudo mv "${RPI_CFG_INPUT}_org" "${RPI_CFG_INPUT}"
else
    if [ ! -z "`stat "${RPI_CFG_INPUT}" | grep reg`" ];
    then
        echo "already restored - file \"${RPI_CFG_INPUT}\""
    fi
fi

# ANCHOR cfg settings
if [ ! -f "${USB_CFG_SETTINGS}" ] && [ -f "${RPI_CFG_SETTINGS}_org" ];
then
    echo "restore \"cfg_settings\"-folder"
    echo "... unlink "${RPI_CFG_SETTINGS}""
    sudo unlink "${RPI_CFG_SETTINGS}"
    echo "... move "${RPI_CFG_SETTINGS}_org" -> "${RPI_CFG_SETTINGS}""
    sudo mv "${RPI_CFG_SETTINGS}_org" "${RPI_CFG_SETTINGS}"
else
    if [ ! -z "`stat "${RPI_CFG_SETTINGS}" | grep reg`" ];
    then
        echo "already restored - file \"${RPI_CFG_SETTINGS}\""
    fi
fi

# ANCHOR cfg systems
if [ ! -f "${USB_CFG_SYSTEM}" ] && [ -f "${RPI_CFG_SYSTEM}_org" ];
then
    echo "restore \"cfg_systems\"-folder"
    echo "... unlink "${RPI_CFG_SYSTEM}""
    sudo unlink "${RPI_CFG_SYSTEM}"
    echo "... move "${RPI_CFG_SYSTEM}_org" -> "${RPI_CFG_SYSTEM}""
    sudo mv "${RPI_CFG_SYSTEM}_org" "${RPI_CFG_SYSTEM}"
else
    if [ ! -z "`stat "${RPI_CFG_SYSTEM}" | grep reg`" ];
    then
        echo "already restored - file \"${RPI_CFG_SYSTEM}\""
    fi
fi
# !SECTION
