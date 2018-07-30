#!sbin/sh

rm -f /ramdisk/recovery.cpio.gz

rm -f /ramdisk/recovery.cpio

rm -f /ramdisk/modules_list.txt

rm -f /ramdisk/00userinit

rm -f /ramdisk/mkshrc

rm -f /ramdisk/pllddr_oc.sh

rm -f /ramdisk/sh

cp /tmp/install/bin/modules_list.txt /ramdisk/modules_list.txt

cp /tmp/install/bin/00userinit /ramdisk/00userinit

cp /tmp/install/bin/mkshrc /ramdisk/mkshrc

cp /tmp/install/bin/pllddr_oc.sh /ramdisk/pllddr_oc.sh

cp /tmp/install/bin/sh /ramdisk/sh

cp /tmp/install/bin/recovery.cpio /ramdisk/recovery.cpio