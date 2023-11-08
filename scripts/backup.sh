#!/usr/bin/env bash
source $1/vars
if screen -list | grep -q ${SCREEN_NAME}; then
  screen -X ${SCREEN_NAME} -X stuff "save hold\n"
fi
BACKUP_NAME="${WORLD_NAME}-$(date +'%Y%m%d-%H%M%S').tar.gz"
cd ${SERVER_DIR}/worlds
echo "Backing up worlds/$WORLD_NAME"
tar -czvf "$BACKUP_DIR/$BACKUP_NAME" "$WORLD_NAME"
echo Finished backing up worlds/${WORLD_NAME}. Backup file can be found at ${BACKUP_DIR}/${BACKUP_NAME}
if screen -list | grep -q ${SCREEN_NAME}; then
  screen -S ${SCREEN_NAME} -X stuff "save resume\n"
fi
