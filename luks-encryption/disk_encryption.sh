echo "create partition with fdisk in another window or run the \
create_partition script."
echo "what is partition name?"
read partvar
partprobe -s
cryptsetup luksFormat partvar
cryptsetup luksOpen partvar secret-partition
mkfs -t ext4 /dev/mapper/secret-key
mkdir -p /secret
mount -a
echo "Encrypted and rebooting"
reboot

