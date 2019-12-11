#!/system/bin/sh

su -c "svc wifi disable"
su -c "svc wifi enable"
am start -a android.settings.WIFI_IP_SETTINGS
sleep 3
input tap 223 850
sleep 20 # Here user presses home button 15-20 secs
input tap 223 300 # Simulate touch to connect the remote
