#!/usr/bin/env bash
source ${MINECRAFT_SCRIPT_DIR}/vars # import relevant environment variables from file

while true; do # infinite repeating loop keeps server unlive unless killed
  # run server, when server shuts down backup log file and restart after 5 seconds
  LD_LIBRARY_PATH=. ./bedrock_server
  mv ${SERVER_ROOT}/${LOG_DIR}/latest.log "$LOG_DIR/$(date +'%Y%m%d-%H%M%S').log" && touch ${SERVER_ROOT}/${LOG_DIR}/latest.log
  echo "Waiting 5 seconds to restart unless CTRL-C is pressed....."
  sleep 5
  clear
done
