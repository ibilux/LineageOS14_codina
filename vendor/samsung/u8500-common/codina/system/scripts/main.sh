#!/sbin/sh

set -x

#
#

logged_execute()
{
	$1 1&> /tmp/tmp.txt
	cat /tmp/tmp.txt >> /tmp/kernel_log.txt
	rm /tmp/tmp.txt
	echo "" >> /tmp/kernel_log.txt
}

if [ "$1" == "wipe_log" ] ; then
	rm -f /tmp/kernel_log.txt
	touch /tmp/kernel_log.txt
	exit
fi

if [ "$1" == "check_ramdisk_partition" ] ; then
	echo "Checking ramdisk partition..." >> /tmp/kernel_log.txt
    #ui_print "Checking ramdisk partition..."
    logged_execute /tmp/install/bin/check_ramdisk_partition.sh
fi

if [ "$1" == "check_recovery" ] ; then
	echo "Installing recovery..." >> /tmp/kernel_log.txt
	#ui_print "Installing recovery..."
	logged_execute /tmp/install/bin/recovery_install.sh

	#set_progress 0.9
fi

cp /tmp/kernel_log.txt /ramdisk/last_kernel_install.txt
