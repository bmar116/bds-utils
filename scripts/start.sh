#!/usr/bin/env bash
source $1/vars
cd ${SERVER_DIR}
while true; do
  LD_LIBRARY_PATH=. ./bedrock_server
  mv ${LOG_DIR}/latest.log "$LOG_DIR/$(date +'%Y%m%d-%H%M%S').log" && touch ${LOG_DIR}/latest.log
  echo "Waiting 5 seconds to restart unless CTRL-C is pressed....."
  sleep 5
  clear
done
