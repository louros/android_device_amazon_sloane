#!/system/bin/sh
PATH=/sbin:/system/sbin:/system/bin:/system/xbin

# "early-boot"
# SELinux enforce
setenforce 0
# Initialize init.d:
su -c "/system/bin/sysinit"
log "Initialized init.d support"

# "booting"
# Set some permissions before boot:
log "Change bluetooth permissions"
su -c "chmod 0666 /dev/MTK_SMI"
su -c "chown bluetooth:bluetooth /dev/stpbt"
su -c "chown bluetooth:bluetooth /dev/ttyGS0"
su -c "chmod 0666 /dev/stpbt"
su -c "chmod 0666 /dev/ttyGS0"
su -c "chown root:system /dev/ozwpan /sys/class/ozmo_wpan/ozwpan/select /sys/class/ozmo_wpan/ozwpan/mode"

# "booted"
# When device is booted:
booted=$(getprop dev.bootcomplete)
while [ "$booted" != "1" ]
do
         echo "Waiting for boot"
         $booted=$(getprop dev.bootcomplete)
done
sleep 1 # Delay for the user
su -c "svc wifi disable"
su -c "svc wifi enable"
am start -a android.settings.WIFI_IP_SETTINGS
input tap 223 850
sleep 20 # Here user presses home button 15-20 secs
input tap 223 300 # Simulate touch to connect the remote
settings --user 0 put secure show_ime_with_hard_keyboard 1
settings --user 0 put system screen_off_timeout 900000
settings --user 0 put global policy_control immersive.status=*
