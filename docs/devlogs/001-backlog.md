# Migration Backlog 

**Date**: 2026-07-16
**Phase**: Migration to Void Linux.

----
### State
Starting today detailed devlogs will be written with adrs as well, this will live in the docs/ directory.

Currently the void migration phase is underway in which the goal is to migrate from a manjaro-arch based system to an void Linux system.

### Overview 
The project already has minimal working configurations of the decided packages.
- fuzzel
- greetd
- hyprland
- waybar
- fodt
These packages can be dropped in to have a minimal running setup.

The project also has scripts that need to be refactored these are:
- install.sh : Safety nets required.
- packages.sh : Old pacman based installer.
- config.sh : Better output and error detection.
- build_hyprland.sh : Needs to be removed.
- setup.sh : Old systemd script needs to be turned into runnit compatible.

The project has 3 package lists in the packages/ directory:
- base: minimum running software.
- dev : bare + development utilities.
- complete : bare + dev + daily driving utility.


> [!Warning] Backup images stored locally.
> Backup images that can be flashed to restore a specific working state are not backed up to github due to size limitations.
> They are stored locally and all image files are ignored through the gitignore file.





