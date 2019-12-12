#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

# OZWPAN
readonly OZWPAN_DEV_FILE="/dev/ozwpan"
readonly OZWPAN_SELECT_FILE="/sys/class/ozmo_wpan/ozwpan/select"
readonly OZWPAN_MODE_FILE="/sys/class/ozmo_wpan/ozwpan/mode"
su -c "chown root:system /dev/ozwpan /sys/class/ozmo_wpan/ozwpan/select /sys/class/ozmo_wpan/ozwpan/mode"
su -c "chown root:system ${OZWPAN_DEV_FILE} ${OZWPAN_SELECT_FILE} ${OZWPAN_MODE_FILE}"
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
echo $booted
while [ "$booted" = "" ]
do
         booted=$(getprop dev.bootcomplete)
         sleep 7
         log "Waiting for boot"
done
log "Booted up"
su -c "svc wifi disable"
su -c "svc wifi enable"
am start -a android.settings.WIFI_IP_SETTINGS
sleep 3
input tap 223 850
sleep 20 # Here user presses home button 15-20 secs
input tap 223 300 # Simulate touch to connect the remote
