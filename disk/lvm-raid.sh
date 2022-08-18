lvcreate -L 4G -n newLV VG2
mkfs -t ext4 /dev/VG2/newLV
mount /dev/VG2/newLV /mnt
lvremove /dev/VG2/newLV
