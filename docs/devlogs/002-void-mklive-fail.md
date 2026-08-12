Date: *07:08:2026*
# Void mklive

After researching how to build a distribution using void, I found about the void mklive utility.
The service required me to change the entire repo structure and use build_overlay and stuff.

This ended up failing as I ran into many issues:
* Packages not being found leading to build failure.
* Long build times.
* Large script refactoring.
* Zero post isntall support.

Due to this I abandoned the standard and am choosing to go back to the old way of install scripts.

All this work was on the dev branch and I will reset it to match main which is clean.

# Pacakges

Void also is not the best for aarch64 packages many of the packages are not there such as:
* Hyprland
* Waybar

The packges that are there also have there name changed.

# Refactoring

Even though I am gonna use the script method almost all of the scripts will need to be remade:
* packges.sh : Must be xbps complient or install *cros* and use its syntax.
* setup.sh : Need to change from ssytemd to runnit based.

