#!/usr/bin/env bash
source ${MINECRAFT_SCRIPT_DIR}/vars # import relevant environment variables from file

# hold world changes to disk if server is running
if screen -list | grep -q ${SCREEN_NAME}; then
  screen -X ${SCREEN_NAME} -X stuff "save hold\n"
fi

# create backup file
BACKUP_NAME="${WORLD_NAME}-$(date +'%Y%m%d-%H%M%S').tar.gz"
cd ${SERVER_ROOT}/${SERVER_DIR}/worlds
echo "Backing up worlds/$WORLD_NAME"
tar -czvf "${SERVER_ROOT}/${BACKUP_DIR}/${BACKUP_NAME}" "${WORLD_NAME}"
echo Finished backing up worlds/${WORLD_NAME}. Backup file can be found at ${SERVER_ROOT}/${BACKUP_DIR}/${BACKUP_NAME}

# resume world changes if server is running
if screen -list | grep -q ${SCREEN_NAME}; then
  screen -S ${SCREEN_NAME} -X stuff "save resume\n"
fi

