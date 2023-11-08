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
- `LOG_DIR`: The name of the subdirectory in the root directory where log files are stored. \(Default: `logs`.\)
- `BDS_LATEST_VERSION`: Downloads the content of the `bmar116/bds-latest-version` repository containing the download link for the latest version of the Bedrock Dedicated Server software. Used for updating the server software. \(**DO NOT CHANGE**\)
- `WORLD_NAME`: The name of the default world folder. \(Default: `Bedrock level`.\)
- `SCREEN_NAME`: The name of the `screen` used to host the server console output. \(Default: `MinecraftServer`.)

## Installation
### Dependencies
`screen`, `wget` and `unzip` are required to run this software.

**Ubuntu/Debian-Based Systems**: ``apt-get install -y screen wget unzip``

**Arch-Based Systems**: ``# pacman -Syyu screen wget unzip``

**Fedora**: ``dnf install screen wget unzip``

**CentOS/RHEL**: ``yum install screen wget unzip``

**OpenSUSE**: ``zypper install screen wget unzip``

**Gentoo**: ``emerge --ask screen wget unzip``

### Download
You can manually download the latest release `.zip` file, extract, and run the `install.sh` file, or run the follwing easy-to-read command in your favorite shell:

``wget -O /tmp/bds-utils.zip https://github.com/bmar116/bds-utils/releases/download/latest/bds-utils.zip && unzip -d /tmp/bds-utils /tmp/bds-utils.zip && cd /tmp/bds-utils && bash install.sh``

### After Installation
Before running the `minecraft` command from your console, make sure the `MINECRAFT_SCRIPT_DIR` environment variable is set to the appropriate directory. By default, it is set to `/srv/minecraft/scripts`.

**Note:** This environment variable is not persistent and must be set on each startup. Add to your `~/.profile` or `/etc/environment` to make this variable persistent.
