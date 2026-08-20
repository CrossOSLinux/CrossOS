---
type: project-note
Up: "[[CrossOS]]"
---
# Staright Arch Install
> Installing Arch Linux straight up instead of using the image.
## Making a bootable drive
> Follow the steps on the system used to flash Arch on the drive.
### Step 0: Wipe the Drive
```bash
sudo wipefs -a /dev/mmcblk0
```
### Step 1: Partitioning 
```bash
sudo fdisk /dev/mmcblk0
```
1. Press **n** -> p -> 1. This creates new partition.
2. Press **enter** on first prompt and 512M for second.
	This creates the boot partition
3. Press **n** -> p -> 2. 
4. Press **enter** on both prompts. 
	Thsi creates root partition with remaining space.
5. Press **t** -> 1 -> c. This formats partition one.
6. Press **w** to write.
### Step 2: Formatting Partitions
```bash
sudo mkfs.vfat -F 32 /dev/mmcblk0p1
sudo mkfs.ext4 -F /dev/mmcblk0p2
```
This command sets the format of the partitions
- boot : vfat
- root : ext4
### Step 3: Mount the drives
```bash
sudo mkdir -p /mnt/sd
sudo mount /dev/mmcblk0p2 /mnt/sd
sudo mkdir -p /mnt/sd/boot
sudo mount /dev/mmcblk0p1 /mnt/sd/boot
```
Run the commands above to mount the drives.
### Step 4: Flash Arch
```bash
sudo bsdtar -xpf ArchLinuxARM-rpi-aarch64-latest.tar.gz -C /mnt/sd
```
### Step 5: Copy configs.
Run this from the CrossOS directory.
```bash
sudo cp configs/arch/etc/fstab  /mnt/sd/etc/
sudo cp configs/arch/boot/config.txt  /mnt/sd/boot/
sudo cp configs/arch/boot/cmdline.txt  /mnt/sd/boot/
```
### Step 6: Unmount
```bash
sync
sudo umount -R /mnt/sd
```
## Booting Drive
> Booting the newly flashed drive.
### Step 1: Initialise Pacman and Update
```bash
pacman-key --init
pacman-key --populate archlinuxarm
pacman -Syu --noconfirm sudo linux-rpi-16k git sudo 
```
### Step 2: Add a User
```bash
useradd -m -G wheel,video,input,render,storage,audio -s /bin/bash crossfire

passwd crossos
echo "%wheel ALL=(ALL:ALL) ALL" > /etc/sudoers.d/wheel
# or use EDITOR=nano visudo
```
