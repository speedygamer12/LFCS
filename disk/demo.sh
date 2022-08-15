fdisk -l /dev/sda | grep -i Sectors \
blkid /dev/sda1 \
mkfs.ext4 /dev/sda9 \
blkid -t TYPE="ntfs" -l
lsblk -f
dd if=/dev/sda of=mrbackup bs=512 count=1
fdisk /dev/sda
fdisk -l /dev/sda
partprobe -s \
losetup -f
losetup /dev/loop39 imagefile
parted -s /dev/loop39 mklabel msdos
parted -s /deb/loop39 unit MB mkpart primary ext4 0 256
fdisk -l /dev/loop39
ls -l /dev/loop39*
mkfs.ext3 /dev/loop19p1
mkdir mnt1
mount /dev/loop39p1 mnt1
df -Th
chattr +a filename
force /forcefsck
mount LABEL=home /home
mount -o remount,ro /myfs
mount -t nfs myserver.com:shdir /mnt/shdir
systemctl daemon-reload
systemctl restart local-fs.target
find . -maxdepth 1 -type d -exec du -shx  {} \; | sort -hr

sudo mount -o remote /homefs
sudo quotacheck -vu /homefs
sudo quotaon -vu /home
sudo edquota someusername


