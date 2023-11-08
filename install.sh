#!/usr/bin/env bash
source $PWD/scripts/vars # import relevant envrionment variables from file
sudo -i -u root bash << EOF # run the next block of commands as super user

# move minecraft executable
# make relevant directories & set ownnership
mv $PWD/minecraft /usr/local/bin/
chmod +x /usr/local/bin/minecraft
mkdir ${SERVER_ROOT} && cd ${SERVER_ROOT}
mkdir ${SERVER_DIR} ${SCRIPT_DIR} ${BACKUP_DIR} ${LOG_DIR}
chown -R $USER ${SERVER_ROOT}

EOF

# move scripts to relevant directories
# export script directory enviroment variable for minecraft executable
# run update script to install server software
mv ./scripts/* ${SERVER_ROOT}/${SCRIPT_DIR}
MINECRAFT_SCRIPT_DIR=${SERVER_ROOT}/${SCRIPT_DIR}
export MINECRAFT_SCRIPT_DIR
wget -O /tmp/bedrock_server-latest.zip ${BDS_LATEST_VERSION} && unzip -d ${SERVER_ROOT}/${SERVER_DIR}/ /tmp/bedrock_server-latest.zip
cd ~
rm -r /tmp/bds-utils /tmp/bds-utils.zip /tmp/bedrock_server-latest.zip
minecraft start
minecraft login
