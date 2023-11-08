#!/usr/bin/env bash
source ./vars # import relevant envrionment variables from file
sudo -i -u $USER bash << EOF # run the next block of commands as super user

# move minecraft executable
# make relevant directories & set ownnership
mv ./minecraft /usr/local/bin/
chmod +x /usr/local/bin/minecraft
mkdir ${SERVER_ROOT} && cd ${SERVER_ROOT}
mkdir ${SERVER_DIR} ${SCRIPT_DIR} ${BACKUP_DIR} ${LOG_DIR}
chown -R $USER ${SERVER_ROOT}

EOF

# move scripts to relevant directories
# export script directory enviroment variable for minecraft executable
# run update script to install server software
mv ./scripts/* ${SERVER_ROOT}/${SCRIPT_DIR}
export MINECRAFT_SCRIPT_DIR=${SERVER_ROOT}/${SCRIPT_DIR}
bash ${SERVER_ROOT}/${SCRIPT_DIR}/update.sh
