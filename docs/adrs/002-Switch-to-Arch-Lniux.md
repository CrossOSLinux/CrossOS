# ADR 002 Back to Arch

Date: *09:08:2026*

## Reasones

Void Linux has the following issues:
* Rigid Build system: I tried two approaches of image and script and both failed in making the image.
* Lack of Packages: Hyprland and some other packages are completely absent from Void linux repositories.

## Decision

Void Linux will no longer be used as teh base instead a version of Arch will be used instead.

These are the candidates that can act as new bases:
* Endeavour OS : A Arch distro with helpers and a clean image.
* Pure Arch ( ALARM ) : No bloat clean Arch install.
* Manjaro : Previously used, clean image. 

**Arch Linux Arn** has been chosen as the new base for the following reasones;
* Clean Base: Standard base for many distributions.
* Flexibble : Can be cusomtised and made into anything.
* Full Arch : Full Arch ecosystem.

## Consequences

The conseqences of this decision are as follows:
* Arch Complexity: Arch is mostly bare bones and needs to be configured by hand.
* Stripping Branding: Before distribution branding has to replaced by custom CrossOS branding.

## Benefits

The Benefits for using Arch as the base :
* Rolling Release: Newest packages.
* Arch Ecosystem: Large ecosystem of arch arm packages.
* Standard: It is the standard has many guides and tested features.
