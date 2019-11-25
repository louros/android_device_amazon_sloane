#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

# SELinux enforce
setenforce 0

# Initialize init.d
su -c "/system/bin/sysinit"
log "Initialized init.d support"

# Set some permissions
log "Change bluetooth permissions"
su -c "chmod 0666 /dev/MTK_SMI"
su -c "chown bluetooth:bluetooth /dev/stpbt"
su -c "chown bluetooth:bluetooth /dev/ttyGS0"
su -c "chmod 0666 /dev/stpbt"
su -c "chmod 0666 /dev/ttyGS0"
