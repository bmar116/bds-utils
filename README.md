# bds-utils
Minecraft Bedrock Dedicated Server Utility Scripts

A set of `bash` scripts to aid in running a [Bedrock Dedicated Server](https://minecraft.wiki/w/Bedrock_Dedicated_Server) instance. The following is a breakdown on how to use the scrpts contained in thsi repository:

- `minecraft`: The main control file. All other scripts are run by this command. For best usage, this file should be moved to the `/usr/local/bin` directory. `Usage: minecraft <start|login|backup|update>`
- `start.sh`: Starts the server. By default, will run in the current console session. Best usage is to use in a `screen`.
- `update.sh`: Automatically updates the server software to the latest version, leaving in place all existing permissions, allowlists, player data, worlds, and server.properties.
- `backup.sh`: Backs-up the default world into a `.tar.gz` archive in the `backups` directory.

## Variables File
Included with this respository is a file named `vars` that contains all of the variables used by the scripts, including log, script, and backup directorys along with the server root directory.

Below is a list of all of the used variables:

- `SERVER_ROOT`: The root directory for the minecraft server installation. \(Default: `/srv/minecraft`.\)
- `SERVER_DIR`: The name of the subdirectory in the root directory where the server software will be installed. \(Default: `bedrock_server`.\)
- `SCRIPT_DIR`: The name of the subdirectory in the root directory where the scripts will be installed. \(Default: `scripts`.\)
- `BACKUP_DIR`: The name of the subdirectory in the root directory where the backups will be contained. \(Default: `backups`.\)
- `BDS_LATEST_VERSION`: Downloads the content of the `bmar116/bds-latest-version` repository containing the download link for the latest version of the Bedrock Dedicated Server software. Used for updating the server software. \(**DO NOT CHANGE**\)
- `WORLD_NAME`: The name of the default world folder. \(Default: `Bedrock level`.\)
- `SCREEN_NAME`: The name of the `screen` used to host the server console output. \(Default: `MinecraftServer`.)

## Installation
Coming soon :-)
