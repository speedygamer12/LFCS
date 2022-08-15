#!/bin/bash
set -e
dd if=/dev/zero of=loop-part bs=1M count=1024
echo "created an empty file full of zeros loop-part"
loop="$(losetup -f)"
newloop="/dev/loop$((${loop:0-1}+1))"
echo "The next available loopb device is ${newloop}"
losetup ${newloop} loop-part
echo "We have created a loop device"
cryptsetup luksFormat ${newloop}
echo "make the partition available for formatting"
cryptsetup luksOpen ${newloop} crypt-partition 
echo "Format the partition and use ext4 fileystem"
mkfs.ext4 /dev/mapper/crypt-partition
echo "Create a mountpoint and mount"
mkdir /crypt-mnt && mount /dev/mapper/crypt-partition /crypt-mnt
echo "Congratulations, we have created a loop-partition, \
encrypted the partition and mounted it"
