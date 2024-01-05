#!/usr/bin/env bash
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo "Please make sure you have set your directories in the vars file before continuing."
read -p "Press enter to continue. Ctrl-C to exit."

wget -qO /tmp/bds-utils.zip https://github.com/bmar116/bds-utils/releases/latest/download/bds-utils.zip && unzip -d /tmp/bds-utils /tmp/bds-utils.zip && cd /tmp/bds-utils

source $PWD/scripts/vars # import relevant envrionment variables from file
CURRENT_USER="`who am i | awk '{print $1}'`"
MINECRAFT_SCRIPT_DIR=${SERVER_ROOT}/${SCRIPT_DIR}

# move minecraft executable
# make relevant directories & set ownnership
mv $PWD/minecraft /usr/local/bin
chmod +x /usr/local/bin/minecraft
if [ ! -d ${SERVER_ROOT} ]; then mkdir ${SERVER_ROOT} && cd ${SERVER_ROOT}; fi
if [ ! -d ${SERVER_DIR} ]; then mkdir ${SERVER_DIR}; fi
if [ ! -d ${SCRIPT_DIR} ]; then mkdir ${SCRIPT_DIR}; fi
if [ ! -d ${LOG_DIR} ]; then mkdir ${LOG_DIR}; fi
if [ ! -d ${BACKUP_DIR} ]; then mkdir ${BACKUP_DIR}; fi
chown -R ${CURRENT_USER} ${SERVER_ROOT}

# move scripts to relevant directories
# export script directory enviroment variable for minecraft executable
# install server software
mv $PWD/scripts/* ${SERVER_ROOT}/${SCRIPT_DIR}
export MINECRAFT_SCRIPT_DIR
grep -qxF "MINECRAFT_SCRIPT_DIR=${MINECRAFT_SCRIPT_DIR}" /home/${CURRENT_USER}/.bashrc || printf "MINECRAFT_SCRIPT_DIR=${MINECRAFT_SCRIPT_DIR}\nexport MINECRAFT_SCRIPT_DIR\n" >> /home/${CURRENT_USER}/.bashrc
bash ${MINECRAFT_SCRIPT_DIR}/update.sh true