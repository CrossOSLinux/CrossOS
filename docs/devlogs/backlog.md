Today on 2026.07.16

I am decideing to write detialed logs on the advancment of the project.
The project has already gone thorugh a lot development but i have recently taken a radical change by migrating from a manjaro arch based distribution to an void linux based distribution.
From now detailed docs will be written on the project with one document per implementation in devloogs and all decisions in the ./docs/ADRs folder.

For a brief overciew of the project, read the following section:

The project is named CrossOS it eveloved from being a custom operating system to an linux distribution.
The current choice of base is void linux bare for the arm64 rpi5.
The configs for fish, hyprland, fuzzel, greetd, waybar and foot terminal are in a minmal change where the have no special theming or features but are usable in a system and customised to some extent.
There are currently 5 scripts in the repository all of which need to remade as they are the versions for arch manjaro, specifically the build_hyprland script has to be deleted.
There is a package list already prepared in the ./packages folder with 3 lists in total, bare, dev and complete they are leveled so complete is bare + dev + extra packages.
For some deicisions about the architecture check out ./docs/ADRs/

NOTE: Teh local repo has a backup of the previous CrossOs system, it will not be commited due to it being 3 GB and gihub does not allow that.


