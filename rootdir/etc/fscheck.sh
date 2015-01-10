#!/sbin/ext/busybox sh
# Script to check filesystem type and modify mount points with proper options.
#

BB=/sbin/ext/busybox

$BB mount -o remount,rw /;

$BB mv /fstab.qcom /fstab.org;

FS_CACHE0=$(eval $(/sbin/ext/blkid /dev/block/mmcblk0p18 | /sbin/ext/busybox cut -c 24-); /sbin/ext/busybox echo $TYPE);
FS_DATA0=$(eval $(/sbin/ext/blkid /dev/block/mmcblk0p29 | /sbin/ext/busybox cut -c 24-); /sbin/ext/busybox echo $TYPE);
FS_SYSTEM0=$(eval $(/sbin/ext/blkid /dev/block/mmcblk0p16 | /sbin/ext/busybox cut -c 24-); /sbin/ext/busybox echo $TYPE);

if [ "$FS_SYSTEM0" == "ext4" ]; then
	$BB sed -i "s/# EXT4SYS//g" /fstab.tmp;
elif [ "$FS_SYSTEM0" == "f2fs" ]; then
	$BB sed -i "s/# F2FSSYS//g" /fstab.tmp;
fi;

if [ "$FS_CACHE0" == "ext4" ]; then
	$BB sed -i "s/# EXT4CAC//g" /fstab.tmp;
elif [ "$FS_CACHE0" == "f2fs" ]; then
	$BB sed -i "s/# F2FSCAC//g" /fstab.tmp;
else
	$BB sed -i "s/# F2FSCAC//g" /fstab.tmp;
fi;

if [ "$FS_DATA0" == "ext4" ]; then
	$BB sed -i "s/# EXT4DAT//g" /fstab.tmp;
elif [ "$FS_DATA0" == "f2fs" ]; then
	$BB sed -i "s/# F2FSDAT//g" /fstab.tmp;
fi;

$BB mv /fstab.tmp /fstab.qcom;
