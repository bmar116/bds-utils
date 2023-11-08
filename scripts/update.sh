#!/usr/bin/env bash
source $1/vars
if screen -list | grep -q ${SCREEN_NAME}; then
  screen -S ${SCREEN_NAME} -X stuff "stop\n"
  screen -Dr ${SCREEN_NAME}
fi

wget -O /tmp/bedrock_server-latest.zip ${BDS_LATEST_VERSION} && unzip -d /tmp/bedrock_server/ /tmp/bedrock_server-latest.zip
cd /tmp/bedrock_server
cp -r bedrock_server bedrock_server_symbols.debug behavior_packs/ definitions/ resource_packs/ ${SERVER_DIR}
rm -r /tmp/bedrock_server /tmp/bedrock_server-latest.zip
cd ${SCRIPT_DIR}

screen -L -Logfile ${LOG_DIR}/latest.log -dmS ${SCREEN_NAME} bash start.sh ${SCRIPT_DIR}
