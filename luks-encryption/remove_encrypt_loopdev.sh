#!/bin/bash
set -e
if [ $# -eq 0 ]; then 
  echo "No argument supplied"
  exit 1; 
fi
loopdev=/dev/loop$1
#unmount the partition
umount /crypt-mnt
#remove association from the device
crypsetup -luksClose /dev/mapper/crypt-partition
#Delete loop device
losetup -d loopdev
#remove empty file
rm loop-part 

