#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

# OZWPAN
readonly OZWPAN_DEV_FILE="/dev/ozwpan"
readonly OZWPAN_SELECT_FILE="/sys/class/ozmo_wpan/ozwpan/select"
readonly OZWPAN_MODE_FILE="/sys/class/ozmo_wpan/ozwpan/mode"
su -c "chown root:root /dev/ozwpan /sys/class/ozmo_wpan/ozwpan/select /sys/class/ozmo_wpan/ozwpan/mode"
su -c "chown root:root ${OZWPAN_DEV_FILE} ${OZWPAN_SELECT_FILE} ${OZWPAN_MODE_FILE}"
su -c "chmod 0666 ${OZWPAN_DEV_FILE} ${OZWPAN_SELECT_FILE} ${OZWPAN_MODE_FILE}"

# "early-boot"
# SELinux enforce
setenforce 0
# Initialize init.d:
su -c "/system/bin/sysinit"
log "Initialized init.d support"

# "booting"
# Set some permissions before boot:
log "Change /dev permissions"
su -c "chmod 0666 /dev/MTK_SMI"
su -c "chown bluetooth:bluetooth /dev/stpbt"
su -c "chown bluetooth:bluetooth /dev/ttyGS0"
su -c "chown wifi:wifi /dev/wmtWifi"
su -c "chmod 0666 /dev/wmtWifi"
su -c "chmod 0666 /dev/stpbt"
su -c "chmod 0666 /dev/ttyGS0"

# "booted"
# When device is booted:
booted=$(getprop dev.bootcomplete)
remoted=$(cat sys/class/ozmo_wpan/ozwpan/devices | grep SLEEP)
echo $booted
while [ "$booted" = "" ]
do
         booted=$(getprop dev.bootcomplete)
         sleep 7
         log "Waiting for boot"
done
log "Booted up"
su -c "setprop net.hostname amazon-fireTV2" # This avoids of ozwpan being deleted (Don't know the reason)
while [ "$remoted" = "" ]
do
         wpa_cli -g@android:wpa_wlan0 IFNAME=p2p0 p2p_group_add persistent
         echo -n "a p2p-p2p0-0" > /sys/class/ozmo_wpan/ozwpan/bind
         wpa_cli -g@android:wpa_wlan0 IFNAME=p2p-p2p0-0 wps_pbc
         sleep 1
         remoted=$(cat sys/class/ozmo_wpan/ozwpan/devices | grep SLEEP)
done
