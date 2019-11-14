# Extra Script
This is the extra script needed to boot LineageOS 12.1 on the Fire TV 2. 

# What's the utility of this?
This script, it's used for various reasons. The first one, and the more important, it's symlink Lineage's framework files to FireOS ones and "hijack" the framework. This is needed because we are using prebuilt boot.img and as stock kernel, SYSTEMSERVERCLASSPATH is the following:
```
export SYSTEMSERVERCLASSPATH /system/framework/services.jar:/system/framework/ethernet-service.jar:/system/framework/wifi-service.jar:/system/framework/fosinit.jar:/system/framework/fosservices.jar:/system/framework/AWSRemoteConfigurationAndroidClient.jar
```
So since in LineageOS the last 3 frameworks are not present, we symlink them with LineageOS ones.

This script is used too to disable stock recovery and flash TWRP. That part is taken from rbox's updater-script from his prerooted rom
