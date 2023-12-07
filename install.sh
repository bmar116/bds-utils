#!/usr/bin/env bash
source $PWD/scripts/vars # import relevant envrionment variables from file
sudo -i -u root bash << EOF # run the next block of commands as super user

# move minecraft executable
# make relevant directories & set ownnership
mv $PWD/minecraft /usr/local/bin/
chmod +x /usr/local/bin/minecraft
if [ ! -d ${SERVER_ROOT} ]; then mkdir ${SERVER_ROOT} && cd ${SERVER_ROOT}; fi
if [ ! -d ${SERVER_DIR} ]; then mkdir ${SERVER_DIR}; fi
if [ ! -d ${SCRIPT_DIR} ]; then mkdir ${SCRIPT_DIR}; fi
if [ ! -d ${LOG_DIR} ]; then mkdir ${LOG_DIR}; fi
if [ ! -d ${BACKUP_DIR} ]; then mkdir ${BACKUP_DIR}; fi
chown -R $USER ${SERVER_ROOT}

EOF

# move scripts to relevant directories
# export script directory enviroment variable for minecraft executable
# run update script to install server software
mv ./scripts/* ${SERVER_ROOT}/${SCRIPT_DIR}
MINECRAFT_SCRIPT_DIR=${SERVER_ROOT}/${SCRIPT_DIR}
export MINECRAFT_SCRIPT_DIR
echo "MINECRAFT_SCRIPT_DIR=${MINECRAFT_SCRIPT_DIR}" >> ~/.bashrc
echo "export MINECRAFT_SCRIPT_DIR" >> ~/.bashrc
wget -O /tmp/bedrock_server-latest.zip ${BDS_LATEST_VERSION} && unzip -d ${SERVER_ROOT}/${SERVER_DIR}/ /tmp/bedrock_server-latest.zip
cd ~
rm -r /tmp/bds-utils /tmp/bds-utils.zip /tmp/bedrock_server-latest.zip
minecraft start
minecraft login
