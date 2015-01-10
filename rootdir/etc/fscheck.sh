#!/sbin/ext/busybox sh
# Script to check filesystem type and modify mount points with proper options.
#

BB=/sbin/ext/busybox

FS_SYSTEM=$(eval $(/sbin/ext/blkid /dev/block/mmcblk0p16 | $BB cut -c 24-); $BB echo $TYPE);
FS_CACHE=$(eval $(/sbin/ext/blkid /dev/block/mmcblk0p18 | $BB cut -c 24-); $BB echo $TYPE);
FS_DATA=$(eval $(/sbin/ext/blkid /dev/block/mmcblk0p29 | $BB cut -c 24-); $BB echo $TYPE);

if [ "$FS_SYSTEM" == "f2fs" ]; then
    $BB mount -o remount,rw /;
	$BB sed -i s/'system          ext4'/'system          f2fs'/ /fstab.qcom;
fi;

if [ "$FS_CACHE" == "f2fs" ]; then
    $BB mount -o remount,rw /;
	$BB sed -i s/'cache           ext4'/'cache           f2fs'/ /fstab.qcom
fi;

if [ "$FS_DATA" == "f2fs" ]; then
    $BB mount -o remount,rw /;
	$BB sed -i s/'data            ext4'/'data            f2fs'/ /fstab.qcom;
fi;
