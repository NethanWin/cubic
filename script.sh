#!/bin/bash

sudo pacman -S squashfs-tools

mkdir -p ubuntu-iso-work/{iso,edit,squashfs}
cd ubuntu-iso-work

cp .iso .


sudo mount -o loop .iso iso

sudo unsquashfs -d squashfs iso/casper/filesystem.squashfs

sudo cp -a squashfs tmp-fs

sudo mount --bind /dev tmp-fs/dev
sudo mount --bind /run tmp-fs/run
sudo mount -t proc /proc tmp-fs/proc
sudo mount -t sysfs /sys tmp-fs/sys
sudo mount -t devpts /dev/pts tmp-fs/dev/pts
sudo cp /etc/resolv.conf tmp-fs/etc/resolv.conf

sudo chroot tmp-fs /bin/bash
