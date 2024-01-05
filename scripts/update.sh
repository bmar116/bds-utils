#!/usr/bin/env bash
source ${MINECRAFT_SCRIPT_DIR}/vars # import relevant environment variables from file
BDS_LATEST_VERSION="https://minecraft.azureedge.net/bin-linux/bedrock-server-1.20.51.01.zip"

# stop server if running
# TODO: Currently manual Ctrl-C is required to stop server keep-alive loop.
# 	Add automatic server stopping. Maybe with variable?
if screen -list | grep -q ${SCREEN_NAME}; then
  screen -S ${SCREEN_NAME} -X stuff "stop\n"
  screen -Dr ${SCREEN_NAME}
fi

# download latest server software into tmp directory, unzip and copy important files
# dynamic files are preserved, i.e., worlds, permissions, player data, etc.
echo "Updating Bedrock Dedicated Server..."
wget -O /tmp/bedrock_server-latest.zip ${BDS_LATEST_VERSION} && unzip -d /tmp/bedrock_server/ /tmp/bedrock_server-latest.zip
cd /tmp/bedrock_server
cp -r bedrock_server bedrock_server_symbols.debug behavior_packs/ definitions/ resource_packs/ ${SERVER_ROOT}/${SERVER_DIR}
rm -r /tmp/bedrock_server /tmp/bedrock_server-latest.zip

# download latest scripts into tmp directory, unzip and copy into directory
if [ ! $1 ]; then
	echo "Updating BDS-Utils Scripts..."
	wget -O /tmp/bds-utils_scripts-only.zip https://github.com/bmar116/bds-utils/releases/latest/download/bds-utils_scripts-only.zip && unzip -d /tmp/bds-utils_scripts-only/ /tmp/bds-utils_scripts-only.zip
	cp -r /tmp/bds-utils_scripts-only/* ${SERVER_ROOT}/${SCRIPT_DIR}/
	rm -r /tmp/bds-utils_scripts-only/ /tmp/bds-utils_scripts-only.zip
fi

# restart server software
screen -L -Logfile ${SERVER_ROOT}/${LOG_DIR}/latest.log -dmS ${SCREEN_NAME} bash ${SERVER_ROOT}/${SERVER_DIR}/start.sh ${SERVER_ROOT}/${SCRIPT_DIR}
