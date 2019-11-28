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
su -c "chown root:system /dev/ozwpan /sys/class/ozmo_wpan/ozwpan/select /sys/class/ozmo_wpan/ozwpan/mode"

# Display info
density=`wm density`
size=`wm size`
log "~~~Display info start~~~"
log $density
log $size
log "~~~Display info end~~~"
